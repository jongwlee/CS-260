#! /bin/tcsh
#CS260 Project #3 (phonebook.tcsh)

set displaymenu="*** MENU ***(1) Listing of records in alphabetical order of first name or last name(2) Listing of records in reverse alphabetical order of first name or last name(3) Search for a record by Last Name and print out the result.(4) Search for a record by birthday in a given year or month."

echo $displaymenu
set user_input = $<

switch ( $user_input )
case 1:
  sort datebook.txt
  breaksw
case 2:
  sort -r datebook.txt
  breaksw
case 3:
  echo "Please enter the last name: "
  set user_input  = $<
  gawk -F: '/'$user_input'/{print $1, $2, $3, $4, $5, $6}' datebook.txt
  breaksw
case 4:
   echo "Please enter if year or month"
   set user_input = $<
   if ( $user_input == year ) then
     echo "Please enter the year "
     set user_input = $<
     gawk -F: '$5 ~ /'$user_input'$/' datebook.txt
   else if [ $user_input == month ] then
    echo "Please enter the month "                                                                           set user_input = $<
    gawk -F: '$5 ~ /^'$user_input'/' datebook.txt
   endif
    breaksw
endsw
