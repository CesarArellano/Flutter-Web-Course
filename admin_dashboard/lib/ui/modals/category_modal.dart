import 'package:admin_dashboard/extensions/null_extensions.dart';
import 'package:admin_dashboard/models/categories_response.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/services/notification_service.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryModal extends StatefulWidget {
  const CategoryModal({
    Key? key,
    this.categoria
  }) : super(key: key);

  final Categoria? categoria;

  @override
  State<CategoryModal> createState() => _CategoryModalState();
}

class _CategoryModalState extends State<CategoryModal> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String nombre = '';
  String? id;

  @override
  void initState() {
    super.initState();
    id = widget.categoria?.id;
    nombre = (widget.categoria?.nombre).value();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 300,
      decoration: _buildBoxDecoration(),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.categoria?.nombre ?? 'Nueva categoria', style: CustomLabels.h1.copyWith(color: Colors.white),),
                Material(
                  color: Colors.transparent,
                  child: IconButton(
                    splashRadius: 18,
                    iconSize: 34,
                    icon: const Icon(Icons.close, color: Colors.white,),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ], 
            ),
          ),
          Divider(color: Colors.white.withOpacity(0.3),),
          const SizedBox(height: 20),
          Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: TextFormField(
              initialValue: widget.categoria?.nombre.value(),
              onChanged: (value) => nombre = value,
              decoration: CustomInputs.buildInputDecoration(
                hintText: 'Nombre de la categoría',
                label: 'Categoría',
                icon: Icons.new_releases_outlined
              ),
              style: const TextStyle( color: Colors.white ),
              validator: (value) {
                if( value == null || value.isEmpty ){
                  return 'Campo obligatorio';
                }
                return null;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: CustomOutlinedButton(
              text: 'Guardar',
              color: Colors.white,
              onPressed: () async {
                if( !_formKey.currentState!.validate() ) return;
                final categoryProvider = Provider.of<CategoriesProvider>(context, listen: false);
                
                if( id == null ) {
                  await categoryProvider.addCategory(nombre);
                  NotificationService.showSnackBar('Se agregó exitosamente la categoría $nombre');
                } else {
                  await categoryProvider.updateCategory(id.value(), nombre);
                  NotificationService.showSnackBar('Se actualizó exitosamente la categoría $nombre');
                }

                if( !mounted ) return;
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
  
  BoxDecoration _buildBoxDecoration() {
    return const BoxDecoration(
      color: Color(0xff0F2041),
      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      boxShadow: [
        BoxShadow(
          color: Colors.black26
        )
      ]
    );
  }
}