import os
import pandas as pd
import math
import matplotlib.pyplot as plt
import sys

def consolidate_csv_files(input_dir, keyword):
    input_directory = f'{input_dir}'
    output_path = f'{input_dir}.csv'

    consolidated_data = pd.DataFrame()
    tbr_mean = []
    tbr_stddev = []
    enrichment = []
    csv_files = [f for f in os.listdir(input_directory) if f.endswith('.csv')]

    for file in csv_files:
        file_path = os.path.join(input_directory, file)
        df = pd.read_csv(file_path)
        df['enrichment'] = file

        file_column_values = df.loc[:, 'enrichment']
        for index, value in enumerate(file_column_values):
            df.loc[index, 'enrichment'] = float(value.replace('%.csv', ''))
        
        enrichment.append(df.loc[0, 'enrichment'])
        tbr_mean.append(sum(df.loc[:, 'mean']))

        # sqrt(sum(x^2))
        sq_stddev = [x ** 2 for x in df.loc[:, 'std. dev.']]
        tbr_stddev.append(math.sqrt(sum(sq_stddev)))

        consolidated_data = pd.concat([consolidated_data, df], ignore_index=True)
    consolidated_data = consolidated_data.sort_values(by = 'enrichment')
    
    # Pair the lists together using zip
    paired_lists = list(zip(enrichment, tbr_mean, tbr_stddev))
    # Sort the paired lists based on the first list (list1)
    paired_lists.sort(key=lambda x: x[0])
    # Separate the lists after sorting
    sorted_list1, sorted_list2, sorted_list3 = zip(*paired_lists)
    enrichment = list(sorted_list1)
    tbr_mean = list(sorted_list2)
    tbr_stddev = list(sorted_list3)

    consolidated_data.to_csv(output_path, index=False)

    pp_data = pd.DataFrame()
    pp_data['enrichment'] = enrichment
    pp_data['mean'] = tbr_mean
    pp_data['std. dev.'] = tbr_stddev

    output_path_2 = output_path.replace('.csv', '_pp.csv')
    pp_data.to_csv(output_path_2, index = False)

    #plot data from the data_pp
    y = pp_data.loc[:, 'mean']
    x = pp_data.loc[:, 'enrichment']
    err = pp_data.loc[:, 'std. dev.']
    plt.errorbar(x, y, yerr=err, fmt='-o', label=f'{keyword}', capsize=5)
    plt.xlabel('Li6 enrichment')
    plt.ylabel('TBR')    
    plt.title(f'TBR as a function of Li-6 enrichment for the {keyword} case')
    plt.grid(True)
    plt.legend()
    plt.savefig(f'{output_path[:-4]}.png', dpi=300)
    # print(f"consolidated csv files into {output_path}")

# consolidate_csv_files(r'/home/hice1/awhitesides3/TBR/scripts/mlt_Be_ref_Pb/5_slry_0_mlt_0.8_ref_2',
#                       r'/home/hice1/awhitesides3/TBR/scripts/mlt_Be_ref_Pb/5_slry_0_mlt_0.8_ref_2.csv',
#                       'mlt_Be_ref_Pb')

# consolidate_csv_files(str(sys.argv[1]), str(sys.argv[2])) 

# arg examples:
# arg1: /home/hice1/awhitesides3/TBR/scripts/mlt_Be_ref_Pb/5_slry_0_mlt_0.8_ref_2
# arg2: mlt_Be_ref_Pb
# cmd line example:
# python3 csv_scripts.py /home/hice1/awhitesides3/TBR/scripts/mlt_Be_ref_Pb/5_slry_0_mlt_0.8_ref_2 mlt_Be_ref_Pb

directory_path = f'{str(sys.argv[1])}'

for folder_name in os.listdir(directory_path):
    folder_path = os.path.join(directory_path, folder_name)

    if os.path.isdir(folder_path):
        print(f"Folder: {folder_name}")
        print(f"Path: {folder_path}")
        plt.clf() #to stop overwriting plots
        consolidate_csv_files(folder_path, folder_name) 
