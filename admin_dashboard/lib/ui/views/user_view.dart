import 'package:admin_dashboard/services/notification_service.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../extensions/null_extensions.dart';
import '../../models/auth_response.dart';
import '../../providers/user_form_provider.dart';
import '../../providers/users_provider.dart';
import '../../services/navigation_service.dart';
import '../buttons/custom_icon_button.dart';
import '../cards/white_card.dart';
import '../inputs/custom_inputs.dart';
import '../labels/custom_labels.dart';

class UserView extends StatefulWidget {
  const UserView({
    Key? key,
    required this.uid,  
  }) : super(key: key);

  final String uid;

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {

  Usuario? user;

  @override
  void initState() {
    super.initState();
    final usersProvider = Provider.of<UsersProvider>(context, listen: false);
    final userFormProvider = Provider.of<UserFormProvider>(context, listen: false);
    usersProvider.getUserById(widget.uid).then((userDB) {
      if( userDB != null ) {
        userFormProvider.user = userDB;
        userFormProvider.formKey = GlobalKey<FormState>();
        return setState(() => user = userDB);
      }
      NavigationService.replaceTo('/dashboard/users');
    });
  }

  @override
  void dispose() {
    Provider.of<UserFormProvider>(context, listen: false).user = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    if( user == null ) {
      return const Center(child: CircularProgressIndicator());
    }

    return SizedBox(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        physics: const ClampingScrollPhysics(),
        children: [
          Text('User View', style: CustomLabels.h1),
          const SizedBox(height: 10),
          SizedBox(
            child: Table(
              columnWidths: const {
                0: FixedColumnWidth(250)
              },
              children: const [
                TableRow(
                  children: [
                    _AvatarContainer(),
                    _UserViewForm(),
                  ]
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _UserViewForm extends StatefulWidget {
  const _UserViewForm({
    Key? key,
  }) : super(key: key);

  @override
  State<_UserViewForm> createState() => _UserViewFormState();
}

class _UserViewFormState extends State<_UserViewForm> {
  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user;
    return SizedBox(
      height: 250,
      child: WhiteCard(
        child: Theme(
          data: ThemeData().copyWith(
            colorScheme: ThemeData().colorScheme.copyWith(
              primary: Colors.indigo
            )
          ),
          child: Form(
            key: userFormProvider.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Información General', style: CustomLabels.h2.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 15),
                TextFormField(
                  initialValue: user?.nombre,
                  decoration: CustomInputs.buildFormInputDecoration(
                    hintText: 'Nombre del usuario',
                    label: 'Nombre',
                    icon: Icons.people_alt_outlined
                  ),
                  onChanged: (value) => user?.nombre = value,
                  validator: (value) {
                    if( value == null || value.isEmpty) return 'El campo es obligatorio.';
                    if( value.length < 2) return 'El nombre debe ser de dos letras mínimo.';
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: user?.correo,
                  decoration: CustomInputs.buildFormInputDecoration(
                    hintText: 'Edite el correo',
                    label: 'Correo',
                    icon: Icons.email_outlined
                  ),
                  onChanged: (value) => user?.correo = value,
                  validator: ( value ) {
                    final newValue = value.value();
                    if( !EmailValidator.validate(newValue) ) {
                      return 'El campo email es inválido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                Center(
                  child: SizedBox(
                    height: 35,
                    width: 100,
                    child: CustomIconButton(
                      onPressed: () => onFormSubmit(userFormProvider, context),
                      text: 'Guardar',
                      icon: Icons.save_alt,
                      color: Colors.indigo,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onFormSubmit(UserFormProvider userFormProvider, BuildContext context) async {
    if( !userFormProvider.validForm() ) return;

    final saved = await userFormProvider.updateUser();
    
    if( saved ) {
      NotificationService.showSnackBar('Updated user');
      if( !mounted ) return;
      return Provider.of<UsersProvider>(context, listen: false).refreshUser(userFormProvider.user!);
    } else {
      NotificationService.showSnackBar('Something went wrong!', backgroundColor: Colors.red);
    }

  }
}

class _AvatarContainer extends StatelessWidget {
  const _AvatarContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserFormProvider>(context).user;
    return WhiteCard(
      width: 250,
      child: SizedBox(
        width: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Profile', style: CustomLabels.h2),
            const SizedBox(height: 10),
            Stack(
              children: [
                const ClipOval(
                  child: Image(
                    image: AssetImage('no-image.jpg'),
                    width: 150,
                    height: 150,
                  ),
                ),
                Positioned(
                  right: 5,
                  bottom: 5,
                  child: FloatingActionButton(
                    mini: true,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                    tooltip: 'Changed profile photo',
                    backgroundColor: Colors.indigo,
                    child: const Icon(Icons.camera_alt_outlined),
                    onPressed: () {
                      
                    },
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Text(
              (user?.nombre).value(),
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            
          ],
        ),
      ),
    );
  }
}