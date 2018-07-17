#!/bin/sh
~/.cargo/bin/totp-clipboard &
sleep .5
redshift-gtk -l 48.86:2.34 &
sleep .5
nm-applet &
sleep .5
pa-applet &

wait

