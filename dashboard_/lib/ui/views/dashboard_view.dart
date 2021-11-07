import 'package:dashboard_/datagraphics/datagraphics.dart';
import 'package:dashboard_/providers/auth_provider.dart';
import 'package:dashboard_/providers/categories_provider.dart';
import 'package:dashboard_/providers/users_provider.dart';
import 'package:dashboard_/ui/cards/white_card.dart';
import 'package:dashboard_/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView>
    with SingleTickerProviderStateMixin {
  late Animation<int> animationUsers;
  late Animation<int> animationCategories;
  late AnimationController controller;

  @override
  void initState() {
    final users = context.read<UsersProvider>().users;
    final categories = context.read<CategoriesProvider>().categories;
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    animationCategories = IntTween(begin: 0, end: categories.length)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    animationUsers = IntTween(begin: 0, end: users.length)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context).user!;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            "Dashboard",
            style: CustomLabels.h1,
          ),
          const SizedBox(height: 10),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: const [
              WhiteCard(
                title: "10",
                child: Text("Categorias"),
                width: 170,
              ),
              WhiteCard(
                title: "50",
                child: Text("Usuários"),
                width: 170,
              ),
              WhiteCard(
                title: "533",
                child: Text("Produtos"),
                width: 170,
              ),
              WhiteCard(
                title: "80",
                child: Text("Pedidos"),
                width: 170,
              ),
              WhiteCard(
                title: "70",
                child: Text("Clientes"),
                width: 170,
              ),
            ],
          ),
          const SizedBox(height: 60),
          Wrap(children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 350,
              height: 300,
              child: Chart(
                data: basicData,
                variables: {
                  'genre': Variable(
                    accessor: (Map map) => map['genre'] as String,
                  ),
                  'sold': Variable(
                    accessor: (Map map) => map['sold'] as num,
                  ),
                },
                elements: [
                  IntervalElement(
                    label: LabelAttr(
                        encode: (tuple) => Label(tuple['sold'].toString())),
                    elevation: ElevationAttr(value: 0, onSelection: {
                      'tap': {true: (_) => 5}
                    }),
                    color:
                        ColorAttr(value: Defaults.primaryColor, onSelection: {
                      'tap': {false: (color) => color.withAlpha(100)}
                    }),
                  )
                ],
                axes: [
                  Defaults.horizontalAxis,
                  Defaults.verticalAxis,
                ],
                selections: {'tap': PointSelection(dim: 1)},
                tooltip: TooltipGuide(),
                crosshair: CrosshairGuide(),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 350,
              height: 300,
              child: Chart(
                data: roseData,
                variables: {
                  'name': Variable(
                    accessor: (Map map) => map['name'] as String,
                  ),
                  'value': Variable(
                    accessor: (Map map) => map['value'] as num,
                    scale: LinearScale(min: 0, marginMax: 0.1),
                  ),
                },
                elements: [
                  IntervalElement(
                    label: LabelAttr(
                        encode: (tuple) => Label(tuple['name'].toString())),
                    shape: ShapeAttr(
                        value: RectShape(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    )),
                    color:
                        ColorAttr(variable: 'name', values: Defaults.colors10),
                    elevation: ElevationAttr(value: 5),
                  )
                ],
                coord: PolarCoord(startRadius: 0.15),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 350,
              height: 300,
              child: Chart(
                data: invalidData,
                variables: {
                  'Date': Variable(
                    accessor: (Map map) => map['Date'] as String,
                    scale: OrdinalScale(tickCount: 5),
                  ),
                  'Close': Variable(
                    accessor: (Map map) => (map['Close'] ?? double.nan) as num,
                  ),
                },
                elements: [
                  AreaElement(
                    shape: ShapeAttr(value: BasicAreaShape(smooth: true)),
                    color:
                        ColorAttr(value: Defaults.colors10.first.withAlpha(80)),
                  ),
                  LineElement(
                    shape: ShapeAttr(value: BasicLineShape(smooth: true)),
                    size: SizeAttr(value: 0.5),
                  ),
                ],
                axes: [
                  Defaults.horizontalAxis,
                  Defaults.verticalAxis,
                ],
                selections: {
                  'touchMove': PointSelection(
                    on: {
                      GestureType.scaleUpdate,
                      GestureType.tapDown,
                      GestureType.longPressMoveUpdate
                    },
                    dim: 1,
                  )
                },
                tooltip: TooltipGuide(
                  followPointer: [false, true],
                  align: Alignment.topLeft,
                  offset: const Offset(-20, -20),
                ),
                crosshair: CrosshairGuide(followPointer: [false, true]),
              ),
            ),
          ])
        ],
      ),
    );
  }
}
