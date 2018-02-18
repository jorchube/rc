#!/bin/bash

/usr/bin/xfsettingsd &
/usr/bin/compton &

#This can not run in bg; thus has to be started last
/usr/bin/i3 
