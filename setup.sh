#!/bin/bash

#Run stuffs!
for installer in ./install/*.sh; do source $installer; done

bash ./extras.sh
