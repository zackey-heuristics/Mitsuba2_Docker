#! /bin/bash

if [ $# -ne 1 ]; then
  echo "The number of specified arguments is $#." 1>&2
  echo "You need to specify the version of Mitsuba 2 as the argument to the shell script." 1>&2
  echo "USAGE: ./run_dockerimage_conda.sh v2.2.0" 1>&2
  exit 1
fi

docker run -it -v /Users/zigzagzackey/workspace/mitsuba-data:/root/Mitsuba2_Install/mitsuba-data zigzagzackey/mitsuba2_conda:$1