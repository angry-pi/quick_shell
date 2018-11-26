#!/bin/sh
ps1='export PS1="\\[\\e[36;m\\][\\u@\\h \\w]#\\[\\e[0m\\]"'
grep_option="export GREP_OPTIONS='--color=auto'"

exist_ps1=`grep "export PS1" ~/.bash_profile`
echo "已存在的 ps1:${exist_ps1}"
if [ -z "${exist_ps1}" ]; then
    sed -i "1a ${ps1}" ~/.bash_profile
else
    sed -i "s/export PS1.*/$ps1/g" ~/.bash_profile
fi
ps1_post=`grep "export PS1" ~/.bash_profile`
echo "处理后的 ps1:${ps1_post} target=${ps1}"


exist_grep=`grep "GREP_OPTION" ~/.bash_profile`
echo "已存在的 grep: ${exist_grep}"
if [ -z "${exist_grep}" ]; then
    sed -i "1a ${grep_option}" ~/.bash_profile
else
    sed -i "s/export GREP_OPTIONS.*/${grep_option}/g" ~/.bash_profile
fi
grep_post=`grep "GREP_OPTION" ~/.bash_profile`
echo "处理后的 grep:${grep_post} target=${grep_option}"

source ~/.bash_profile
