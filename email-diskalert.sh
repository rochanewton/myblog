#!/bin/bash

# VARIABLES
CURRENT=$(df / | grep / | awk '{ print $5}' | sed 's/%//g')
THRESHOLD=90


# EXECUTION
if [ "$CURRENT" -gt "$THRESHOLD" ] ; then
mail -s 'Disk Space Alert' myemail@domain.com << EOF
Your root partition remaining free space is critically low. Used: $CURRENT%
EOF
fi
