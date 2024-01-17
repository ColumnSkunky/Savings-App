import 'dart:convert';

import 'package:flutter/material.dart';
import 'input_spending.dart';
import 'input_avg_wage.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "title",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: "title"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title ;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int money = 0;
  int expense = 0;
  int earnings = 0;

  @override
  void initState() {
    super.initState();
    _loadMoney();
  }
  Future<void> _loadMoney() async {
    final prefs = await SharedPreferences.getInstance();
    if(!prefs.containsKey('money')){
      return;
    }
    setState(() {
    money = prefs.getInt('money') !;
    });
  }

  Future<void> _saveMoney() async {

    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('money', money);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text('Bringing The Bacon'),
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
                'Current savings:',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                )
            ),
            Text(
              '\$ $money',
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineMedium,
            ),
            ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              onPressed: () {
                    _awaitReturnValueFromEarnings(context);

              },
              child: Text(
                  'Earnings'
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              onPressed: () {
                _awaitReturnValueFromExpense(context);

              },
              child: Text(
                  'Expenses'
              ),
            ),
          ],
        ),
      ),
    );
  }


  void _awaitReturnValueFromExpense(BuildContext context) async {
    // start the SecondScreen and wait for it to finish with a result
    final int result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const InputSpending(title: 'Spending',))
    );
    setState(() {
      expense = result;
    });
    money = money - expense;
    _saveMoney();
  }
  void _awaitReturnValueFromEarnings(BuildContext context) async {
    // start the SecondScreen and wait for it to finish with a result
    final int result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const InputWage(title: 'Earnings'),
        ));
    setState(() {
      earnings = result;
    });
    money = money + earnings;
    _saveMoney();
  }
}





