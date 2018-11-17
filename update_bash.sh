#!/bin/sh
ps1='export PS1="\[\e[36;m\][\u@\h \w]#\[\e[0m\]"'
grep_option="export GREP_OPTIONS='--color=auto'"

exist_ps1=`grep "export PS1" ~/.bash_profile`
echo "exist ps1:${exist_ps1}"
if [ -z "${exist_ps1}" ]; then
    sed -i "1a ${ps1}" ~/.bash_profile
else
    sed -i "s/export PS1.*/$ps1/g" ~/.bash_profile
fi

exist_grep=`grep "GREP_OPTION" ~/.bash_profile`
echo "exist grep_option:${exist_grep}"

if [ -z "${exist_grep}" ]; then
    sed -i "1a ${grep_option}" ~/.bashprofile
else
    sed -i "s/export GREP_OPTIONS.*/${grep_option}/g" ~/.bash_profile
fi