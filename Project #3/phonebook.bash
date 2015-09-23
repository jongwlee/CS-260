#! /bin/sh
#CS 260 Project#3 (phonebook.bash)

NEWLINE=$'\n'
displaymenu="*** MENU ***${NEWLINE}(1) Listing of records in alphabetical order of first name or last name${NEWLINE}(2) Listing of records in reverse alphabetical order of first name or last name${NEWLINE}(3) Search for a record by Last Name and print out the result.${NEWLINE}(4) Search for a record by birthday in a given year or month."

echo "$displaymenu"
read user_input

case "$user_input" in
1)
  sort datebook.txt
  ;;
2)
  sort -r datebook.txt
  ;;
3)
  echo "Please enter the last name: "
  read user_input

  gawk -F: '/'$user_input'/{print $1, $2, $3, $4, $5, $6}' datebook.txt
  ;;
4)
  echo "Please enter if year or month"
  read user_input
     if [ $user_input = year ]
      then
       echo "Please enter the year "
       read user_input
       gawk -F: '$5 ~ /'$user_input'$/' datebook.txt

    elif [ $user_input = month ]
      then
       echo "Please enter the month "
       read user_input
       gawk -F: '$5 ~ /^'$user_input'/' datebook.txt
     fi
     ;;
esac
