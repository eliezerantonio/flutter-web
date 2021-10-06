import 'package:dashboard/ui/cards/white_card.dart';
import 'package:dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class IconsView extends StatelessWidget {
  const IconsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            "IconsView",
            style: CustomLabels.h1,
          ),
          SizedBox(height: 10),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: [
              WhiteCard(
                title: 'ac_unit_outlined',
                child: Center(
                  child: Icon(
                    Icons.ac_unit_outlined,
                  ),
                ),
                width: 170,
              )
            ],
          )
        ],
      ),
    );
  }
}
