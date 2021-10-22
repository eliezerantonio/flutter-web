import 'package:dashboard_/ui/cards/white_card.dart';
import 'package:dashboard_/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class IconsView extends StatelessWidget {
  const IconsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
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
              ),
              WhiteCard(
                title: 'Users',
                child: Center(
                  child: Icon(Icons.people),
                ),
                width: 170,
              ),
              WhiteCard(
                title: 'all_inbox_outlined',
                child: Center(
                  child: Icon(
                    Icons.all_inbox_outlined,
                  ),
                ),
                width: 170,
              ),
              WhiteCard(
                title: 'access_alarms_outlined',
                child: Center(
                  child: Icon(
                    Icons.access_alarms_outlined,
                  ),
                ),
                width: 170,
              ),
              WhiteCard(
                title: 'accessibility',
                child: Center(
                  child: Icon(
                    Icons.accessibility,
                  ),
                ),
                width: 170,
              ),
              WhiteCard(
                title: 'multiple_stop',
                child: Center(
                  child: Icon(
                    Icons.multiple_stop,
                  ),
                ),
                width: 170,
              ),
              WhiteCard(
                title: 'add_to_home_screen_sharp',
                child: Center(
                  child: Icon(
                    Icons.add_to_home_screen_sharp,
                  ),
                ),
                width: 170,
              ),
            ],
          )
        ],
      ),
    );
  }
}
