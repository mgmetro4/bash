#!/usr/bin/env bash
# ^ use bash to run file. Checks envionment paths. Must be first line

#Variables
message="Strings require quotes"

#print the string
echo $message

#grab parameters from bash
first_parameter=$1
#this works in newer bash versions. Old goes up to 9
tenth_parameter={10}

#Some Useful Keywords
date_=$(date)
working_directory=$(pwd)
last_exit_code=$?
path_=$PATH
terminal_=$TERM
home_=$HOME #user's home directory
hostname_=$HOSTNAME
shell_=$SHELL
user_=$USER
editor_=$EDITOR #might not be set. bash_profilesettings
#checksum_=cksum <file.txt> 


#CONDITIONALS
color="blue"
if [ $color = "blue" ]
then
    echo $color
fi

#--------------------------------------------------

num=10
if [ $num -gt 100 ]
then
    echo "Greater than 100"
elif [ $num -eq 100 ]
then
    echo "Num == 100"
else
    echo "Less than 100"
fi


#LOOPS
COUNT=0
while [ $COUNT -lt 5 ]
do
    echo "Count = $COUNT"
    ((COUNT++))
done

#--------------------------------------------------

#holds all paramaters into an array
arr=$@

for thing in $arr
do
    echo $thing
done 

#--------------------------------------------------

for ((i=0; i<3; i++))
do
    echo $i
done

#--------------------------------------------------

#stop loops with 
break

#go back to top of loop with
continue



#FUNCTIONS

#define - have to def before call
function printSenate() {
    echo "I AM THE SENATE"
}

#call
printSenate

#give it parameters
function printMustafar() {
    local name="$1"
    if [ $name = "Anakin" ]
    then
        echo "I HATE YOU"
    elif [ $name = "Kenobi" ]
    then
        echo "I have the highground"
    fi
}

printMustafar Anakin



#USEFUL PIPES
# ls command in 1 column, sort it, give back first 5
# add -r for reverse sort
files='ls -1 | sort | head -5'


#WRITE FILES
LINE1="When I got to them we got into aggressive negotiations."
LINE2="Aggressive negotiations? What's that?"
LINE3="Ah, well, it's negotiations with a lightsaber."
lineArray=("$LINE1" "$LINE2" "$LINE3") #make sure you use "" or it will split by spaces


for line in "${lineArray[@]}" 
#make sure you use "" or it will split in spaces
#need [@] to iterate through every element or it will just do first
do
    #you can also use printf
    #will automatically add a newline
    echo $line
    #echo -e enables "interpretation of backslash escapes", but is not as stable as printf
done > quotes.txt #use > to replace; >> to add to bottom of file



#READ FILES
#internal field seperator - how to parse line. Empty for no changes
# -r ; don't let backslash escape anything
while IFS='' read -r LINE_PLACEHOLDER
do
    echo $LINE_PLACEHOLDER
done < quotes.txt #use an input


echo | cksum quotes.txt


#RUN COMMANDS
#bash <command>

#0 for success
exit 0