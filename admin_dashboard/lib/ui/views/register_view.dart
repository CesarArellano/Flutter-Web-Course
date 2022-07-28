import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../extensions/null_extensions.dart';
import '../../providers/auth_provider.dart';
import '../../providers/register_form_provider.dart';
import '../../router/router.dart';
import '../buttons/custom_outlined_button.dart';
import '../buttons/link_text.dart';
import '../inputs/custom_inputs.dart';

class RegisterView extends StatelessWidget {
  
  const RegisterView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ( _ ) => RegisterFormProvider(),
      child: Builder(
        builder: ( context ) {
          final authProvider = Provider.of<AuthProvider>(context);
          final registerFormProvider = Provider.of<RegisterFormProvider>(context);
          return Container(
            margin: const EdgeInsets.only(top: 50),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints( maxWidth: 370 ),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: registerFormProvider.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: ( value ) {
                          final newValue = value.value();
        
                          if( newValue.isEmpty ) {
                            return 'El campo nombre es obligatorio.';
                          }

                          return null;
                        },
                        onChanged:(value) {
                          registerFormProvider.name = value;
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: CustomInputs.buildInputDecoration(
                          hintText: 'Ingrese su nombre',
                          label: 'Nombre',
                          icon: Icons.person_outline
                        ),
                      ),
                      const SizedBox(height: 15,),
                      TextFormField(
                        validator: ( value ) {
                          final newValue = value.value();
                          if( !EmailValidator.validate(newValue) ) {
                            return 'El campo email es inválido';
                          }
                          return null;
                        },
                        onChanged: ( value ) {
                          registerFormProvider.email = value;
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: CustomInputs.buildInputDecoration(
                          hintText: 'Ingrese su correo',
                          label: 'Email',
                          icon: Icons.email_outlined
                        ),
                      ),
                      const SizedBox(height: 15,),
                      TextFormField(
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
                          registerFormProvider.email = value;
                        },
                        obscureText: registerFormProvider.showPassword,
                        style: const TextStyle(color: Colors.white),
                        decoration: CustomInputs.buildInputDecoration(
                          hintText: '********',
                          label: 'Contraseña',
                          icon: Icons.lock_outline,
                          suffixIcon: IconButton(
                            icon: Icon(
                              registerFormProvider.showPassword ? Icons.visibility : Icons.visibility_off,
                              color: Colors.grey
                            ),
                            onPressed: () {
                              registerFormProvider.showPassword = !registerFormProvider.showPassword;
                            },
                          )
                        ),
                      ),
                      const SizedBox(height: 20,),
                      CustomOutlinedButton(
                        text: 'Registrar',
                        textStyle: GoogleFonts.poppins().copyWith(color: Colors.blue, fontWeight: FontWeight.bold),
                        minWidth: double.infinity,
                        onPressed: () {
                          final isValid = registerFormProvider.validateForm();
                          if( isValid ) {
                            authProvider.login(registerFormProvider.email, registerFormProvider.password);
                          }
                        },
                      ),
                      const SizedBox(height: 20,),
                      LinkText(
                        text: '¿Ya tienes cuenta? Inicia sesión',
                        onPressed: () {
                          Navigator.pushNamed(context, Flurorouter.loginRoute);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }, 
      ),
    );
  }
}