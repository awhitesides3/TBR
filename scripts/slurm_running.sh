#!/bin/bash
#SBATCH --job-name=TBR_runs_11           # Job name
#SBATCH --mail-user=awhitesides3@gatech.edu # E-mail address for notifications
#SBATCH --mail-type=BEGIN,END,FAIL          # Mail preferences
#SBATCH --nodes=2
#SBATCH --tasks=48
#SBATCH --mem-per-cpu=1gb
#SBATCH --time=00:10:00
#SBATCH --output=output_log/testing.out

## MODIFY FOLLOWING SECTION ##

# define sbatch nodes, ntasks-per-node, mem-per-cpu, time, output
module load anaconda3
conda activate openmc-env
pip install -e .
export OMP_NUM_THREADS=$(nproc)
echo $OMP_NUM_THREADS
python3 arc-standard.py lead lead 1 lead 0 2 2 0 beryllium 0 /home/hice1/awhitesides3/TBR/scripts/split_flibe_testing/test_slry_Pb_mlt_Pb_mlt_1
# ... other test cases to run
date