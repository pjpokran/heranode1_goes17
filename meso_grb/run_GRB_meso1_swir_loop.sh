#!/bin/bash

export PATH="/home/poker/miniconda3/envs/goes17_201811/bin/:$PATH"
#sleep 42
cd /home/poker/goes17/meso_grb

cp /home/ldm/data/grb-west/meso/07/latest1.nc /dev/shm/latest_meso1_07w.nc
cmp /home/ldm/data/grb/meso-west/07/latest1.nc /dev/shm/latest_meso1_07w.nc > /dev/null
CONDITION=$?
#echo $CONDITION

while :; do

  until [ $CONDITION -eq 1 ] ; do
#     echo same
     sleep 5
     cmp /home/ldm/data/grb-west/meso/07/latest1.nc /dev/shm/latest_meso1_07w.nc > /dev/null
     CONDITION=$?
  done

#  echo different
  cp /home/ldm/data/grb-west/meso/07/latest1.nc /dev/shm/latest_meso1_07w.nc
  /home/poker/miniconda3/envs/goes17_201811/bin/python goes17_GRB_meso1_swir.py /dev/shm/latest_meso1_07w.nc
  cmp /home/ldm/data/grb-west/meso/07/latest1.nc /dev/shm/latest_meso1_07w.nc > /dev/null
  CONDITION=$?
#  echo repeat

done





/home/poker/miniconda3/envs/goes16_201710/bin/python goes16_GRB_meso1_swir.py /home/ldm/data/grb/meso/07/latest1.nc


