#!/usr/local/bin/bash

echo "Permutations (permu.sh)"
echo "Recursive Coding Challenge #6"
echo "running... BASH v${BASH_VERSION}"
echo "-----------------------------------"
echo "USAGE: bash permu.sh string || "
echo "NOTE: spaces not supported"
echo "-----------------------------------"
echo " Input Received: $1"
echo "-----------------------------------"


reverseString() {

	local str=$1
	local rev
	if [ $# -eq 1 ]; then
		rev=""
	else
		rev=$2
	fi

	rev+=${str: -1}
	str=${str%?}
	if [ ${#str} -eq 0 ]; then
		echo "$rev"
		return 0
	fi
	reverseString "$str" "$rev"

}



declare subject=$1

permu() {

	local _subject=$1
	local first=${_subject::1}
	local -a tmp=()
	local -a tmp1=()
	local -a all=()
	local letter;
	local perm;
	local perms;

	#_subject="${_subject:1}"

	if [ ${#_subject} -lt 2 ]; then
		echo "${_subject}"
		
	fi

	if [ ${#_subject} -eq 2 ]; then
		tmp+=($_subject)
		tmp+=($(reverseString "$_subject"))
		echo "${tmp[*]}"
		return 0
	fi



for i in $(seq 1 ${#_subject}); do
  letter="${_subject:i-1:1}"
  perm="${_subject:0:i-1}${_subject:i}"
  perms=$(permu "$perm")
  for ((j=0;j<${#perms[@]};j++)); do

	
  	tmp1="${perms[j]}"
  	all+=("${perms[j]}")
  done
  
done

echo "${all[*]}"

}

permu "$subject"
#// Examples:
#permutations('abc')
#// => ['abc', 'acb', 'bac', 'bca', 'cab', 'cba']


