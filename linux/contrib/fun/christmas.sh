#!/bin/bash
# Cycle between red and green for christmas
#
# AUTHOR: Matthew J. Brooks <matthew@sonomatechpartners.com>
# Copyright (C)2012  Matthew J. Brooks <matthew@sonomatechpartners.com>
#
# This program is free software: you can redistribute it and/or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.


# Using which for convenience at the moment
# blink1-tool needs to be in your PATH
TOOL=`which blink1-tool`


################
#<--- MAIN ---># No more configuration, hack below to have some fun
################

##signal trapping
cleanup()
{
    # Turn the Blink(1) off
    $TOOL --off > /dev/null 2>&1
    exit $?
}
# trap keyboard interrupt (CTRL-c) or a SIGTERM (kill)
trap cleanup SIGINT SIGTERM


#infinite loop, stop with CTRL-c
while true; do
    # set the Blink(1) to COLOR_MIC
    $TOOL -t 100 -m 100 --rgb 255,0,0 > /dev/null 2>&1
    sleep 1
    $TOOL -t 100 -m 100 --rgb 0,255,0 > /dev/null 2>&1
    sleep 1
done

