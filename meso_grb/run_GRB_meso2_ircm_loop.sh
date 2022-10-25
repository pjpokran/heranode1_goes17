#!/bin/bash

export PATH="/home/poker/miniconda3/envs/goes16_201710/bin/:$PATH"

cd /home/poker/goes17/meso_grb

cp /home/ldm/data/grb-west/meso/13/latest2.nc /dev/shm/latest_meso2_13w.nc
cmp /home/ldm/data/grb-west/meso/13/latest2.nc /dev/shm/latest_meso2_13w.nc > /dev/null
CONDITION=$?
#echo $CONDITION

while :; do

  until [ $CONDITION -eq 1 ] ; do
#     echo same
     sleep 5
     cmp /home/ldm/data/grb-west/meso/13/latest2.nc /dev/shm/latest_meso2_13w.nc > /dev/null
     CONDITION=$?
  done

#  echo different
  cp /home/ldm/data/grb-west/meso/13/latest2.nc /dev/shm/latest_meso2_13w.nc
  /home/poker/miniconda3/envs/goes16_201710/bin/python goes17_GRB_meso2_ircm.py /dev/shm/latest_meso2_13w.nc
  cmp /home/ldm/data/grb-west/meso/13/latest2.nc /dev/shm/latest_meso2_13w.nc > /dev/null
  CONDITION=$?
#  echo repeat

done




