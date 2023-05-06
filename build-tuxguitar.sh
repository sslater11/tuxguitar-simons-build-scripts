#!/bin/bash

# Put this script in the root tuxguitar directory.

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
build_dir=$( realpath "$script_dir/../build-scripts/tuxguitar-linux-x86_64" )

cd "$build_dir"

rm -Rf target/

# Install swt 4.11
path_to_swt=$build_dir/swt-4.11-gtk-linux-x86_64/swt.jar
mvn install:install-file -Dfile=$path_to_swt -DartifactId=org.eclipse.swt.gtk.linux.x86_64 -Dpackaging=jar -DgroupId=org.eclipse.swt -Dversion=4.11

# Install swt 4.12
path_to_swt=$build_dir/swt-4.12-gtk-linux-x86_64/swt.jar
mvn install:install-file -Dfile=$path_to_swt -DartifactId=org.eclipse.swt.gtk.linux.x86_64 -Dpackaging=jar -DgroupId=org.eclipse.swt -Dversion=4.12
# In some versions of tuxguitar, it references this version as 4.12.0-SNAPSHOT
mvn install:install-file -Dfile=$path_to_swt -DartifactId=org.eclipse.swt.gtk.linux.x86_64 -Dpackaging=jar -DgroupId=org.eclipse.swt -Dversion=4.12.0-SNAPSHOT

# Install swt 4.13
path_to_swt=$build_dir/swt-4.13-gtk-linux-x86_64/swt.jar
mvn install:install-file -Dfile=$path_to_swt -DartifactId=org.eclipse.swt.gtk.linux.x86_64 -Dpackaging=jar -DgroupId=org.eclipse.swt -Dversion=4.13


# Compile
mvn -P native-modules package

# If mvn didn't compile successfully
exit_code=$?
if [ $exit_code -ne 0 ]; then
    echo
    echo
    echo
    echo "===== TuxGuitar build issues ====="
    echo Check the README for a list of compilation issues and fixes.
    echo
    echo If you got this error above: \"\[ERROR\] error: Source option 5 is no longer supported. Use 7 or later.\"
    echo This is because we need to use JDK 1.7 and need to reflect this in the pom.xml file.
    echo
    echo To solve it, copy the POM files from this build script's directory. Look for the pom files in the folder dated just after the date of the git commit you're trying to compile.
    echo
    echo i.e. you could overwrite the files tuxguitar-2.0beta/pom.xml and tuxguitar-2.0beta/TuxGuitar-lib/pom.xml with the ones in the folder 2023_03_16/
    echo
    echo You may need to run this command if copying the files didn\'t work.
    echo git difftool filename
    echo In all pom files, remove all new additions, and remove the changed line with SNAPSHOT on it. It should compile when the diff shows only changes to lines and no new additional lines.
fi
