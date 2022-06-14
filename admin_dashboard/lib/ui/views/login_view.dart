import 'package:admin_dashboard/router/router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/app_theme.dart';
import '../buttons/custom_outlined_button.dart';
import '../buttons/link_text.dart';

class LoginView extends StatelessWidget {
  
  const LoginView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100),
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
                    hintText: 'Ingrese su correo',
                    label: 'Email',
                    icon: Icons.email_outlined
                  ),
                ),
                const SizedBox(height: 15),
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
                  text: 'Iniciar sesión',
                  textStyle: GoogleFonts.poppins().copyWith(color: Colors.blue, fontWeight: FontWeight.bold),
                  minWidth: double.infinity,
                  onPressed: () {
                    
                  },
                ),
                const SizedBox(height: 20,),
                LinkText(
                  text: 'Nueva cuenta',
                  onPressed: () {
                    Navigator.pushNamed(context, Flurorouter.registerRoute);
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