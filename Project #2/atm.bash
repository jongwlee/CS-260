#! /bin/sh
#Project #2 Bourne Shell (atm.bash)

NEWLINE=$'\n'
displaypin="*** Welcome to Cal Poly's ATM ***${NEWLINE}${NEWLINE}Please enter your PIN: "
displaymenu="*** Welcome To Cal Poly's ATM System ***${NEWLINE}${NEWLINE}(1) Transfer from checking account to savings account${NEWLINE}(2) Transfer from savings account to checking account${NEWLINE}(3) Savings account balance${NEWLINE}(4) Checking account balance${NEWLINE}(5) Withdraw Cash from either account${NEWLINE}(6) Exit${NEWLINE}${NEWLINE}==> Please select option (1-6): "

counter=0
checking=1000
saving=1000

#Transfer Checking to Saving
checkingToSaving()
{
  echo "How much would you like to transfer?"
    read user_input
     if [ $user_input -gt $checking ]
       then
         clear
         echo "The amount exceeds the amount in checking"
         echo "Checking: " $checking
     else
     checking=`expr $checking - $user_input`
     saving=`expr $saving + $user_input`
     fi
}

#Transfer Saving to Checking
savingToChecking()
{
  echo "How much would you like to transfer?"
   read user_input
     if [ $user_input -gt $saving ]
       then
       clear
       echo "The amount exceeds the amount in savings"
       echo "Savings: " $saving
    else
     saving=`expr $saving - $user_input`
     checking=`expr $checking + $user_input`
    fi
}

#Withdraw amount for either checking or saving
withdraw()
{
echo "Which account do you want to withdraw from?"
read user_input

if [ $user_input = saving ]
  then
    echo "How much do you want to withdraw?"
    read withdraw_amount

    if [ $withdraw_amount -gt $saving ]
     then
      clear
      echo "The withdraw amount exceeds the amount in savings account"
      echo "Savings: " $saving
    fi

    if [ $withdraw_amount -lt $saving ]
    then
    saving=`expr $saving - $withdraw_amount`
fi

elif [ $user_input = checking ]
   then
     echo "How much do you want to withdraw?"
     read withdraw_amount

     if [ $withdraw_amount -gt $checking ]
       then
       clear
       echo "The withdraw amount exceeds the amount in checking"
       echo "Checking: " $checking
     fi
     if [ $withdraw_amount -lt $checking ]
     then
     checking=`expr $checking - $withdraw_amount`
fi
 else
    echo "This is not a valid account"
    clear
fi
}

#Prompt for user pin
echo $displaypin
read user_pin

while [ $user_pin -ne 111 ]
  do
    if [ $counter -eq 2 ]
     then
      echo "Too many illegal PINs. Try again later."
      exit
    fi
    printf "\033c"
    echo $displaypin
    read user_pin
    counter=`expr $counter + 1`
done

#Prompt the menu and prompt user for action
if [ $user_pin -eq 111 ]
   then
     menu_input=0
     while [ $menu_input -ne 6 ]
     do
     echo "$displaymenu"
     read menu_input

     case "$menu_input" in
     1)
        checkingToSaving
        ;;
     2)
        savingToChecking
        ;;
     3)
        echo "The balance in the savings account is: " $saving
        ;;
     4)
        echo "The balance in the checkings account is: " $checking
        ;;
     5)
        withdraw
        ;;
     6)
        exit
        echo "Thank you for using the ATM system."
        ;;
     *)
        echo $displaymenu
        read menu_input
        ;;
     esac
     done
fi