import 'package:contador/locator.dart';
import 'package:contador/services/navigation_service.dart';
import 'package:contador/ui/shared/custom_flat_button.dart';
import 'package:flutter/material.dart';

class CustomAppMenu extends StatelessWidget {
  const CustomAppMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          CustomFlatButton(
            onPressed: () =>
                locator<NavigationService>().navigateTo('/stateful'),
            text: 'Contador Stateful',
            color: Colors.black,
          ),
          SizedBox(width: 10),
          CustomFlatButton(
            onPressed: () =>
                locator<NavigationService>().navigateTo('/provider'),
            text: 'Contador Provider',
            color: Colors.black,
          ),
          SizedBox(width: 10),
          CustomFlatButton(
            onPressed: () => locator<NavigationService>().navigateTo('/404'),
            text: 'Outra pagina',
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
