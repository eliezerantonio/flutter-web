import 'package:contador/providers/counter_provider.dart';
import 'package:contador/ui/shared/custom_app_menu.dart';
import 'package:contador/ui/shared/custom_flat_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterProviderPage extends StatelessWidget {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: _counterProviderPageBody(),
    );
  }

  Scaffold _counterProviderPageBody() {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomAppMenu(),
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
                onPressed: () => counter++,
              ),
              CustomFlatButton(
                text: 'Decrementar',
                onPressed: () => counter--,
              ),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
