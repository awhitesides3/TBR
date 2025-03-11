import arc_2 as anp
import openmc
import numpy as np
import os
import sys
import xml.etree.ElementTree as ET
import matplotlib.pyplot as plt
import subprocess
import pandas as pd

openmc.config["cross_sections"] = '/home/hice1/awhitesides3/endfb-viii.0-hdf5/cross_sections.xml'

# ==============================================================================
# Geometry
# ==============================================================================
def create_arc(Li6_enrichment, dopant, dopant_mass, multiplier_material, multiplier_thickness, reflector_material, reflector_thickness, channel_thickness, order):
    device = anp.generate_device(Li6_enrichment = Li6_enrichment, dopant = dopant, dopant_mass = dopant_mass,
                                multiplier_material = multiplier_material, multiplier_thickness = multiplier_thickness, reflector_material = reflector_material,
                                reflector_thickness = reflector_thickness, channel_thickness = channel_thickness, order = order)
    
    # Plotting
    plot = openmc.Plot()
    plot.filename = 'geometry_plot'
    plot.basis = 'xz'
    plot.origin = (350, 0, 0)
    plot.width = (700, 800)
    plot.pixels = (plot.width[0]*10, plot.width[1]*10)
    plot.color_by = 'cell'

    # plot.cell_colors = { device._cells[0].id: 'beige', device._cells[1].id: 'lightcoral', device._cells[2].id: 'yellow', device._cells[3].id: 'orange', device._cells[4].id: 'lime', device._cells[5].id: 'navy', device._cells[6].id: 'lightcyan', device._cells[7].id: 'black'}
    # color = ['beige', 'lightcoral', 'yellow', 'orange', 'lime', 'navy', 'lightcyan', 'black']
    # color_dict = {cell.id: color[i] for i, cell in enumerate(device._cells)}
    # plot.colors = color_dict
    # for count, cell in enumerate(device._cells):
    #     print(f'Device name: {cell.name} with color: {color[count]}')
    
    # plot.highlight_domains(geometry=device.geometry, domains=device._cells)
    
    plots = openmc.Plots([plot])
    plots.export_to_xml()
    
    # ==============================================================================
    # Settings
    # ==============================================================================
    
    """ Source Definition """
    source = openmc.Source()
    source.space = openmc.stats.CylindricalIndependent(openmc.stats.Discrete(400, 1), openmc.stats.Uniform(a=-np.pi/18, b=np.pi/18), openmc.stats.Discrete(0, 1)) # original openmc.stats.Discrete(450, 1), openmc.stats.Uniform(a=-np.pi/18, b=np.pi/18)
    source.angles = openmc.stats.Isotropic()
    source.energy = openmc.stats.Discrete([14.1E6], [1.0])
    
    device.settings.source = source
    # energy filter
    # energy_filter = openmc.EnergyFilter.from_group_structure("CCFE-709")
    # ==============================================================================
    # Blanket Material
    # ==============================================================================
    # breeding_material = openmc.Material(material_id = 56)  # Pb84.2Li15.8
    # breeding_material.add_element('Pb', 84.2)
    # breeding_material.add_element('Li', 15.8)
    # breeding_material.set_density('g/cm3', 11.)
    # device.blanket.fill = breeding_material
    # ==============================================================================
    # Tallies
    # ==============================================================================
    # """ Cylindrical Mesh Tally """
    r_grid = np.linspace(0, 600, num=25) #[NEW] original: (25, 200, num=25), 0, 600
    z_grid = np.linspace(-700, 700, num=50) #[NEW] original: (-200, 200, num=50), -700, 700
    mesh = openmc.CylindricalMesh(r_grid=r_grid, z_grid=z_grid) #[NEW]
    mesh.phi_grid = np.array([0, (2 * np.pi)/(18 * 2)])
    mesh_filter = openmc.MeshFilter(mesh)
    
    device.add_tally('Mesh Tally', ['flux', '(n,Xt)', 'heating-local', 'absorption'], filters=[mesh_filter])
    
    # """ TBR Tally """
    # tbr_filter1 = openmc.MaterialFilter(anp.tungsten)
    # device.add_tally('Tbr Plasma-facing Component Tally ', ['(n,Xt)', 'fission', 'kappa-fission', 'fission-q-prompt', 'fission-q-recoverable', 'heating', 'heating-local'], filters=[tbr_filter1])
    
    # tbr_filter2 = openmc.MaterialFilter(device.vcrti_VV)
    # device.add_tally('Tbr Vacuum Vessel Tally ', ['(n,Xt)', 'fission', 'kappa-fission', 'fission-q-prompt', 'fission-q-recoverable', 'heating', 'heating-local'], filters=[tbr_filter2])
    
    # tbr_filter3 = openmc.MaterialFilter(device.doped_flibe_channels)
    tbr_filter3 = openmc.CellFilter(device.get_cell(name = 'channel'))
    device.add_tally('TBR Channel Tally', ['(n,Xt)'], nuclides = ['Li6', 'Li7'], filters = [tbr_filter3])
    
    # tbr_filter4 = openmc.MaterialFilter(device.vcrti_BI)
    # device.add_tally('Tbr Tank Inner Tally ', ['(n,Xt)', 'fission', 'kappa-fission', 'fission-q-prompt', 'fission-q-recoverable', 'heating', 'heating-local'], filters=[tbr_filter4])

    tbr_filter5 = openmc.CellFilter(device.get_cell(name = 'blanket'))
    # tbr_filter5 = openmc.MaterialFilter(device.doped_flibe_blanket) #device.doped_flibe, initially wanted 'doped_mat' which doesn't exist
    device.add_tally('TBR Blanket Tally', ['(n,Xt)'], nuclides = ['Li6', 'Li7'], filters = [tbr_filter5])
    
    # tbr_filter6 = openmc.MaterialFilter(device.vcrti_BO)
    # device.add_tally('Tbr Tank Outer Tally ', ['(n,Xt)', 'fission', 'kappa-fission', 'fission-q-prompt', 'fission-q-recoverable', 'heating', 'heating-local'], filters=[tbr_filter6])
    
    # ==============================================================================
    # Run
    # ==============================================================================
    
    device.settings.photon_transport = True
    device.survival_biasing = True
    device.build()
    device.export_to_xml(remove_surfs=True)
    
    geometry_plot = "geometry_plot.png"
    if not os.path.exists(geometry_plot):
         openmc.plot_geometry() #path_input = 'plots.xml'
    
    # set run parameters
    device.settings.threads = 10
    device.settings.particles = int(1e3)
    device.settings.batches = 10  
    device.settings.inactive = 1  

    return device
