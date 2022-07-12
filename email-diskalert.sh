#!/usr/bin/env bash
#
# ScriptName - email-diskalert
# Site:       https://n4wt.wordpress.com
# Autor:      Newton
# ------------------------------------------------------------------------ #
#--------------------- VARIABLES ----------------------------------------- #
CURRENT=$(df / | grep / | awk '{ print $5}' | sed 's/%//g')
THRESHOLD=90
EMAIL=myemail@domain.com
HOSTNAME=$"(hostname -f)"
#
# --------------------- EXECUÇÃO ----------------------------------------- #
if [ "$CURRENT" -gt "$THRESHOLD" ] ; then
mail -s 'Disk Space Alert' $EMAIL << EOF
Your root partition remaining free space is critically low.
Server: $HOSTNAME
Used: $CURRENT%
EOF
fi
# ------------------------------------------------------------------------ #
