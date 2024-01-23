#!/bin/bash

################################################################################
# Help                                                                         #
################################################################################
help()
{
   # Display Help
   echo "Link all the files to the Home directory."
   echo
   echo "Syntax: $0 [options]"
   echo "options:"
   echo "-h This message."
   echo "-r Do the actual linking."
   echo "-d Delete if exists."
   echo
}

# Get the absolute path of the script
SCRIPT_NAME=$(basename "$0")
DEST_DIR=$HOME

NO_DRY=false
DELETE=false

while getopts ":hrd" option; do
	case $option in
		h) # display Help
			help
			exit;;
		r)
			NO_DRY=true
			;;
		d)
			DELETE=true
			;;
		\?) # incorrect option
			echo "Error: Invalid option"
			exit;;
	esac
done

export DEST_DIR
export NO_DRY
export DELETE


function create_link() {
	if [ $NO_DRY = false ]; then
		echo "Linking $1"
		exit
	fi

	echo -n "Linking $1 ... "

	local source_file="$1"
	local target_file="$DEST_DIR/$source_file"
	
	mkdir -p "$(dirname "$target_file")" 2> /dev/null

	if [ $DELETE = true ]; then
		echo -n "(deleting if exists)"
		[ -e $target_file ] && rm $target_file
	fi

	ln -s "$(realpath $source_file)" "$target_file" 2> /dev/null

	if [ $? -eq 0 ]; then
		echo OK
	elif [ $? -eq 1 ]; then
		echo EXISTS
	else
		echo FAIL
	fi
}

export -f create_link

# Find all files (excluding the script itself) and create symbolic links
pushd dots/

find . -type f -exec /bin/bash -c 'create_link "$0"' {} \;

popd
echo "Symbolic links created successfully."
