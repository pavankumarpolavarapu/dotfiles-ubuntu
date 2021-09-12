#!/bin/bash

helpFunction()
{
   echo ""
   echo "Usage: $0 -t linkType -l linkFile -d destFile"
   echo -e "\t-t Link type"
   echo -e "\t-l Link File/Folder"
   echo -e "\t-b Target File/Folder"
   exit 1 # Exit script after printing help
}

while getopts "t:l:d:" opt
do
   case "$opt" in
      t ) linkType="$OPTARG" ;;
      l ) linkFile="$OPTARG" ;;
      d ) destFile="$OPTARG" ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

# Print helpFunction in case parameters are empty
if [ -z "$linkType" ] || [ -z "$linkFile" ] || [ -z "$destFile" ] 
then
   echo "Some or all of the parameters are empty";
   helpFunction
fi

# Begin script in case all parameters are correct

softLinker() {
	rm -rf $2
	ln -sfn $1 $2
}

hardLinker() {
	ln $1 $2
}

case "$linkType" in
	soft ) softLinker "$linkFile" "$destFile" ;;
	hard ) hardLinker "$linkFile" "$destFile" ;;
esac
