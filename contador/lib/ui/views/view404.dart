import 'package:contador/ui/shared/custom_flat_button.dart';
import 'package:flutter/material.dart';

class View404 extends StatelessWidget {
  const View404({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "404",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          Text(
            "Pagina nao encotrada",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          CustomFlatButton(
              text: 'Voltar',
              onPressed: () => Navigator.pushNamed(context, '/stateful'))
        ],
      ),
    );
  }
}
