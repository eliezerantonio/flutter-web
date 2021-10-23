import 'package:dashboard_/providers/auth_provider.dart';
import 'package:dashboard_/providers/login_form_provider.dart';
import 'package:dashboard_/router/router.dart';
import 'package:dashboard_/ui/buttons/custom_outline_button.dart';
import 'package:dashboard_/ui/buttons/link_text.dart';
import 'package:dashboard_/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return ChangeNotifierProvider(
        create: (_) => LoginFormProvider(),
        child: Builder(
          builder: (context) {
            final loginFormProvider =
                Provider.of<LoginFormProvider>(context, listen: false);
            return Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.black,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 370,
                  ),
                  child: Form(
                    key: loginFormProvider.formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      children: [
                        //email
                        TextFormField(
                          onFieldSubmitted: (_) =>
                              onFormSubmit(loginFormProvider, authProvider),
                          onChanged: (value) => loginFormProvider.email = value,
                          validator: (value) {
                            if (!EmailValidator.validate(value ?? ''))
                              return 'Email invalido';

                            return null;
                          },
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          decoration: CustomInputs.authInputDecoration(
                            hint: "",
                            icon: Icons.email_outlined,
                            label: "Email",
                          ),
                        ),
                        const SizedBox(height: 20),
                        //password
                        TextFormField(
                          onFieldSubmitted: (_) =>
                              onFormSubmit(loginFormProvider, authProvider),
                          onChanged: (value) =>
                              loginFormProvider.password = value,
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Digite a senha';
                            if (value.length < 6)
                              return 'Digite ao menos 6 caracteres';

                            return null;
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
                        const SizedBox(
                          height: 20,
                        ),
                        CustomOutlinedButton(
                          onPressed: () {
                            onFormSubmit(loginFormProvider, authProvider);
                          },
                          text: "Entrar",
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        LinkText(
                          text: "Nova conta",
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, Flurorouter.registerRoute);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }

  void onFormSubmit(
      LoginFormProvider loginFormProvider, AuthProvider authProvider) {
    final isValid = loginFormProvider.validateForm();

    if (isValid) {
      authProvider.login(loginFormProvider.email, loginFormProvider.password);
    }
  }
}
