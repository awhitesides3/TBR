#!/bin/bash
#SBATCH --job-name=TBR_runs_11           # Job name
#SBATCH --mail-user=awhitesides3@gatech.edu # E-mail address for notifications
#SBATCH --mail-type=BEGIN,END,FAIL          # Mail preferences
#SBATCH --nodes=2
#SBATCH --tasks=48
#SBATCH --mem-per-cpu=1gb
#SBATCH --time=00:30:00
#SBATCH --output=output_log/testing.out

## MODIFY FOLLOWING SECTION ##

# define sbatch nodes, ntasks-per-node, mem-per-cpu, time, output
module load anaconda3
conda activate openmc-env
pip install -e .
export OMP_NUM_THREADS=$(nproc)
echo $OMP_NUM_THREADS
python3 arc-standard.py lead lead 10 lead 0 2 1 0 beryllium 0 /home/hice1/awhitesides3/TBR/scripts/shielding_test_2/optimal_case
python3 arc-standard.py lead lead 0 lead 0 2 1 0 beryllium 0 /home/hice1/awhitesides3/TBR/scripts/shielding_test_2/bare_case
# ... other test cases to run
date