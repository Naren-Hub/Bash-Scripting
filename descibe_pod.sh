#!/bin/bash
name=${1}
echo "Showing pods matching '$name'"
pods=($(kubectl get pods --no-headers -o custom-columns=":metadata.name" | grep $name))
results=${#pods[@]}
echo "The resultant pods is/are:$(($results))"
echo "===================================================="
for pod in ${pods[@]};
do
    echo $pod
done
echo "===================================================="



if [ $results -eq 1 ]
then
    config=$(kubectl describe pod $pods)
    echo "==================   Describing the pod: $pods   =================="
    echo "${config}"
elif [ $results -eq 0 ]
then
    echo "No matches found for given service name: '$name'"
else
    echo "More than 1 pods are given. Try giving unique/complete service name from above names"
fi




