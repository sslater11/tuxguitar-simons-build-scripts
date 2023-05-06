#!/bin/bash

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

$script_dir/../build-scripts/tuxguitar-linux-x86_64/target/tuxguitar-2.0-SNAPSHOT-linux-x86_64/tuxguitar.sh
