#!/bin/bash
#SBATCH --job-name=TBR_runs_4           # Job name
#SBATCH --mail-user=awhitesides3@gatech.edu # E-mail address for notifications
#SBATCH --mail-type=BEGIN,END,FAIL          # Mail preferences
#SBATCH --nodes=2
#SBATCH --tasks=48
#SBATCH --mem-per-cpu=1gb
#SBATCH --time=04:30:00
#SBATCH --output=output_log/testing.out

## MODIFY FOLLOWING SECTION ##

# define sbatch nodes, ntasks-per-node, mem-per-cpu, time, output
module load anaconda3
conda activate openmc-env
pip install -e .
export OMP_NUM_THREADS=$(nproc)
echo $OMP_NUM_THREADS
# python3 arc-standard.py Li4SiO4 0 lead 2 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Pb/6_slry_0_mlt_2_ref_0
# python3 arc-standard.py Li4SiO4 0 lead 1.5 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Pb/6_slry_0_mlt_1.5_ref_0
# python3 arc-standard.py Li4SiO4 0 lead 1 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Pb/6_slry_0_mlt_1_ref_0
# python3 arc-standard.py Li4SiO4 0 lead 0.5 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Pb/6_slry_0_mlt_0.5_ref_0
# python3 arc-standard.py Li4SiO4 0 lead 1 lead 2 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Pb_ref_Pb/7_slry_0_mlt_1_ref_2
# python3 arc-standard.py Li4SiO4 0 lead 1 lead 1.5 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Pb_ref_Pb/7_slry_0_mlt_1_ref_1.5
# python3 arc-standard.py Li4SiO4 0 lead 1 lead 1 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Pb_ref_Pb/7_slry_0_mlt_1_ref_1
# python3 arc-standard.py Li4SiO4 0 lead 1 lead 0.5 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Pb_ref_Pb/7_slry_0_mlt_1_ref_0.5
# python3 arc-standard.py Li4SiO4 0 lead 0.8 lead 2 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Pb_ref_Pb/7_slry_0_mlt_0.8_ref_2
# python3 arc-standard.py Li4SiO4 0 lead 0.8 lead 1.5 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Pb_ref_Pb/7_slry_0_mlt_0.8_ref_1.5
# python3 arc-standard.py Li4SiO4 0 lead 0.8 lead 1 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Pb_ref_Pb/7_slry_0_mlt_0.8_ref_1
# python3 arc-standard.py Li4SiO4 0 lead 0.8 lead 0.5 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Pb_ref_Pb/7_slry_0_mlt_0.8_ref_0.5
# python3 arc-standard.py Li4SiO4 0 lead 0.6 lead 2 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Pb_ref_Pb/7_slry_0_mlt_0.6_ref_2
# python3 arc-standard.py Li4SiO4 0 lead 0.6 lead 1.5 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Pb_ref_Pb/7_slry_0_mlt_0.6_ref_1.5
# python3 arc-standard.py Li4SiO4 0 lead 0.6 lead 1 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Pb_ref_Pb/7_slry_0_mlt_0.6_ref_1
# python3 arc-standard.py Li4SiO4 0 lead 0.6 lead 0.5 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Pb_ref_Pb/7_slry_0_mlt_0.6_ref_0.5
# python3 arc-standard.py Li4SiO4 0 lead 0.4 lead 2 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Pb_ref_Pb/7_slry_0_mlt_0.4_ref_2
# python3 arc-standard.py Li4SiO4 0 lead 0.4 lead 1.5 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Pb_ref_Pb/7_slry_0_mlt_0.4_ref_1.5
# python3 arc-standard.py Li4SiO4 0 lead 0.4 lead 1 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Pb_ref_Pb/7_slry_0_mlt_0.4_ref_1
# python3 arc-standard.py Li4SiO4 0 lead 0.4 lead 0.5 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Pb_ref_Pb/7_slry_0_mlt_0.4_ref_0.5
# python3 arc-standard.py Li4SiO4 0 lead 0.2 lead 2 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Pb_ref_Pb/7_slry_0_mlt_0.2_ref_2
# python3 arc-standard.py Li4SiO4 0 lead 0.2 lead 1.5 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Pb_ref_Pb/7_slry_0_mlt_0.2_ref_1.5
# python3 arc-standard.py Li4SiO4 0 lead 0.2 lead 1 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Pb_ref_Pb/7_slry_0_mlt_0.2_ref_1
# python3 arc-standard.py Li4SiO4 0 lead 0.2 lead 0.5 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Pb_ref_Pb/7_slry_0_mlt_0.2_ref_0.5
# python3 arc-standard.py lead 10 beryllium 0 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb/8_slry_10_mlt_0_ref_0
# python3 arc-standard.py lead 25 beryllium 0 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb/8_slry_25_mlt_0_ref_0
# python3 arc-standard.py lead 50 beryllium 0 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb/8_slry_50_mlt_0_ref_0
# python3 arc-standard.py lead 75 beryllium 0 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb/8_slry_75_mlt_0_ref_0
# python3 arc-standard.py lead 100 beryllium 0 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb/8_slry_100_mlt_0_ref_0
# python3 arc-standard.py lead 150 beryllium 0 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb/8_slry_150_mlt_0_ref_0
# python3 arc-standard.py lead 200 beryllium 0 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb/8_slry_200_mlt_0_ref_0
# python3 arc-standard.py lead 250 beryllium 0 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb/8_slry_250_mlt_0_ref_0
# python3 arc-standard.py lead 300 beryllium 0 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb/8_slry_300_mlt_0_ref_0
# python3 arc-standard.py lead 350 beryllium 0 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb/8_slry_350_mlt_0_ref_0
# python3 arc-standard.py lead 400 beryllium 0 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb/8_slry_400_mlt_0_ref_0
# python3 arc-standard.py lead 500 beryllium 0 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb/8_slry_500_mlt_0_ref_0
# python3 arc-standard.py lead 600 beryllium 0 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb/8_slry_600_mlt_0_ref_0
# python3 arc-standard.py lead 800 beryllium 0 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb/8_slry_800_mlt_0_ref_0
# python3 arc-standard.py lead 1000 beryllium 0 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb/8_slry_1000_mlt_0_ref_0
# python3 arc-standard.py Li4SiO4 1000 beryllium 1 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_1000_mlt_1_ref_0
# python3 arc-standard.py Li4SiO4 250 beryllium 1 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_250_mlt_1_ref_0
# python3 arc-standard.py Li4SiO4 200 beryllium 1 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_200_mlt_1_ref_0
# python3 arc-standard.py Li4SiO4 150 beryllium 1 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_150_mlt_1_ref_0
# python3 arc-standard.py Li4SiO4 100 beryllium 1 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_100_mlt_1_ref_0
# python3 arc-standard.py Li4SiO4 50 beryllium 1 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_50_mlt_1_ref_0
# python3 arc-standard.py Li4SiO4 1000 beryllium 0.8 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_1000_mlt_0.8_ref_0
# python3 arc-standard.py Li4SiO4 250 beryllium 0.8 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_250_mlt_0.8_ref_0
# python3 arc-standard.py Li4SiO4 200 beryllium 0.8 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_200_mlt_0.8_ref_0
# python3 arc-standard.py Li4SiO4 150 beryllium 0.8 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_150_mlt_0.8_ref_0
# python3 arc-standard.py Li4SiO4 100 beryllium 0.8 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_100_mlt_0.8_ref_0
# python3 arc-standard.py Li4SiO4 50 beryllium 0.8 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_50_mlt_0.8_ref_0
# python3 arc-standard.py Li4SiO4 1000 beryllium 0.6 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_1000_mlt_0.6_ref_0
# python3 arc-standard.py Li4SiO4 250 beryllium 0.6 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_250_mlt_0.6_ref_0
# python3 arc-standard.py Li4SiO4 200 beryllium 0.6 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_200_mlt_0.6_ref_0
# python3 arc-standard.py Li4SiO4 150 beryllium 0.6 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_150_mlt_0.6_ref_0
# python3 arc-standard.py Li4SiO4 100 beryllium 0.6 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_100_mlt_0.6_ref_0
# python3 arc-standard.py Li4SiO4 50 beryllium 0.6 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_50_mlt_0.6_ref_0
# python3 arc-standard.py Li4SiO4 1000 beryllium 0.4 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_1000_mlt_0.4_ref_0
# python3 arc-standard.py Li4SiO4 250 beryllium 0.4 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_250_mlt_0.4_ref_0
# python3 arc-standard.py Li4SiO4 200 beryllium 0.4 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_200_mlt_0.4_ref_0
# python3 arc-standard.py Li4SiO4 150 beryllium 0.4 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_150_mlt_0.4_ref_0
# python3 arc-standard.py Li4SiO4 100 beryllium 0.4 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_100_mlt_0.4_ref_0
# python3 arc-standard.py Li4SiO4 50 beryllium 0.4 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_50_mlt_0.4_ref_0
# python3 arc-standard.py Li4SiO4 1000 beryllium 0.2 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_1000_mlt_0.2_ref_0
# python3 arc-standard.py Li4SiO4 250 beryllium 0.2 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_250_mlt_0.2_ref_0
# python3 arc-standard.py Li4SiO4 200 beryllium 0.2 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_200_mlt_0.2_ref_0
# python3 arc-standard.py Li4SiO4 150 beryllium 0.2 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_150_mlt_0.2_ref_0
# python3 arc-standard.py Li4SiO4 100 beryllium 0.2 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_100_mlt_0.2_ref_0
# python3 arc-standard.py Li4SiO4 50 beryllium 0.2 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_50_mlt_0.2_ref_0
# python3 arc-standard.py Li4SiO4 1000 beryllium 1 lead 2 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be_ref_Pb/10_slry_1000_mlt_1_ref_2
# python3 arc-standard.py Li4SiO4 250 beryllium 1 lead 2 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be_ref_Pb/10_slry_250_mlt_1_ref_2
# python3 arc-standard.py Li4SiO4 200 beryllium 1 lead 2 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be_ref_Pb/10_slry_200_mlt_1_ref_2
# python3 arc-standard.py Li4SiO4 150 beryllium 1 lead 2 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be_ref_Pb/10_slry_150_mlt_1_ref_2
# python3 arc-standard.py Li4SiO4 100 beryllium 1 lead 2 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be_ref_Pb/10_slry_100_mlt_1_ref_2
# python3 arc-standard.py Li4SiO4 50 beryllium 1 lead 2 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be_ref_Pb/10_slry_50_mlt_1_ref_2
# python3 arc-standard.py Li4SiO4 1000 beryllium 1 lead 1.5 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be_ref_Pb/10_slry_1000_mlt_1_ref_1.5
# python3 arc-standard.py Li4SiO4 250 beryllium 1 lead 1.5 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be_ref_Pb/10_slry_250_mlt_1_ref_1.5
# python3 arc-standard.py Li4SiO4 200 beryllium 1 lead 1.5 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be_ref_Pb/10_slry_200_mlt_1_ref_1.5
# python3 arc-standard.py Li4SiO4 150 beryllium 1 lead 1.5 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be_ref_Pb/10_slry_150_mlt_1_ref_1.5
# python3 arc-standard.py Li4SiO4 100 beryllium 1 lead 1.5 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be_ref_Pb/10_slry_100_mlt_1_ref_1.5
# python3 arc-standard.py Li4SiO4 50 beryllium 1 lead 1.5 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be_ref_Pb/10_slry_50_mlt_1_ref_1.5
# python3 arc-standard.py Li4SiO4 1000 beryllium 1 lead 1 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be_ref_Pb/10_slry_1000_mlt_1_ref_1
# python3 arc-standard.py Li4SiO4 250 beryllium 1 lead 1 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be_ref_Pb/10_slry_250_mlt_1_ref_1
# python3 arc-standard.py Li4SiO4 200 beryllium 1 lead 1 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be_ref_Pb/10_slry_200_mlt_1_ref_1
# python3 arc-standard.py Li4SiO4 150 beryllium 1 lead 1 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be_ref_Pb/10_slry_150_mlt_1_ref_1
# python3 arc-standard.py Li4SiO4 100 beryllium 1 lead 1 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be_ref_Pb/10_slry_100_mlt_1_ref_1
# python3 arc-standard.py Li4SiO4 50 beryllium 1 lead 1 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be_ref_Pb/10_slry_50_mlt_1_ref_1
# python3 arc-standard.py Li4SiO4 1000 beryllium 1 lead 0.5 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be_ref_Pb/10_slry_1000_mlt_1_ref_0.5
# python3 arc-standard.py Li4SiO4 250 beryllium 1 lead 0.5 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be_ref_Pb/10_slry_250_mlt_1_ref_0.5
# python3 arc-standard.py Li4SiO4 200 beryllium 1 lead 0.5 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be_ref_Pb/10_slry_200_mlt_1_ref_0.5
# python3 arc-standard.py Li4SiO4 150 beryllium 1 lead 0.5 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be_ref_Pb/10_slry_150_mlt_1_ref_0.5
# python3 arc-standard.py Li4SiO4 100 beryllium 1 lead 0.5 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be_ref_Pb/10_slry_100_mlt_1_ref_0.5
# python3 arc-standard.py Li4SiO4 50 beryllium 1 lead 0.5 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be_ref_Pb/10_slry_50_mlt_1_ref_0.5

