#!/bin/bash

export PATH="/home/poker/miniconda3/envs/goes17_201811/bin/:$PATH"
#sleep 42
cd /home/poker/goes17/meso_grb

cp /home/ldm/data/grb/meso/02/latest1.nc /dev/shm/latest_meso1_visw.nc
cmp /home/ldm/data/grb/meso/02/latest1.nc /dev/shm/latest_meso1_visw.nc > /dev/null
CONDITION=$?
#echo $CONDITION

while :; do

  until [ $CONDITION -eq 1 ] ; do
#     echo same
     sleep 5
     cmp /home/ldm/data/grb-west/meso/02/latest1.nc /dev/shm/latest_meso1_visw.nc > /dev/null
     CONDITION=$?
  done

#  echo different
  cp /home/ldm/data/grb-west/meso/02/latest1.nc /dev/shm/latest_meso1_visw.nc
  /home/poker/miniconda3/envs/goes17_201811/bin/python goes17_GRB_meso1_vis_sqrt.py /dev/shm/latest_meso1_visw.nc
  /home/poker/miniconda3/envs/goes17_201811/bin/python goes17_GRB_meso1_vis.py /dev/shm/latest_meso1_visw.nc
  cmp /home/ldm/data/grb-west/meso/02/latest1.nc /dev/shm/latest_meso1_visw.nc > /dev/null
  CONDITION=$?
#  echo repeat

done

