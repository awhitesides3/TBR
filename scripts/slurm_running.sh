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
# python3 arc-standard.py lead beryllium 0.5 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be_final_mesh/mlt_0.5
# python3 arc-standard.py lead beryllium 1 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be_final_mesh/mlt_1
# python3 arc-standard.py lead beryllium 1.5 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be_final_mesh/mlt_1.5
# python3 arc-standard.py lead beryllium 2 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be_final_mesh/mlt_2
# python3 arc-standard.py lead beryllium 2.5 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be_final_mesh/mlt_2.5
# python3 arc-standard.py lead beryllium 3 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be_final_mesh/mlt_3
# python3 arc-standard.py lead beryllium 3.5 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be_final_mesh/mlt_3.5
# python3 arc-standard.py lead beryllium 4 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be_final_mesh/mlt_4
# python3 arc-standard.py lead beryllium 4.5 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be_final_mesh/mlt_4.5
# python3 arc-standard.py lead beryllium 5 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be_final_mesh/mlt_5
# python3 arc-standard.py lead beryllium 5.5 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be_final_mesh/mlt_5.5
# python3 arc-standard.py lead beryllium 6 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be_final_mesh/mlt_6
# python3 arc-standard.py lead beryllium 6.5 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be_final_mesh/mlt_6.5
# python3 arc-standard.py lead beryllium 7 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be_final_mesh/mlt_7
# python3 arc-standard.py lead beryllium 7.5 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be_final_mesh/mlt_7.5
# python3 arc-standard.py lead beryllium 8 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be_final_mesh/mlt_8
# python3 arc-standard.py lead beryllium 8.5 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be_final_mesh/mlt_8.5
# python3 arc-standard.py lead beryllium 9 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be_final_mesh/mlt_9
# python3 arc-standard.py lead beryllium 9.5 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be_final_mesh/mlt_9.5
# python3 arc-standard.py lead beryllium 10 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be_final_mesh/mlt_10
# python3 arc-standard.py lead beryllium 10.5 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be_final_mesh/mlt_10.5
# python3 arc-standard.py lead beryllium 11 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be_final_mesh/mlt_11
# python3 arc-standard.py lead beryllium 11.5 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be_final_mesh/mlt_11.5
# python3 arc-standard.py lead beryllium 12 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be_final_mesh/mlt_12
# ... other test cases to run
date