python3 arc-standard.py lead 100 beryllium 1 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be

python3 arc-standard.py Li4SiO4 1000 beryllium 1 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_1000_mlt_1_ref_0
python3 arc-standard.py Li4SiO4 250 beryllium 1 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_250_mlt_1_ref_0
python3 arc-standard.py Li4SiO4 200 beryllium 1 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_200_mlt_1_ref_0
python3 arc-standard.py Li4SiO4 150 beryllium 1 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_150_mlt_1_ref_0
python3 arc-standard.py Li4SiO4 100 beryllium 1 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_100_mlt_1_ref_0
python3 arc-standard.py Li4SiO4 50 beryllium 1 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_50_mlt_1_ref_0
python3 arc-standard.py Li4SiO4 1000 beryllium 0.8 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_1000_mlt_0.8_ref_0
python3 arc-standard.py Li4SiO4 250 beryllium 0.8 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_250_mlt_0.8_ref_0
python3 arc-standard.py Li4SiO4 200 beryllium 0.8 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_200_mlt_0.8_ref_0
python3 arc-standard.py Li4SiO4 150 beryllium 0.8 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_150_mlt_0.8_ref_0
python3 arc-standard.py Li4SiO4 100 beryllium 0.8 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_100_mlt_0.8_ref_0
python3 arc-standard.py Li4SiO4 50 beryllium 0.8 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_50_mlt_0.8_ref_0
python3 arc-standard.py Li4SiO4 1000 beryllium 0.6 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_1000_mlt_0.6_ref_0
python3 arc-standard.py Li4SiO4 250 beryllium 0.6 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_250_mlt_0.6_ref_0
python3 arc-standard.py Li4SiO4 200 beryllium 0.6 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_200_mlt_0.6_ref_0
python3 arc-standard.py Li4SiO4 150 beryllium 0.6 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_150_mlt_0.6_ref_0
python3 arc-standard.py Li4SiO4 100 beryllium 0.6 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_100_mlt_0.6_ref_0
python3 arc-standard.py Li4SiO4 50 beryllium 0.6 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_50_mlt_0.6_ref_0
python3 arc-standard.py Li4SiO4 1000 beryllium 0.4 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_1000_mlt_0.4_ref_0
python3 arc-standard.py Li4SiO4 250 beryllium 0.4 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_250_mlt_0.4_ref_0
python3 arc-standard.py Li4SiO4 200 beryllium 0.4 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_200_mlt_0.4_ref_0
python3 arc-standard.py Li4SiO4 150 beryllium 0.4 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_150_mlt_0.4_ref_0
python3 arc-standard.py Li4SiO4 100 beryllium 0.4 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_100_mlt_0.4_ref_0
python3 arc-standard.py Li4SiO4 50 beryllium 0.4 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_50_mlt_0.4_ref_0
python3 arc-standard.py Li4SiO4 1000 beryllium 0.2 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_1000_mlt_0.2_ref_0
python3 arc-standard.py Li4SiO4 250 beryllium 0.2 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_250_mlt_0.2_ref_0
python3 arc-standard.py Li4SiO4 200 beryllium 0.2 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_200_mlt_0.2_ref_0
python3 arc-standard.py Li4SiO4 150 beryllium 0.2 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_150_mlt_0.2_ref_0
python3 arc-standard.py Li4SiO4 100 beryllium 0.2 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_100_mlt_0.2_ref_0
python3 arc-standard.py Li4SiO4 50 beryllium 0.2 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be/9_slry_50_mlt_0.2_ref_0
# ... other test cases to run
date