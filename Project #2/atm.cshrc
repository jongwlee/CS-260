#! /bin/csh
#Project #2 C-Shell (atm.cshrc)

set displaypin = "*** Welcome to Cal Poly's ATM *** Please enter your PIN: "
set displaymenu = "*** Welcome To Cal Poly's ATM System ***(1) Transfer from checking account to savings account(2) Transfer from savings account to checking account (3) Savings account balance (4) Checking account balance (5) Withdraw Cash from either account (6) Exit ==> Please select option (1-6): "

set counter = 0
set checking  = 1000
set saving = 1000

#Prompt for user pin
echo $displaypin
set user_pin = $<
while ( $user_pin != 111 )
    if ( $counter == 2 ) then
      echo "Too many illegal PINs. Try again later."
      exit
    endif
    printf "\033c"
    echo $displaypin
    set user_pin = $<
    @ counter = $counter + 1
end

#Prompt the menu and prompt user for action
if ( $user_pin == 111 ) then
     set menu_input = 0
     while ( $menu_input != 6 )
     echo $displaymenu
     set menu_input = $<

     switch ( $menu_input )
     case 1:
	    #Transfers Checking to Savings
        echo "How much would you like to transfer?"
        set user_input = $<
          if ( $user_input > $checking ) then
            clear
            echo "The ammount exceeds the amount in checking"
            echo "Checking: " $checking
          else
          @ checking = $checking - $user_input
          @ saving = $saving + $user_input
endif
     breaksw
     case 2:
	    #Transfers Savings to Checkings
        echo "How much would you like to transfer?"
        set user_input = $<
          if ( $user_input > $saving ) then
            clear
            echo "The amount exceeds the amount in savings"
            echo "Savings: " $saving
          else
            @ saving = $saving - $user_input
            @ checking = $checking + $user_input
endif
     breaksw
     case 3:
        echo "The balance in the savings account is: " $saving
        breaksw
     case 4:
        echo "The balance in the checkings account is: " $checking
        breaksw
     case 5:
	    #Prompts user to choose either checking or saving to withdraw from
        echo "Which account do you want to withdraw from?"
        set user_input = $<

        if ( $user_input == saving ) then
          echo "How much do you want to withdraw?"
          set withdraw_amount = $<

          if ( $withdraw_amount > $saving ) then
            clear
            echo "The withdraw amount exceeds the amount in savings account"
            echo "Savings: " $saving
          endif

          if ( $withdraw_amount < $saving ) then
            @ saving = $saving - $withdraw_amount
          endif

         else if ( $user_input == checking ) then
           echo "How much do you want to withdraw?"
           set withdraw_amount = $<

           if ( $withdraw_amount > $checking ) then
             clear
             echo "The withdraw amount exceeds the amount in checking"
             echo "Checking: " $checking
           endif

             if ( $withdraw_amount < $checking ) then
               @ checking = $checking - $withdraw_amount
             endif

           else
             echo "This is not a valid account"
             clear
endif
        breaksw
     6)
        echo "Thank you for using the ATM system."
        exit
        breaksw
     *)
        echo "$displaymenu"
        set menu_input = $<
        breaksw
endsw
     end
endif
