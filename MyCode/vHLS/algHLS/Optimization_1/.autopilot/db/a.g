#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/skalogerakis/TUC_Projects/TUC_HLS/MyCode/vHLS/algHLS/Optimization_1/.autopilot/db/a.g.bc ${1+"$@"}
