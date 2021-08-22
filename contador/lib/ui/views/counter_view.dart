import 'package:contador/ui/shared/custom_app_menu.dart';
import 'package:contador/ui/shared/custom_flat_button.dart';
import 'package:flutter/material.dart';

class CounterView extends StatefulWidget {
  @override
  _CounterViewState createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomAppMenu(),
        Spacer(),
        Text(
          "Contador Sateful",
          style: TextStyle(fontSize: 20),
        ),
        FittedBox(
          fit: BoxFit.contain,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Contador: $counter",
              style: TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomFlatButton(
              text: 'Incrementar',
              onPressed: () => setState(() => counter++),
            ),
            CustomFlatButton(
              text: 'Decrementar',
              onPressed: () => setState(() => counter--),
            ),
          ],
        ),
        Spacer(),
      ],
    );
  }
}
