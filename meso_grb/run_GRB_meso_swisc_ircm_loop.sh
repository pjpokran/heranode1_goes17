#!/bin/bash

export PATH="/home/poker/miniconda3/envs/goes16_201710/bin/:$PATH"

cd /home/poker/goes16/meso_grb

cp /home/ldm/data/grb/meso/13/latest2.nc /dev/shm/latest_mesoswisc2_ircm.nc
cp /home/ldm/data/grb/meso/13/latest1.nc /dev/shm/latest_mesoswisc1_ircm.nc
cmp /home/ldm/data/grb/meso/13/latest2.nc /dev/shm/latest_mesoswisc2_ircm.nc > /dev/null
CONDITION=$?
#echo $CONDITION

while :; do

  until [ $CONDITION -eq 1 ] ; do
#     echo same
     sleep 5
     cmp /home/ldm/data/grb/meso/13/latest2.nc /dev/shm/latest_mesoswisc2_ircm.nc > /dev/null
     CONDITION=$?
  done

#  echo different
  cp /home/ldm/data/grb/meso/13/latest2.nc /dev/shm/latest_mesoswisc2_ircm.nc
  cp /home/ldm/data/grb/meso/13/latest1.nc /dev/shm/latest_mesoswisc1_ircm.nc
  /home/poker/miniconda3/envs/goes16_201710/bin/python goes16_GRB_meso_swisc_ircm.py /dev/shm/latest_mesoswisc1_ircm.nc /dev/shm/latest_mesoswisc2_ircm.nc
#  /home/poker/miniconda3/envs/goes16_201710/bin/python goes16_GRB_meso_swisc_vis.py /dev/shm/latest_mesoswisc1_vis.nc /dev/shm/latest_mesoswisc2_vis.nc
  cmp /home/ldm/data/grb/meso/13/latest2.nc /dev/shm/latest_mesoswisc2_ircm.nc > /dev/null
  CONDITION=$?
#  echo repeat

done




