import 'package:dashboard_/providers/auth_provider.dart';
import 'package:dashboard_/providers/register_form.provider.dart';
import 'package:dashboard_/router/router.dart';
import 'package:dashboard_/ui/buttons/custom_outline_button.dart';
import 'package:dashboard_/ui/buttons/link_text.dart';
import 'package:dashboard_/ui/inputs/custom_inputs.dart';
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
            margin: const EdgeInsets.only(top: 20),
            padding:const EdgeInsets.symmetric(horizontal: 20),
            color: Colors.black,
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
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
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: CustomInputs.authInputDecoration(
                            hint: "",
                            icon: Icons.people_outline_rounded,
                            label: "Nome"),
                      ), //email
                  const    SizedBox(
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
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: CustomInputs.authInputDecoration(
                            hint: "",
                            icon: Icons.email_outlined,
                            label: "Email"),
                      ),
                 const     SizedBox(
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
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        obscureText: true,
                        decoration: CustomInputs.authInputDecoration(
                          hint: "********",
                          label: "Password",
                          icon: Icons.lock_outline_rounded,
                        ),
                      ),
                const      SizedBox(
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

                 const     SizedBox(
                        height: 20,
                      ),

                      LinkText(
                        text: "Tenho uma conta",
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, Flurorouter.loginRoute);
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
