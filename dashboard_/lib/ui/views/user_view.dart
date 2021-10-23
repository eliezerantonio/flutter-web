import 'package:dashboard_/models/usuario.dart';
import 'package:dashboard_/providers/users_provider.dart';
import 'package:dashboard_/ui/cards/white_card.dart';
import 'package:dashboard_/ui/inputs/custom_inputs.dart';
import 'package:dashboard_/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserView extends StatefulWidget {
  const UserView({Key? key, required this.uid}) : super(key: key);
  final String uid;

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  Usuario? user;
  @override
  void initState() {
    super.initState();
    Provider.of<UsersProvider>(context, listen: false)
        .getUserById(widget.uid)
        .then((userDB) => setState(() {
              user = userDB;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            "User View",
            style: CustomLabels.h1,
          ),
          const SizedBox(height: 10),
          if (user == null)
            WhiteCard(
              child: Container(
                alignment: Alignment.center,
                height: 300,
                child: const CircularProgressIndicator(),
              ),
            ),
          _UserViewBody()
        ],
      ),
    );
  }
}

class _UserViewBody extends StatelessWidget {
  const _UserViewBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(
        columnWidths: const {
          0: FixedColumnWidth(250),
        },
        children: [
          TableRow(
            children: [
              //AVATAR
              _AvatarContainer(),
              _UserViewForm(),
            ],
          )
        ],
      ),
    );
  }

  Widget _AvatarContainer() {
    return WhiteCard(
      width: 250,
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Profile",
              style: CustomLabels.h2,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 150,
              height: 160,
              child: Stack(
                children: [
                  const ClipOval(
                    child: Image(
                      image: AssetImage("assets/no-image.jpg"),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: Colors.white,
                          width: 5,
                        ),
                      ),
                      child: FloatingActionButton(
                        backgroundColor: Colors.indigo,
                        child: const Icon(Icons.camera_alt, size: 20),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Nome do usuario",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _UserViewForm extends StatelessWidget {
  const _UserViewForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      title: 'Info Geral',
      child: Form(
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            TextFormField(
              decoration: CustomInputs.formInputDecoration(
                hint: 'Nome Usuario',
                label: 'Nome',
                icon: Icons.supervised_user_circle_outlined,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: CustomInputs.formInputDecoration(
                hint: 'Email do Usuario',
                label: 'E-mail',
                icon: Icons.mark_email_read_outlined,
              ),
            ),
            const SizedBox(height: 20),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 100),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.indigo),
                    shadowColor: MaterialStateProperty.all(Colors.transparent)),
                onPressed: () {},
                child: Row(
                  children: const [
                    Icon(
                      Icons.save_outlined,
                    ),
                    Text("Guardar")
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
