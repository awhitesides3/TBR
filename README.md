# This started as a copy of JBall/arc-nonproliferation

# (arc-H3) awhitesides3/TBR
An OpenMC-based repo for studying trends in the tritium breeding ratio (TBR) in ARC-class fusion reactors.

## Installation and Setup
This repo requires OpenMC and its depenencies. Install it from source and use the latest developent build. To learn how to install OpenMC from source, visit the official website [openmc.org](https://www.openmc.org).

The repo is built around a custom python package. After installing OpenMC from source, navigate to the repo directory and run:

`pip install -e .`

to install the custom API localy.

## File Structure and Organization

This repository is built around a custom python api called `arc_2` which includes classes, functions, and data which is helpful in conducting analyses of ARC-class reactors. This API is based off of JBall/arc-nonproliferation which was adpoted from one originally developed by Ethan Peterson for the Fall 2022 edition of MIT's course 22.63 Engineering Principles for Fusion Reactors, taught by Dennis Whyte.

### arc_2
The following descriptions are taken directly from the README.md in JBall/arc-nonproliferation
"
#### device.py
The device class inherits from the OpenMC model class, and is designed to allow for the rapid parametric generation of ARC OpenMC models with FLiBe doped with a specified amount of fertile material. This is achieved using the `generate_device()` function. This allows for many models with varying fertile inventories, dopant types, and lithium enrichments to be generated and simulated in a single script.

#### constants.py

Containts useful constant values which can be easily accessed across scripts. Includes things like neutrons / MJ, and the path to the OpenMC chain file to use.

#### materials.py

This file contains definitions for all of the materials used in the OpenMC simulations, along with functions for generating FLiBe materials doped with specific masses of Thorium or Uranium.

#### postprocess.py

This file contains useful helper functions which can be applied across simulation type to extract useful information from OpenMC statepoint and depletion results files. This includes functions for computing the time to breed a significant quantity and compute the isotopic purity of fissile material.

### data

This directory contains supporting data files, like outputs from stochastic volume calculations, lists of points which specify vacuum vessel and blanket geometries, and OpenMC chain files.

### openmc_scripts
The openmc_scripts directory contains all scripts which run OpenMC simulations and analyze the resulting data. The different types of simulations are each in separate directories.
"-JBall/arc

The purpose of the repo (JBall/arc-nonproliferation), which is the basis of awhitesides3/TBR, is stated below.
"
## Accompanying Manuscript

Results generated with this repo were used to prepare the manuscript "Assesing the risk of proliferation via fissile breeding in ARC-class fusion reactors" a preprint of which can be found on the arXiv at the following link: [https://arxiv.org/abs/2404.12451](https://arxiv.org/abs/2404.12451).
"-JBall/arc-nonproliferation

## Important Files
All of the TBR analysis is performed in the 'scripts' folder. The script 'arc-standard.py' is the main script that was used to runs the openmc simulations. 'backup_arc-standard.py' is an older version that was used to construct the TBR vs enrichment trends that are described in the 'Initial Results' section of the Senior Design Report 'Optimization Of Tritium Breeding Blankets In Arc Fusion Designs' which is a deliverable for the class, NRE-4351 (NRE Capstone), at the Georgia Institute of Technology, taught by Dr. Bojan Petrovic in Spring 2025. The 'arc-standard.py' was used to run the simulations that yield the optimal design case which is presented in the section 'Design Overview' from the report. Additionally, all of the simulation runs are performed in the Instructional Cluster Environment (“ICE”), an educational resource that is used for high computing purposes. Because of this a .sh file is used to runs the cases through queueing system that is available through ICE. The 'slurm_running.sh' file is where all runs should be performed. 


## Guide For Running Cases
The following is a description of all of the cases ran, how to run them in the .sh file, and the naming convention.

### parameters

enrichment(fixed)
dopant
dopant_mass
multiplier_material
multiplier_thickness
reflector_material
reflector_thickness
channel_thickness
order
output_path

### computer parameters/specifications

threads
nodes
etc...

### order configs**

first-order, '1': as seen in the literature, with the multiplier at the end of the FLiBe1. Also, with the addition of a reflector at the end of FLiBe2.
second-order, '2': split FLiBe2 in half.

### cmd line config

||python3 arc.py dopant dopant_mass multiplier_material multiplier_thickness reflector_material reflector_thickness channel_thickness order output_path||

### old cases

1: bare  

	--> ||python3 arc-standard.py Li4SiO4 0 beryllium 0 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/bare||
	--> Configuration '1', bare.

 
2: beryllium at end of FLiBe1  

	--> ||python3 arc-standard.py Li4SiO4 0 beryllium 1 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Be||
	--> Configuration '1' with a 1cm beryllium multiplier, no dopant, and no reflector.

 
3: lithium orthosilicate doping  

	--> ||python3 arc-standard.py Li4SiO4 100 beryllium 0 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4||
	--> Configuration '1' doped with 100 wppm Li4SiO4, no multiplier, and no reflector.

 
4: variable FLiBe1 thickness  

	--> ||python3 arc-standard.py Li4SiO4 0 beryllium 0 lead 0 7 1 /home/hice1/awhitesides3/TBR/scripts/channel||
	--> Configuration '1', bare with 7cm FLiBe1.  


### new cases

all of these runs were performed using 'backup_arc-standard.py'.
must add the folder name at the end of the directory for the specific thicknesses of each region.  
structure for folder name: ||#_slry_x_mlt_y_ref_z||

'#' = case number as listed in this document, x = wppm of dopant, y = mlt thickness, z = ref thickness
scientific expression: 1 = 1e0, 0.1 = 1e-1, 10 = 1e1


1a,2a,3a,4a: higher accuracy for old cases  

	--> no changes to cmd line statement 

 
5: beryllium at end of FLiBe1 & lead at end of FLiBe2  

	--> ||python3 arc-standard.py Li4SiO4 0 beryllium 1 lead 1 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Be_ref_Pb||
	--> Configuration '1' with a 1cm beryllium multiplier, a 1cm lead reflector, and no dopant.

 
6: lead at end of FLiBe1  

	--> ||python3 arc-standard.py Li4SiO4 0 lead 1 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Pb||
	--> Configuration '1' with a 1cm lead multiplier, no dopant, and no reflector.

 
7: lead at end of FLiBe1 and lead at end of FLiBe2  

	--> ||python3 arc-standard.py Li4SiO4 0 lead 1 lead 1 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Pb_ref_Pb||
	--> Configuration '1' with a 1cm lead multiplier, a 1cm lead reflector, and no dopant.

 
8: lead doping  

	--> ||python3 arc-standard.py lead 100 beryllium 0 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb||
	--> Configuration '1', doped with 100 wppm lead, no multiplier, and no reflector.

 
9: Li4SiO4 doping with beryllium at end of FLiBe1  

	--> ||python3 arc-standard.py Li4SiO4 100 beryllium 1 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be||
	--> Configuration '1' doped with 100 wppm Li4SiO4, a 1cm beryllium multiplier, and no reflector.

 
10: Li4SiO4 doping with beryllium at end of FLiBe1 and lead at the end of FLiBe2 ****holding beryllium multiplier constant at 1cm****  

	--> ||python3 arc-standard.py Li4SiO4 100 beryllium 1 lead 1 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be_ref_Pb||
	--> Configuration '1' doped with 100 wppm Li4SiO4, a 1cm beryllium multiplier, and a 1cm lead. reflector.


11: lead doping with beryllium at the end of FLiBe1  

	--> ||python3 arc-standard.py lead 100 beryllium 1 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be||
	--> Configuration '1' doped with 100 wppm lead, a 1cm beryllium multiplier, and no reflector.

 
12: lead doping with beryllium at the end of FLiBe1 and lead at the end of FLiBe2  

	--> ||python3 arc-standard.py lead 100 beryllium 1 lead 1 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Be_ref_Pb||
	--> Configuration '1' doped with 100 wppm Pb, a 1cm beryllium multiplier, and a 1cm lead.

 
13: Li4SiO4 doping with lead at end of FLiBe1  

	--> ||python3 arc-standard.py Li4SiO4 100 lead 1 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Pb||
	--> Configuration '1' doped with 100 wppm Li4SiO4 and a 1cm lead multiplier

 
14: lead doping with lead at the end of FLiBe1  

	--> ||python3 arc-standard.py lead 100 lead 1 lead 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Pb_mlt_Pb||
	--> Configuration '1' doped with 100 wppm Pb and a 1cm lead multiplier

 
15: Te doping with Te at the end of FLiBe1 and Te at the end of FLiBe2  

	--> ||python3 arc-standard.py "tellurium" 100 tellurium 1 tellurium 1 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Te_mlt_Te_ref_Te||
	--> Configuration '1' doped with 100 wppm Te, a 1cm Te multiplier, and a 1cm Te.

 
16: Li4SiO4 doping with Te at end of FLiBe1 and Te at the end of FLiBe2  

	--> ||python3 arc-standard.py Li4SiO4 100 tellurium 1 tellurium 1 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Te_ref_Te||
	--> Configuration '1' doped with 100 wppm Li4SiO4, a 1cm tellurium multiplier, and a 1cm tellurium. reflector.

 
17: Te doping with beryllium at the end of FLiBe1 and Te at the end of FLiBe2  

	--> ||python3 arc-standard.py tellurium 100 beryllium 1 tellurium 1 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Te_mlt_Be_ref_Te||
	--> Configuration '1' doped with 100 wppm Te, a 1cm beryllium multiplier, and a 1cm tellurium.

 
18: tellurium doping with beryllium at the end of FLiBe1  

	--> ||python3 arc-standard.py tellurium 100 beryllium 1 tellurium 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Te_mlt_Be||
	--> Configuration '1' doped with 100 wppm Te, a 1cm beryllium multiplier, and no reflector.

 
19: Li4SiO4 doping with beryllium at end of FLiBe1 and Te at the end of FLiBe2  

	--> ||python3 arc-standard.py Li4SiO4 100 beryllium 1 tellurium 1 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Li4SiO4_mlt_Be_ref_Te||
	--> Configuration '1' doped with 100 wppm Li4SiO4, a 1cm beryllium multiplier, and a 1cm Te reflector.

 
20: tellurium doping  

	--> ||python3 arc-standard.py tellurium 100 beryllium 0 tellurium 0 2 1 /home/hice1/awhitesides3/TBR/scripts/slry_Te||
	--> Configuration '1', doped with 100 wppm Te, no multiplier, and no reflector.

 
21: Te at end of FLiBe1 and Te at end of FLiBe2  

	--> ||python3 arc-standard.py Li4SiO4 0 tellurium 1 tellurium 1 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Te_ref_Te||
	--> Configuration '1' with a 1cm Te multiplier, a 1cm Te reflector, and no dopant.

 
22: Te at end of FLiBe1  

	--> ||python3 arc-standard.py Li4SiO4 0 tellurium 1 tellurium 0 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Te||
	--> Configuration '1' with a 1cm Te multiplier, no dopant, and no reflector.

 
23: beryllium at end of FLiBe1 & Te at end of FLiBe2  

	--> ||python3 arc-standard.py Li4SiO4 0 beryllium 1 tellurium 1 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Be_ref_Te||
	--> Configuration '1' with a 1cm beryllium multiplier, a 1cm Te reflector, and no dopant.


24: lead at end of FLiBe2  

	--> ||python3 arc-standard.py Li4SiO4 0 beryllium 0 lead 1 2 1 /home/hice1/awhitesides3/TBR/scripts/ref_Pb||
	--> Configuration '1' a 1cm lead reflector, no multiplier, and no dopant.

 
25: beryllium at end of FLiBe2  

	--> ||python3 arc-standard.py Li4SiO4 0 beryllium 0 beryllium 1 2 1 /home/hice1/awhitesides3/TBR/scripts/ref_Be||
	--> Configuration '1' a 1cm beryllium reflector, no multiplier, and no dopant.

 
26: beryllium at end of FLiBe1 & beryllium at end of FLiBe2  

	--> ||python3 arc-standard.py Li4SiO4 0 beryllium 1 beryllium 1 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Be_ref_Be||
	--> Configuration '1' with a 1cm beryllium multiplier, a 1cm beryllium reflector, and no dopant.

 
27: Zr at end of FLiBe1  

	--> ||python3 arc-standard.py Li4SiO4 0 zirconium 1 zirconium 0 2 1 /home/hice1/awhitesides3/TBR/scripts/mlt_Zr||
	--> Configuration '1' with a 1cm Zr multiplier, no dopant, and no reflector.

 
"

notes

division of FLiBe2 into halves  

	--> ||python3 arc-standard.py Li4SiO4 0 beryllium 0 lead 0 2 2||
	--> Configuration '2', bare.



All reflector implementations are removed from cases 12 and onward. After analysis of the earlier cases was performed, it was clear that the effect from the reflector is negligible.
This means that cases 12 and some others are removed as there are the same as other cases when the reflector is removed***


Optimal Design runs (using arc-standard.py): The range for dopant mass can be edited directly in the script. To change the multiplier thicknesses, you just change the argument in the run command. 

	--> ||python3 arc-standard.py lead lead 10 lead 0 2 1 0 beryllium 0 /home/hice1/awhitesides3/TBR/scripts/shielding_test_2/optimal_case||
	--> ||python3 arc-standard.py lead lead 0 lead 0 2 1 0 beryllium 0 /home/hice1/awhitesides3/TBR/scripts/shielding_test_2/bare_case||






