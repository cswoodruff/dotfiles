#!/bin/sh

#
# ~/.xsession
#
# Executed by xdm/gdm/kdm at login
#

xset b off

/bin/bash --login -i ~/.xinitrc

