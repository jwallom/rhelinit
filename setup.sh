#!/bin/bash

# Setup some colors for output:
green="\e[;32m"
red="\e[;31m"
normal="\e[0m"

#Run stuffs!
for installer in ./install/*.sh; do source $installer; done
