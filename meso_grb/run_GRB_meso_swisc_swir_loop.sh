#!/bin/bash

export PATH="/home/poker/miniconda3/envs/goes16_201710/bin/:$PATH"

cd /home/poker/goes16/meso_grb

cp /home/ldm/data/grb/meso/07/latest2.nc /dev/shm/latest_mesoswisc2_swir.nc
cp /home/ldm/data/grb/meso/07/latest1.nc /dev/shm/latest_mesoswisc1_swir.nc
cmp /home/ldm/data/grb/meso/07/latest2.nc /dev/shm/latest_mesoswisc2_swir.nc > /dev/null
CONDITION=$?
#echo $CONDITION

while :; do

  until [ $CONDITION -eq 1 ] ; do
#     echo same
     sleep 5
     cmp /home/ldm/data/grb/meso/07/latest2.nc /dev/shm/latest_mesoswisc2_swir.nc > /dev/null
     CONDITION=$?
  done

#  echo different
  cp /home/ldm/data/grb/meso/07/latest2.nc /dev/shm/latest_mesoswisc2_swir.nc
  cp /home/ldm/data/grb/meso/07/latest1.nc /dev/shm/latest_mesoswisc1_swir.nc
  /home/poker/miniconda3/envs/goes16_201710/bin/python goes16_GRB_meso_swisc_swir.py /dev/shm/latest_mesoswisc1_swir.nc /dev/shm/latest_mesoswisc2_swir.nc
#  /home/poker/miniconda3/envs/goes16_201710/bin/python goes16_GRB_meso_swisc_vis.py /dev/shm/latest_mesoswisc1_vis.nc /dev/shm/latest_mesoswisc2_vis.nc
  cmp /home/ldm/data/grb/meso/07/latest2.nc /dev/shm/latest_mesoswisc2_swir.nc > /dev/null
  CONDITION=$?
#  echo repeat

done




