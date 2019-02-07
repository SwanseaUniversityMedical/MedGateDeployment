echo '--------------'
echo '-  MedGATE   -'
echo '--------------'
echo ''
echo '==> Resetting MedGATE service'

reset(){
   sudo sh stop.sh
   sudo sh remove.sh
   echo 'Removing data volumes'
   sudo docker volume rm docker_esdata docker_pgdata 2>/dev/null
   echo 'Removing local files'
   sudo rm /gcp /medgate /brat-cfg /brat-data -rf
   echo '==> Done'
}

read -p "WARNING: this will remove everything (including your uploaded documents) associated with the MedGATE instance, continue (y/n)?" choice
case "$choice" in
 y|Y )
   reset;;
 n|N )
   echo "Reset process stopped";;
 * )
   echo "Invalid option";;
esac
