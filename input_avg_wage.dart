import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class InputWage extends StatefulWidget {
 const InputWage({super.key, required this.title});

 final String title;

  @override
  State<InputWage> createState() => _InputWageState();
}

class _InputWageState extends State<InputWage> {
  int earnings = 0;


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
              'Input Total Earnings(rounded to the nearest dollar):',
            ),
            TextField(
              keyboardType: const TextInputType.numberWithOptions(),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              onChanged: (value){
                earnings = int.parse(value);
                }
                ),
            ElevatedButton(
                child: Text('Submit'),
              onPressed: () => Navigator.of(context).pop(earnings),
            ),
          ],
        ),
      ),
    );
  }

}