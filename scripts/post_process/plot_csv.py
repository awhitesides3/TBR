import os
import pandas as pd
import math
import matplotlib.pyplot as plt

def consolidate_csv_files(input_directory):
    mean_data = pd.DataFrame()
    stddev_data = pd.DataFrame()
    mean_data['enrichment'] = [0.01, 7.5, 15, 25, 50, 75, 99.99]
    stddev_data['enrichment'] = [0.01, 7.5, 15, 25, 50, 75, 99.99]
    mean_data['bare'] = [0.428365167,
                        1.176862447,
                        1.209729528,
                        1.223575556,
                        1.220874813,
                        1.206134367,
                        1.189121384]
    stddev_data['bare'] = [0.000474573,
                        0.000587528,
                        0.001251596,
                        0.001272486,
                        0.001310144,
                        0.00113424,
                        0.001036591,
                        ]
    pp_csv_files = [f for f in os.listdir(input_directory) if f.endswith('pp.csv')]

    for file in pp_csv_files:
        file_path = os.path.join(input_directory, file)
        df = pd.read_csv(file_path)
        mean_data[f'{file}'] = df['mean']
        stddev_data[f'{file}'] = df['std. dev.']

    mean_data.to_csv(f'{input_directory}/{input_directory[-7:]}_mean_data.csv', index=False)
    stddev_data.to_csv(f'{input_directory}/{input_directory[-7:]}_stddev_data.csv', index=False)

    # Plot each column (except the first one) as a separate data series
    stddev_list = []
    for column in stddev_data.columns[1:]:
        stddev_list.append(stddev_data[column])
    i = 0
    for column in mean_data.columns[1:]:
        plt.errorbar(mean_data[mean_data.columns[0]], mean_data[column], yerr=stddev_list[i], fmt='-o', label=f'{column}', capsize=5)
        i+=1
    
    # Add labels and title
    plt.xlabel('Li6-enrichment')
    plt.ylabel('TBR')
    plt.title(f'TBR as a function of Li-6 enrichment for the {input_directory[-7:]} case')
    
    # Show legend
    plt.legend()
    # Show the plot
    plt.grid(True)
    plt.savefig(f'{input_directory}/{input_directory[-7:]}_plot.png', dpi=300)
consolidate_csv_files(r'/home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4')