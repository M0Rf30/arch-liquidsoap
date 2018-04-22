#!/bin/sh
su -c "yay -S liquidsoap --noconfirm" user
su -c "yes y | yay -Scc" user
