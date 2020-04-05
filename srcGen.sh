#!/bin/env zsh

project_name="";
group_id="";
description="";

# Ask user for info about project
ask_for_info(){
	echo "Enter name of your project"
	read project_name;
	echo "Enter Group ID"
	read group_id;
	echo "Enter description of your project"
	read description;
}

# Create basic maven structure for new project, initialize pom.xml and .gitignore files
generate_project(){

	mkdir $project_name;
	cd $project_name;

	separator="\."
	new_separator="\/"
	group_id_with_slashes=$(echo $group_id | sed "s/$separator/$new_separator/g")

	mkdir -p "src/main/java/$group_id_with_slashes"
	mkdir -p "src/main/resources"
	mkdir -p "src/test/java/$group_id_with_slashes"
	mkdir -p "src/test/resources"

	curl -s -o pom.xml https://gist.githubusercontent.com/WojTechM/fc0ae9ea6809693ce3872504f0a4c0f7/raw/98b8a0e7f1838041803c3803228ac7378fa963ff/pom.xml
	sed -i"" "s/#GROUP_ID/$group_id/g" pom.xml
	sed -i"" "s/#PROJECT_NAME/$project_name/g" pom.xml
	sed -i"" "s/#DESCRIPTION/$description/g" pom.xml

	curl -s -o .gitignore https://gist.githubusercontent.com/WojTechM/9a5a83d6ac2da1c04859854eb1f3a35e/raw/274af75d67089d5f50c4215bed345f6e026cb708/.gitignore
}

ask_for_info
generate_project
