#!/bin/bash

# Terminal colours
bold_red='\033[1;31m'
reset_text='\033[0m'
white_underline='\033[4;37m'

if [ "$#" -eq  "0" ]; then
	echo -e "$bold_red""Whoopsies.\nNo arguments passed!$reset_text"
	echo ""
	echo "Keep this script in the tuxguitar-2.0beta/tuxguitar-simons-build-scripts folder."
	echo ""
	echo -e "$white_underline""Description:$reset_text"
	echo -e "\tUsed to compare 3 versions of the TuxGuitar code."
	echo -e "\t\tTuxGuitar-v2.0's previous git commit."
	echo -e "\t\tTuxGuitar-v2.0's current git commit."
	echo -e "\t\tTuxguitar-v1.x's similar file."
	echo ""
	echo -e "\tWhilst backporting changes, we can now jump to any git commit in TuxGuitar-v2.0,"
	echo -e "\tlook at the changes in a file for the commit we're on, and"
	echo -e "\tcompare this to the file in the TuxGuitar-v1.x folder."
	echo ""
	echo -e "$white_underline""How to use:$reset_text"
	echo -e "\tcd tuxguitar-2.0beta"
	echo -e "\t# Compare different versions of the README.md file."
	echo -e "\t./tuxguitar-simons-build-scripts/meld_merge.sh README.md"
	echo ""
	echo -e "$white_underline""Example:$reset_text"
	echo -e "\tTry this example where the README.md file was updated."
	echo -e "\tWe can see the change that was made to this version of README.md,"
	echo -e "\tand compare it to the README.md in TuxGuitar-v1.x"
	echo -e "\t\tcd tuxguitar-2.0beta"
	echo -e "\t\tgit checkout 52f94768a51946a43357a29a9bee1b08264b967f"
	echo -e "\t\t./tuxguitar-simons-build-scripts/merger.sh README.md"
	echo ""
	echo -e "$bold_red""Warnings:$reset_text"
	echo -e "\tNotice the files from tuxguitar-2.0beta are copies and any changes will not be updated."
	echo -e "\tChanges to the TuxGuitar-v2.0 files will NOT be updated. These are temp files that are deleted afterwards."
	echo -e "\tChanges to the TuxGuitar-v1.x file will however be updated, this is the file on the right hand side of the screen."
	echo ""
	echo -e "\tThis must be ran from the root tuxguitar-2.0beta folder."
	exit
else
	tmp_head_file=$(mktemp -t XXXXXXXXXX.__current_commit)
	tmp_prev_commit_file=$(mktemp -t XXXXXXXXXX.__previous_commit)
	
	git show HEAD:"$1"  > $tmp_head_file
	git show HEAD^:"$1" > $tmp_prev_commit_file
	
	meld $tmp_prev_commit_file $tmp_head_file "../tuxguitar/$1"
	
	rm $tmp_head_file
	rm $tmp_prev_commit_file
fi

