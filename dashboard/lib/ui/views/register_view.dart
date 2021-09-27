import 'package:dashboard/router/router.dart';
import 'package:dashboard/ui/buttons/custom_outline_button.dart';
import 'package:dashboard/ui/buttons/link_text.dart';
import 'package:dashboard/ui/inputs/custom_inputs.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.black,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 370,
          ),
          child: Form(
            child: Column(
              children: [
                //password
                TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: CustomInputs.authInputDecoration(
                      hint: "",
                      icon: Icons.people_outline_rounded,
                      label: "Password"),
                ), //email
                TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: CustomInputs.authInputDecoration(
                      hint: "", icon: Icons.email_outlined, label: "Email"),
                ),
                SizedBox(
                  height: 20,
                ),
                //password
                TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  obscureText: true,
                  decoration: CustomInputs.authInputDecoration(
                    hint: "********",
                    label: "Password",
                    icon: Icons.lock_outline_rounded,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomOutlinedButton(
                  onPressed: () {},
                  text: "Criar conta",
                ),

                SizedBox(
                  height: 20,
                ),

                LinkText(
                  text: "Tenho uma conta",
                  onPressed: () {
                    Navigator.pushNamed(context, Flurorouter.loginRoute);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
