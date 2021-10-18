import 'package:dashboard/providers/auth_provider.dart';
import 'package:dashboard/providers/register_form.provider.dart';
import 'package:dashboard/router/router.dart';
import 'package:dashboard/ui/buttons/custom_outline_button.dart';
import 'package:dashboard/ui/buttons/link_text.dart';
import 'package:dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => RegisterFormProvider(),
        child: Builder(builder: (context) {
          final registerFormProvider =
              Provider.of<RegisterFormProvider>(context, listen: false);
          return Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: Colors.black,
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 370,
                ),
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: registerFormProvider.formKey,
                  child: Column(
                    children: [
                      //password
                      TextFormField(
                        onChanged: (value) => registerFormProvider.name = value,
                        validator: (value) {
                          if (value!.isEmpty || value == null) {
                            return "Digite o nome";
                          }
                          if (value.length < 10) {
                            return "Digite ao menos 10 caracteres";
                          }
                        },
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: CustomInputs.authInputDecoration(
                            hint: "",
                            icon: Icons.people_outline_rounded,
                            label: "Nome"),
                      ), //email
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        onChanged: (value) =>
                            registerFormProvider.email = value,
                        validator: (value) {
                          if (!EmailValidator.validate(value ?? ""))
                            return 'Digite o email correcto';

                          return null;
                        },
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: CustomInputs.authInputDecoration(
                            hint: "",
                            icon: Icons.email_outlined,
                            label: "Email"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //password
                      TextFormField(
                        onChanged: (value) =>
                            registerFormProvider.password = value,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Digite o nome";
                          }
                          if (value.length < 6) {
                            return "Digite ao menos 9 caracteres";
                          }
                        },
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
                        onPressed: () {
                          final validForm = registerFormProvider.validateForm();

                          if (validForm) {
                            final authProvider = Provider.of<AuthProvider>(
                                context,
                                listen: false);

                            authProvider.register(
                              registerFormProvider.email,
                              registerFormProvider.password,
                              registerFormProvider.name,
                            );
                          }
                        },
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
        }));
  }
}
