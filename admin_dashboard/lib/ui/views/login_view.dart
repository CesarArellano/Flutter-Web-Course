import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../extensions/null_extensions.dart';
import '../../providers/auth_provider.dart';
import '../../providers/login_form_provider.dart';
import '../../router/router.dart';
import '../buttons/custom_outlined_button.dart';
import '../buttons/link_text.dart';
import '../inputs/custom_inputs.dart';

class LoginView extends StatelessWidget {
  
  const LoginView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ( _ )  => LoginFormProvider(),
      child: Builder(
        builder: (context) {
          final authProvider = Provider.of<AuthProvider>(context);
          final loginFormProvider = Provider.of<LoginFormProvider>(context);
          return Container(
            margin: const EdgeInsets.only(top: 100),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints( maxWidth: 370 ),
                child: Form(
                  key: loginFormProvider.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        onFieldSubmitted: ( _ ) => onFormSubmit(loginFormProvider, authProvider),
                        validator: ( value ) {
                          final newValue = value.value();
                          if( !EmailValidator.validate(newValue) ) {
                            return 'El campo email es inválido';
                          }
                          return null;
                        },
                        onChanged: ( value ) {
                          loginFormProvider.email = value;
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: CustomInputs.buildInputDecoration(
                          hintText: 'Ingrese su correo',
                          label: 'Email',
                          icon: Icons.email_outlined
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        onFieldSubmitted: ( _ ) => onFormSubmit(loginFormProvider, authProvider),
                        validator: ( value ) {
                          final newValue = value.value();
        
                          if( newValue.isEmpty ) {
                            return 'El campo contraseña es obligatorio.';
                          }
                          if( newValue.length < 6 ) {
                            return 'El campo contraseña debe tener 6 caracteres o más.';
                          }
        
                          return null;
                        },
                        onChanged: ( value ) {
                          loginFormProvider.password = value;
                        },
                        obscureText: loginFormProvider.showPassword,
                        style: const TextStyle(color: Colors.white),
                        decoration: CustomInputs.buildInputDecoration(
                          hintText: '********',
                          label: 'Contraseña',
                          icon: Icons.lock_outline,
                          suffixIcon: IconButton(
                            icon: Icon(
                              loginFormProvider.showPassword ? Icons.visibility : Icons.visibility_off,
                              color: Colors.grey
                            ),
                            onPressed: () {
                              loginFormProvider.showPassword = !loginFormProvider.showPassword;
                            },
                          )
                        ),
                      ),
                      const SizedBox(height: 20,),
                      CustomOutlinedButton(
                        text: 'Iniciar sesión',
                        textStyle: GoogleFonts.poppins().copyWith(color: Colors.blue, fontWeight: FontWeight.bold),
                        minWidth: double.infinity,
                        onPressed: () => onFormSubmit(loginFormProvider, authProvider)
                      ),
                      const SizedBox(height: 20,),
                      LinkText(
                        text: 'Nueva cuenta',
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, Flurorouter.registerRoute);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      )
    );
  }

  void onFormSubmit( LoginFormProvider loginFormProvider, AuthProvider authProvider) {
    final isValid = loginFormProvider.validateForm();
    if( isValid ) {
      authProvider.login(loginFormProvider.email, loginFormProvider.password);
    }
  }
}