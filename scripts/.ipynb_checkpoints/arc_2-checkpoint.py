import arc_nonproliferation as anp
import openmc
import numpy as np
import os
import sys
import xml.etree.ElementTree as ET
import matplotlib.pyplot as plt
import subprocess

# ==============================================================================
# Geometry
# ==============================================================================
def create_arc(Li6_enrichment):
    device = anp.generate_device("U", 0, Li6_enrichment = Li6_enrichment)
    
    # Plotting
    plot = openmc.Plot()
    plot.filename = 'geometry_plot'
    plot.basis = 'xz'
    plot.origin = (350, 0, 0)
    plot.width = (700, 800)
    plot.pixels = (plot.width[0]*10, plot.width[1]*10)
    
    color = ['beige', 'lightcoral', 'yellow', 'orange', 'lime', 'navy', 'lightcyan', 'black']
    color_dict = {cell.id: color[i] for i, cell in enumerate(device._cells)}
    plot.colors = color_dict
    for count, cell in enumerate(device._cells):
        print(f'Device name: {cell.name} with color: {color[count]}')
    
    #plot.highlight_domains(geometry=device.geometry, domains=device._cells)
    
    plots = openmc.Plots([plot])
    plots.export_to_xml()
    
    # ==============================================================================
    # Settings
    # ==============================================================================
    
    
    # ==============================================================================
    # Tallies
    # ==============================================================================
    # """ Cylindrical Mesh Tally """
    
    # ==============================================================================
    # Run
    # ==============================================================================
    return device
# ================================================================================
# additional runs
# ================================================================================

def make_materials_geometry_tallies(Li6_enrichment):
    """Makes a neutronics model of a blanket and simulates the TBR value.

    Arguments:
        enrichment (float): the enrichment percentage of Li6 in the breeder material
    
    Returns:
        resutsl (dict): simulation tally results for TBR along with the standard deviation and enrichment
    """
    # RUN OPENMC
    device = create_arc(Li6_enrichment)
    print(device.Li6_enrichment)
    
    #remove old output files
    for file in os.listdir('.'):
        if file.endswith('.h5'):
            os.remove(file)
    sp_filename = device.run(output = False)  # runs with reduced amount of output printing

    # OPEN OUPUT FILE
    sp = openmc.StatePoint(sp_filename)

    tbr_tally = sp.get_tally(name='Tbr Blanket Tally')

    df = tbr_tally.get_pandas_dataframe()
    print(df)
    df.to_csv('dataframe.csv')
    tbr_tally_result = df['mean'].sum()
    tbr_tally_std_dev = df['std. dev.'].sum()

    # command = ["openmc-plot-mesh-tally", sp_filename]
    # # Run the command
    # subprocess.run(command)
    
    return {'enrichment': device.Li6_enrichment,
            'tbr_tally_result': tbr_tally_result,
            'tbr_tally_std_dev': tbr_tally_std_dev}

results = []
for enrichment in [7.5, 100]:  # percentage enrichment from 0% Li6 to 100% Li6
    results.append(make_materials_geometry_tallies(enrichment))
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
plt.show()
# ================================================================================
try:
    if sys.argv[1] is not None:
        os.mkdir(str(sys.argv[1]))
        device.move_files(str(sys.argv[1]))
        print("OpenMC files moved to new directory:", str(sys.argv[1]))

except:
    print("No directory specified, using this one")