#!/bin/bash
echo "What is your favourite OS?"

# 'select' prints a numbered menu of the given items and prompts for a choice;
# the chosen item's text is stored in $var, the number typed is stored in $REPLY.
# The loop repeats until 'break' (or a valid script-ending command) is executed.

select var in "Linux" "Gnu Hurd" "Free BSD" "Other"; do
break   # exit the select loop right after the first choice is made
done
echo "You have selected $var"   # print back whichever option the user picked
