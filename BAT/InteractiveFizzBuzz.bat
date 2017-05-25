:: 'Interactive' FizzBuzz in BAT 
:: Start off with clearing the terminal
CLS	
:: Give a little welcome message
ECHO "Fizzbuzz in BAT".
:: Turn off echo, allow variables to expand at execution time
@ECHO OFF & SETLOCAL ENABLEDELAYEDEXPANSION
:: Start looping
:START 
ECHO "To what number should FizzBuzz run?"
SET /P NrRun=Number: %=%
:: Now run the loop.
FOR /L %%f IN (1,1,!NrRun!) DO (
  SET /A b5=%%f %% 5 
  SET /A f3=%%f %% 3
  SET w=
  IF !b5! == 0 SET w=!w!Fizz
  IF !f3! == 0 SET w=!w!Buzz
  IF "!w!"=="" SET w=%%f
  ECHO !w!
)
:: Ask the user if they want to run the program again
:END
ECHO "Would you like to run FizzBuzz again? Type 'y' or 'n'."
SET /P UINPUT=Your response: %=%
IF /I "%UINPUT%"=="y" GOTO START 
IF /I "%UINPUT%"=="n" GOTO FINISH
echo Command not understood. & GOTO END 
:: PAUSE halts the terminal, allowing the user to see the result
:FINISH
PAUSE
:: EOF