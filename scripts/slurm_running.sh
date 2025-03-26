#!/bin/bash
#SBATCH --job-name=TBR_runs_10           # Job name
#SBATCH --mail-user=awhitesides3@gatech.edu # E-mail address for notifications
#SBATCH --mail-type=BEGIN,END,FAIL          # Mail preferences
#SBATCH --nodes=2
#SBATCH --tasks=48
#SBATCH --mem-per-cpu=1gb
#SBATCH --time=04:55:00
#SBATCH --output=output_log/testing.out

## MODIFY FOLLOWING SECTION ##

# define sbatch nodes, ntasks-per-node, mem-per-cpu, time, output
module load anaconda3
conda activate openmc-env
pip install -e .
export OMP_NUM_THREADS=$(nproc)
echo $OMP_NUM_THREADS
# python3 arc-standard.py lead 1000 beryllium 1 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be/11_slry_1000_mlt_1_ref_0
# python3 arc-standard.py lead 250 beryllium 1 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be/11_slry_250_mlt_1_ref_0
# python3 arc-standard.py lead 200 beryllium 1 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be/11_slry_200_mlt_1_ref_0
# python3 arc-standard.py lead 150 beryllium 1 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be/11_slry_150_mlt_1_ref_0
# python3 arc-standard.py lead 100 beryllium 1 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be/11_slry_100_mlt_1_ref_0
# python3 arc-standard.py lead 50 beryllium 1 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be/11_slry_50_mlt_1_ref_0
# python3 arc-standard.py lead 1000 beryllium 0.8 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be/11_slry_1000_mlt_0.8_ref_0
# python3 arc-standard.py lead 250 beryllium 0.8 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be/11_slry_250_mlt_0.8_ref_0
# python3 arc-standard.py lead 200 beryllium 0.8 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be/11_slry_200_mlt_0.8_ref_0
# python3 arc-standard.py lead 150 beryllium 0.8 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be/11_slry_150_mlt_0.8_ref_0
# python3 arc-standard.py lead 100 beryllium 0.8 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be/11_slry_100_mlt_0.8_ref_0
# python3 arc-standard.py lead 50 beryllium 0.8 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be/11_slry_50_mlt_0.8_ref_0
# python3 arc-standard.py lead 1000 beryllium 0.6 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be/11_slry_1000_mlt_0.6_ref_0
# python3 arc-standard.py lead 250 beryllium 0.6 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be/11_slry_250_mlt_0.6_ref_0
# python3 arc-standard.py lead 200 beryllium 0.6 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be/11_slry_200_mlt_0.6_ref_0
# python3 arc-standard.py lead 150 beryllium 0.6 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be/11_slry_150_mlt_0.6_ref_0
# python3 arc-standard.py lead 100 beryllium 0.6 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be/11_slry_100_mlt_0.6_ref_0
# python3 arc-standard.py lead 50 beryllium 0.6 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be/11_slry_50_mlt_0.6_ref_0
# python3 arc-standard.py lead 1000 beryllium 0.4 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be/11_slry_1000_mlt_0.4_ref_0
# python3 arc-standard.py lead 250 beryllium 0.4 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be/11_slry_250_mlt_0.4_ref_0
# python3 arc-standard.py lead 200 beryllium 0.4 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be/11_slry_200_mlt_0.4_ref_0
# python3 arc-standard.py lead 150 beryllium 0.4 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be/11_slry_150_mlt_0.4_ref_0
# python3 arc-standard.py lead 100 beryllium 0.4 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be/11_slry_100_mlt_0.4_ref_0
# python3 arc-standard.py lead 50 beryllium 0.4 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be/11_slry_50_mlt_0.4_ref_0
# python3 arc-standard.py lead 1000 beryllium 0.2 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be/11_slry_1000_mlt_0.2_ref_0
# python3 arc-standard.py lead 250 beryllium 0.2 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be/11_slry_250_mlt_0.2_ref_0
# python3 arc-standard.py lead 200 beryllium 0.2 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be/11_slry_200_mlt_0.2_ref_0
# python3 arc-standard.py lead 150 beryllium 0.2 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be/11_slry_150_mlt_0.2_ref_0
# python3 arc-standard.py lead 100 beryllium 0.2 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be/11_slry_100_mlt_0.2_ref_0
# python3 arc-standard.py lead 50 beryllium 0.2 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be/11_slry_50_mlt_0.2_ref_0
# python3 arc-standard.py Li4SiO4 1000 lead 0.5 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Pb/13_slry_1000_mlt_0.5_ref_0
# python3 arc-standard.py Li4SiO4 250 lead 0.5 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Pb/13_slry_250_mlt_0.5_ref_0
# python3 arc-standard.py Li4SiO4 200 lead 0.5 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Pb/13_slry_200_mlt_0.5_ref_0
# python3 arc-standard.py Li4SiO4 150 lead 0.5 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Pb/13_slry_150_mlt_0.5_ref_0
# python3 arc-standard.py Li4SiO4 100 lead 0.5 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Pb/13_slry_100_mlt_0.5_ref_0
# python3 arc-standard.py Li4SiO4 50 lead 0.5 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Pb/13_slry_50_mlt_0.5_ref_0
# python3 arc-standard.py Li4SiO4 1000 lead 1 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Pb/13_slry_1000_mlt_1_ref_0
# python3 arc-standard.py Li4SiO4 250 lead 1 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Pb/13_slry_250_mlt_1_ref_0
# python3 arc-standard.py Li4SiO4 200 lead 1 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Pb/13_slry_200_mlt_1_ref_0
# python3 arc-standard.py Li4SiO4 150 lead 1 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Pb/13_slry_150_mlt_1_ref_0
# python3 arc-standard.py Li4SiO4 100 lead 1 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Pb/13_slry_100_mlt_1_ref_0
# python3 arc-standard.py Li4SiO4 50 lead 1 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Pb/13_slry_50_mlt_1_ref_0
# python3 arc-standard.py Li4SiO4 1000 lead 1.5 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Pb/13_slry_1000_mlt_1.5_ref_0
# python3 arc-standard.py Li4SiO4 250 lead 1.5 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Pb/13_slry_250_mlt_1.5_ref_0
# python3 arc-standard.py Li4SiO4 200 lead 1.5 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Pb/13_slry_200_mlt_1.5_ref_0
# python3 arc-standard.py Li4SiO4 150 lead 1.5 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Pb/13_slry_150_mlt_1.5_ref_0
python3 arc-standard.py Li4SiO4 100 lead 1.5 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Pb/13_slry_100_mlt_1.5_ref_0
python3 arc-standard.py Li4SiO4 50 lead 1.5 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Pb/13_slry_50_mlt_1.5_ref_0
python3 arc-standard.py Li4SiO4 1000 lead 2 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Pb/13_slry_1000_mlt_2_ref_0
python3 arc-standard.py Li4SiO4 250 lead 2 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Pb/13_slry_250_mlt_2_ref_0
python3 arc-standard.py Li4SiO4 200 lead 2 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Pb/13_slry_200_mlt_2_ref_0
python3 arc-standard.py Li4SiO4 150 lead 2 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Pb/13_slry_150_mlt_2_ref_0
python3 arc-standard.py Li4SiO4 100 lead 2 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Pb/13_slry_100_mlt_2_ref_0
python3 arc-standard.py Li4SiO4 50 lead 2 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Pb/13_slry_50_mlt_2_ref_0
python3 arc-standard.py lead 1000 lead 2 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Pb/14_slry_1000_mlt_2_ref_0
python3 arc-standard.py lead 250 lead 2 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Pb/14_slry_250_mlt_2_ref_0
python3 arc-standard.py lead 200 lead 2 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Pb/14_slry_200_mlt_2_ref_0
python3 arc-standard.py lead 150 lead 2 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Pb/14_slry_150_mlt_2_ref_0
python3 arc-standard.py lead 100 lead 2 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Pb/14_slry_100_mlt_2_ref_0
python3 arc-standard.py lead 50 lead 2 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Pb/14_slry_50_mlt_2_ref_0
python3 arc-standard.py lead 1000 lead 1.5 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Pb/14_slry_1000_mlt_1.5_ref_0
python3 arc-standard.py lead 250 lead 1.5 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Pb/14_slry_250_mlt_1.5_ref_0
python3 arc-standard.py lead 200 lead 1.5 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Pb/14_slry_200_mlt_1.5_ref_0
python3 arc-standard.py lead 150 lead 1.5 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Pb/14_slry_150_mlt_1.5_ref_0
python3 arc-standard.py lead 100 lead 1.5 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Pb/14_slry_100_mlt_1.5_ref_0
python3 arc-standard.py lead 50 lead 1.5 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Pb/14_slry_50_mlt_1.5_ref_0
python3 arc-standard.py lead 1000 lead 1 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Pb/14_slry_1000_mlt_1_ref_0
python3 arc-standard.py lead 250 lead 1 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Pb/14_slry_250_mlt_1_ref_0
python3 arc-standard.py lead 200 lead 1 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Pb/14_slry_200_mlt_1_ref_0
python3 arc-standard.py lead 150 lead 1 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Pb/14_slry_150_mlt_1_ref_0
python3 arc-standard.py lead 100 lead 1 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Pb/14_slry_100_mlt_1_ref_0
python3 arc-standard.py lead 50 lead 1 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Pb/14_slry_50_mlt_1_ref_0
python3 arc-standard.py lead 1000 lead 0.5 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Pb/14_slry_1000_mlt_0.5_ref_0
python3 arc-standard.py lead 250 lead 0.5 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Pb/14_slry_250_mlt_0.5_ref_0
python3 arc-standard.py lead 200 lead 0.5 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Pb/14_slry_200_mlt_0.5_ref_0
python3 arc-standard.py lead 150 lead 0.5 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Pb/14_slry_150_mlt_0.5_ref_0
python3 arc-standard.py lead 100 lead 0.5 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Pb/14_slry_100_mlt_0.5_ref_0
python3 arc-standard.py lead 50 lead 0.5 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Pb/14_slry_50_mlt_0.5_ref_0
python3 arc-standard.py tellurium 1000 beryllium 0 tellurium 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Te/20_slry_1000_mlt_0_ref_0
python3 arc-standard.py tellurium 250 beryllium 0 tellurium 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Te/20_slry_250_mlt_0_ref_0
python3 arc-standard.py tellurium 200 beryllium 0 tellurium 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Te/20_slry_200_mlt_0_ref_0
python3 arc-standard.py tellurium 150 beryllium 0 tellurium 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Te/20_slry_150_mlt_0_ref_0
python3 arc-standard.py tellurium 100 beryllium 0 tellurium 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Te/20_slry_100_mlt_0_ref_0
python3 arc-standard.py tellurium 50 beryllium 0 tellurium 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Te/20_slry_50_mlt_0_ref_0
python3 arc-standard.py Li4SiO4 0 tellurium 0.5 tellurium 0 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Te/22_slry_0_mlt_0.5_ref_0
python3 arc-standard.py Li4SiO4 0 tellurium 1 tellurium 0 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Te/22_slry_0_mlt_1_ref_0
python3 arc-standard.py Li4SiO4 0 tellurium 1.5 tellurium 0 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Te/22_slry_0_mlt_1.5_ref_0
python3 arc-standard.py Li4SiO4 0 tellurium 2 tellurium 0 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Te/22_slry_0_mlt_2_ref_0
# ... other test cases to run
date