#! /bin/bash

if [ $# -ne 1 ]; then
  echo "The number of specified arguments is $#." 1>&2
  echo "You need to specify the version of Mitsuba 2 as the argument to the shell script." 1>&2
  echo "USAGE: ./build_dockerimage.sh v2.2.0" 1>&2
  exit 1
fi

docker build -t zigzagzackey/mitsuba2_base:$1 --build-arg VER_MITSUBA=$1 . 