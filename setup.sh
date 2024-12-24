#!/bin/bash

#Run stuffs!
for installer in ./install/*.sh; do source $installer; done

bash ./extras.sh

touch $HOME/.rhelinit_complete
