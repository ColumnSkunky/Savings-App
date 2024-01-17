import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputSpending extends StatefulWidget {
  const InputSpending({super.key, required this.title});

  final String title;

  @override
  State<InputSpending> createState() => _InputSpendingState();
}

class _InputSpendingState extends State<InputSpending> {
  int expenses = 0;


  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
  backgroundColor: Theme
      .of(context)
      .colorScheme
      .inversePrimary,
  title: Text(widget.title),
  ),
  body: Center(
  child: Column(

  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
  const Text(
  'Input Total Expenses(rounded to the nearest dollar):',
  ),
  TextField(
  keyboardType: const TextInputType.numberWithOptions(),
  inputFormatters: <TextInputFormatter>[
  FilteringTextInputFormatter.digitsOnly,
  ],
  onChanged: (value){
  expenses = int.parse(value);
  }
  ),
  ElevatedButton(
  child: Text('Submit'),
  onPressed: () => Navigator.of(context).pop(expenses),
  ),
  ],
  ),
  ),
  );
  }

}