# ================================================================================
# additional runs
# ================================================================================

def make_materials_geometry_tallies(Li6_enrichment, dopant = str(sys.argv[1]), float(dopant_mass = sys.argv[2]),
                                multiplier_material = sys.argv[3], multiplier_thickness = float(sys.argv[4]), reflector_material = sys.argv[5],
                                reflector_thickness = float(sys.argv[6]), channel_thickness = float(sys.argv[7]), order = sys.argv[8]):
    """Makes a neutronics model of a blanket and simulates the TBR value.

    Arguments:
        enrichment (float): the enrichment percentage of Li6 in the breeder material
    
    Returns:
        resutsl (dict): simulation tally results for TBR along with the standard deviation and enrichment
    """
    # RUN OPENMC
    device = create_arc(Li6_enrichment, dopant, dopant_mass, multiplier_material, multiplier_thickness, reflector_material, reflector_thickness, channel_thickness, order)
    print(device.Li6_enrichment)
    
    #remove old output files
    for file in os.listdir('.'):
        if file.endswith('.h5'):
            os.remove(file)
    sp_filename = device.run(output = False)  # runs with reduced amount of output printing

    # OPEN OUPUT FILE
    sp = openmc.StatePoint(sp_filename)

    tbr_tally = sp.get_tally(name='TBR Blanket Tally')
    tbr_tally_2 = sp.get_tally(name='TBR Channel Tally')

    df = tbr_tally.get_pandas_dataframe()
    df2 = tbr_tally_2.get_pandas_dataframe()
    print(df)
    print(df2)
    combined_df = pd.concat([df, df2], ignore_index = True)
    combined_df.to_csv(f'Be_1cm_{device.Li6_enrichment}%.csv', index = False)
    tbr_tally_result = df['mean'].sum() + df2['mean'].sum()
    tbr_tally_std_dev = df['std. dev.'].sum() + df2['mean'].sum()

    # command = ["openmc-plot-mesh-tally", sp_filename]
    # # Run the command
    # subprocess.run(command)
    
    return {'enrichment': device.Li6_enrichment,
            'tbr_tally_result': tbr_tally_result,
            'tbr_tally_std_dev': tbr_tally_std_dev}

results = []
for Li6_enrichment in [0.01, 7.5, 15, 25, 50, 75, 99.99]:  # percentage enrichment from 0% Li6 to 100% Li6
    results.append(make_materials_geometry_tallies(Li6_enrichment, str(sys.argv[1]), float(sys.argv[2]),
                    sys.argv[3], float(sys.argv[4]), sys.argv[5],
                    float(sys.argv[6]), float(sys.argv[7]), sys.argv[8]))
print(results)
#results.append(make_materials_geometry_tallies(7.5))
# PLOTS RESULTS
x = [entry['enrichment'] for entry in results]
y = [entry['tbr_tally_result'] for entry in results]
#error_y = {'array': [entry['tbr_tally_std_dev'] for entry in results]}
plt.plot(x, y)
plt.title="TBR as a function of Li6 enrichment",
plt.xtitle="Li6 enrichment (%)",
plt.ytitle="TBR"
plt.grid()
plt.show()
# ================================================================================
'''
try:
    if sys.argv[1] is not None:
        os.mkdir(str(sys.argv[1]))
        device.move_files(str(sys.argv[1]))
        print("OpenMC files moved to new directory:", str(sys.argv[1]))

except:
    print("No directory specified, using this one")
'''
# =============================================
# tally plot
# =============================================
# out_file = ""
# for file in os.listdir('.'):
#     if file.endswith('.h5'):
#         if file != "summary.h5":
#             out_file = file
# command = ["openmc-plot-mesh-tally", out_file]
# # Run the command
# subprocess.run(command)