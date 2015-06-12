pre_process=$1

if [[ ${pre_process} && -s ${pre_process} ]]; then
    echo 'ok'
    source ${pre_process} 201506111105.log > out
    if [[ $? -eq 0 ]]; then
        mv out 201506111105.log
    fi
else
    echo 'fail'
fi