
## Loads paths for Blasr and PBJelly
source /home/shared/PBSuite_15.8.24/setup.sh
source /home/sean/Documents/pitchfork/deployment/setup-env.sh


## Sequentially executes the different PBJelly steps.
python /home/shared/PBSuite_15.8.24/bin/Jelly.py setup ~/Documents/Oly_gap_filling/Protocol3.xml
python /home/shared/PBSuite_15.8.24/bin/Jelly.py mapping ~/Documents/Oly_gap_filling/Protocol3.xml
python /home/shared/PBSuite_15.8.24/bin/Jelly.py support ~/Documents/Oly_gap_filling/Protocol3.xml
python /home/shared/PBSuite_15.8.24/bin/Jelly.py extraction ~/Documents/Oly_gap_filling/Protocol3.xml
python /home/shared/PBSuite_15.8.24/bin/Jelly.py assembly ~/Documents/Oly_gap_filling/Protocol3.xml -x "--nproc=14"
python /home/shared/PBSuite_15.8.24/bin/Jelly.py output ~/Documents/Oly_gap_filling/Protocol3.xml


