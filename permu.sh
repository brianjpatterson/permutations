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


#get argument passed from command line
declare subject=$1

permu() {

#bunch of stupid variables
	local _subject=$1
	local first=${_subject::1}
	local -a tmp=()
	local -a tmp1=()
	local -a all=()
	local letter;
	local perm;
	local perms;


#if 1 or 0 chars then echo them
	if [ ${#_subject} -lt 2 ]; then
		echo "${_subject}"
		return 0
	fi

#if exactly 2 chars return array with 2 elements
#the 2 chars and the 2 chars reversed
	if [ ${#_subject} -eq 2 ]; then
		tmp+=($_subject)
		tmp+=($(reverseString "$_subject"))
		echo "${tmp[*]}"
		return 0
	fi


#for each letter in _subject
for i in $(seq 1 ${#_subject}); do
  #save the letter
  letter="${_subject:i-1:1}"
  #save a string without the letter in it
  perm="${_subject:0:i-1}${_subject:i}"
  #recurse on that string
  perms=$(permu "$perm")

  #for result of recursion above
  for ((j=0;j<${#perms[@]};j++)); do

	#adding the letter here only
	#adds it to some of the 
	#results, not all

	#save the result
  	tmp1="${perms[j]}"
  	#add the result to our final return array
  	all+=("${perms[j]}")
  done
  
done

#return the final array
echo "${all[*]}"

}

#call our function with the argument passed via command line
permu "$subject"

#Desired output
#// Examples:
#permutations('abc')
#// => ['abc', 'acb', 'bac', 'bca', 'cab', 'cba']


