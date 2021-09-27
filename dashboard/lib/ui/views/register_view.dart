import 'package:dashboard/router/router.dart';
import 'package:dashboard/ui/buttons/custom_outline_button.dart';
import 'package:dashboard/ui/buttons/link_text.dart';
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
                //email
                TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: buildInputDecoration(
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
                  decoration: buildInputDecoration(
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

  InputDecoration buildInputDecoration(
      {required String hint, required String label, required IconData icon}) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white.withOpacity(0.3),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white.withOpacity(0.3),
        ),
      ),
      hintText: hint,
      labelText: label,
      prefixIcon: Icon(
        icon,
        color: Colors.grey,
      ),
      hintStyle: TextStyle(color: Colors.grey),
      labelStyle: TextStyle(color: Colors.grey),
    );
  }
}
