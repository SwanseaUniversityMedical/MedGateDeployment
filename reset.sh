echo '--------------'
echo '-  MedGATE   -'
echo '--------------'
echo ''
echo '==> Resetting MedGATE service'

reset(){
   sh stop.sh
   sh remove.sh
   echo 'Removing data volumes'
   docker volume rm docker_esdata docker_pgdata 2>/dev/null
   echo 'Removing local files'
   rm /gcp /medgate /brat-cfg /brat-data -rf
   sh run.sh
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
