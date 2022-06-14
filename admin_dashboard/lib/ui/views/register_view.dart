import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../router/router.dart';
import '../../theme/app_theme.dart';
import '../buttons/custom_outlined_button.dart';
import '../buttons/link_text.dart';

class RegisterView extends StatelessWidget {
  
  const RegisterView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints( maxWidth: 370 ),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  // validator: ,
                  style: const TextStyle(color: Colors.white),
                  decoration: AppTheme.buildInputDecoration(
                    hintText: 'Ingrese su nombre',
                    label: 'Nombre',
                    icon: Icons.person_outline
                  ),
                ),
                const SizedBox(height: 15,),
                TextFormField(
                  // validator: ,
                  style: const TextStyle(color: Colors.white),
                  decoration: AppTheme.buildInputDecoration(
                    hintText: 'Ingrese su correo',
                    label: 'Email',
                    icon: Icons.email_outlined
                  ),
                ),
                const SizedBox(height: 15,),
                TextFormField(
                  // validator: ,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: AppTheme.buildInputDecoration(
                    hintText: '********',
                    label: 'Contraseña',
                    icon: Icons.lock_outline
                  ),
                ),
                const SizedBox(height: 20,),
                CustomOutlinedButton(
                  text: 'Registrar',
                  textStyle: GoogleFonts.poppins().copyWith(color: Colors.blue),
                  minWidth: double.infinity,
                  onPressed: () {
                    
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
  }

  
}