#!/bin/bash
#SBATCH --job-name=TBR_runs_11           # Job name
#SBATCH --mail-user=awhitesides3@gatech.edu # E-mail address for notifications
#SBATCH --mail-type=BEGIN,END,FAIL          # Mail preferences
#SBATCH --nodes=2
#SBATCH --tasks=48
#SBATCH --mem-per-cpu=1gb
#SBATCH --time=04:00:00
#SBATCH --output=output_log/testing.out

## MODIFY FOLLOWING SECTION ##

# define sbatch nodes, ntasks-per-node, mem-per-cpu, time, output
module load anaconda3
conda activate openmc-env
pip install -e .
export OMP_NUM_THREADS=$(nproc)
echo $OMP_NUM_THREADS
python3 arc-standard.py Li4SiO4 0 beryllium 0 lead 2 2 1 /home/hice1/awhitesides3/TBR/scripts/ref_Pb/24_slry_0_mlt_0_ref_2
python3 arc-standard.py Li4SiO4 0 beryllium 0 lead 1.5 2 1 /home/hice1/awhitesides3/TBR/scripts/ref_Pb/24_slry_0_mlt_0_ref_1.5
python3 arc-standard.py Li4SiO4 0 beryllium 0 lead 1 2 1 /home/hice1/awhitesides3/TBR/scripts/ref_Pb/24_slry_0_mlt_0_ref_1
python3 arc-standard.py Li4SiO4 0 beryllium 0 lead 0.5 2 1 /home/hice1/awhitesides3/TBR/scripts/ref_Pb/24_slry_0_mlt_0_ref_0.5
python3 arc-standard.py Li4SiO4 0 beryllium 0 beryllium 1 2 1 /home/hice1/awhitesides3/TBR/scripts/ref_Be/25_slry_0_mlt_0_ref_1
python3 arc-standard.py Li4SiO4 0 beryllium 0 beryllium 0.8 2 1 /home/hice1/awhitesides3/TBR/scripts/ref_Be/25_slry_0_mlt_0_ref_0.8
python3 arc-standard.py Li4SiO4 0 beryllium 0 beryllium 0.6 2 1 /home/hice1/awhitesides3/TBR/scripts/ref_Be/25_slry_0_mlt_0_ref_0.6
python3 arc-standard.py Li4SiO4 0 beryllium 0 beryllium 0.4 2 1 /home/hice1/awhitesides3/TBR/scripts/ref_Be/25_slry_0_mlt_0_ref_0.4
python3 arc-standard.py Li4SiO4 0 beryllium 0 beryllium 0.2 2 1 /home/hice1/awhitesides3/TBR/scripts/ref_Be/25_slry_0_mlt_0_ref_0.2
python3 arc-standard.py Li4SiO4 0 beryllium 0.2 beryllium 0.2 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Be_ref_Be/26_slry_0_mlt_0.2_ref_0.2
python3 arc-standard.py Li4SiO4 0 beryllium 0.2 beryllium 0.4 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Be_ref_Be/26_slry_0_mlt_0.2_ref_0.4
python3 arc-standard.py Li4SiO4 0 beryllium 0.2 beryllium 0.6 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Be_ref_Be/26_slry_0_mlt_0.2_ref_0.6
python3 arc-standard.py Li4SiO4 0 beryllium 0.2 beryllium 0.8 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Be_ref_Be/26_slry_0_mlt_0.2_ref_0.8
python3 arc-standard.py Li4SiO4 0 beryllium 0.2 beryllium 1 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Be_ref_Be/26_slry_0_mlt_0.2_ref_1
python3 arc-standard.py Li4SiO4 0 beryllium 0.4 beryllium 0.2 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Be_ref_Be/26_slry_0_mlt_0.4_ref_0.2
python3 arc-standard.py Li4SiO4 0 beryllium 0.4 beryllium 0.4 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Be_ref_Be/26_slry_0_mlt_0.4_ref_0.4
python3 arc-standard.py Li4SiO4 0 beryllium 0.4 beryllium 0.6 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Be_ref_Be/26_slry_0_mlt_0.4_ref_0.6
python3 arc-standard.py Li4SiO4 0 beryllium 0.4 beryllium 0.8 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Be_ref_Be/26_slry_0_mlt_0.4_ref_0.8
python3 arc-standard.py Li4SiO4 0 beryllium 0.4 beryllium 1 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Be_ref_Be/26_slry_0_mlt_0.4_ref_1
python3 arc-standard.py Li4SiO4 0 beryllium 0.6 beryllium 0.2 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Be_ref_Be/26_slry_0_mlt_0.6_ref_0.2
python3 arc-standard.py Li4SiO4 0 beryllium 0.6 beryllium 0.4 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Be_ref_Be/26_slry_0_mlt_0.6_ref_0.4
python3 arc-standard.py Li4SiO4 0 beryllium 0.6 beryllium 0.6 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Be_ref_Be/26_slry_0_mlt_0.6_ref_0.6
python3 arc-standard.py Li4SiO4 0 beryllium 0.6 beryllium 0.8 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Be_ref_Be/26_slry_0_mlt_0.6_ref_0.8
python3 arc-standard.py Li4SiO4 0 beryllium 0.6 beryllium 1 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Be_ref_Be/26_slry_0_mlt_0.6_ref_1
python3 arc-standard.py Li4SiO4 0 beryllium 0.8 beryllium 0.2 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Be_ref_Be/26_slry_0_mlt_0.8_ref_0.2
python3 arc-standard.py Li4SiO4 0 beryllium 0.8 beryllium 0.4 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Be_ref_Be/26_slry_0_mlt_0.8_ref_0.4
python3 arc-standard.py Li4SiO4 0 beryllium 0.8 beryllium 0.6 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Be_ref_Be/26_slry_0_mlt_0.8_ref_0.6
python3 arc-standard.py Li4SiO4 0 beryllium 0.8 beryllium 0.8 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Be_ref_Be/26_slry_0_mlt_0.8_ref_0.8
python3 arc-standard.py Li4SiO4 0 beryllium 0.8 beryllium 1 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Be_ref_Be/26_slry_0_mlt_0.8_ref_1
python3 arc-standard.py Li4SiO4 0 beryllium 1 beryllium 0.2 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Be_ref_Be/26_slry_0_mlt_1_ref_0.2
python3 arc-standard.py Li4SiO4 0 beryllium 1 beryllium 0.4 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Be_ref_Be/26_slry_0_mlt_1_ref_0.4
python3 arc-standard.py Li4SiO4 0 beryllium 1 beryllium 0.6 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Be_ref_Be/26_slry_0_mlt_1_ref_0.6
python3 arc-standard.py Li4SiO4 0 beryllium 1 beryllium 0.8 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Be_ref_Be/26_slry_0_mlt_1_ref_0.8
python3 arc-standard.py Li4SiO4 0 beryllium 1 beryllium 1 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Be_ref_Be/26_slry_0_mlt_1_ref_1
# ... other test cases to run
date