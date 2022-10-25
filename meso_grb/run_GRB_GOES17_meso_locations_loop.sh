#!/bin/bash

export PATH="/home/poker/miniconda3/envs/goes17_201811/bin/:$PATH"
cd /home/poker/goes17/meso_grb

while :; do

#  echo different
  /home/poker/miniconda3/envs/goes17_201811/bin/python goes17-GRB_meso_locations_ircm_orig_proj.py /dev/shm/latest_meso1_13w.nc /dev/shm/latest_meso2_13w.nc
  sleep 300

done





# /home/poker/miniconda3/envs/goes16_201710/bin/python goes17_GRB_meso1_ircm.py /home/ldm/data/grb-west/meso/13/latest1.nc


