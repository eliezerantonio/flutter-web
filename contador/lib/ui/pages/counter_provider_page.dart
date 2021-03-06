import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contador/providers/counter_provider.dart';
import 'package:contador/ui/shared/custom_flat_button.dart';

class CounterProviderPage extends StatelessWidget {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterProvider('5 '),
      child: CounterProviderPageBody(),
    );
  }
}

class CounterProviderPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterProvider = context.watch<CounterProvider>();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Text(
            "Contador Provider",
            style: TextStyle(fontSize: 20),
          ),
          FittedBox(
            fit: BoxFit.contain,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Contador ${counterProvider.counter}",
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
                onPressed: () => counterProvider.increment(),
              ),
              CustomFlatButton(
                text: 'Decrementar',
                onPressed: () => counterProvider.decrement(),
              ),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
