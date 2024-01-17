The project seeks to help people by forcing them to interact with their spending habits acting as a log of how much you've spent/earned

run it in a flutter file and everything provided is in the library folder. 

Main.dart has a basic UI with simply 2 buttons that take you to two screens either expenses or earnings

input_spending.dart is where you will input the amout you've spent in the form of integers
(improvements would be changing it to doubles) 
when pressing 'Submit' it sends that value back to main.dart and subtracts it from money value

input_avg_wage.dart does the same thing but it will add earnings to money.

the function also will save the money value using 'package:shared_preferences/shared_prefernces.dart'

Overall the app can be improved with with changes that make user input easier and more complex ways of inputing things accessing the phone's clock for monthly expenses
While these are advantages forced interaction with monthly spending as well as monthly earnings gives users a real sense of what they're doing.
