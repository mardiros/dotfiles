#!/bin/sh
~/.cargo/bin/totp-clipboard &
sleep .5
redshift-gtk &
sleep .5
nm-applet &
sleep .5
pa-applet &

wait

