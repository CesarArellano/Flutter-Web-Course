import 'package:admin_dashboard/extensions/null_extensions.dart';
import 'package:admin_dashboard/models/categories_response.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class CategoryModal extends StatefulWidget {
  const CategoryModal({
    Key? key,
    required this.categoria
  }) : super(key: key);

  final Categoria? categoria;

  @override
  State<CategoryModal> createState() => _CategoryModalState();
}

class _CategoryModalState extends State<CategoryModal> {
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
          TextFormField(
            initialValue: widget.categoria?.nombre.value(),
            onChanged: (value) => nombre = value,
            decoration: CustomInputs.buildInputDecoration(
              hintText: 'Nombre de la categoría',
              label: 'Categoría',
              icon: Icons.new_releases_outlined
            ),
            style: const TextStyle( color: Colors.white ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: CustomOutlinedButton(
              text: 'Guardar',
              color: Colors.white,
              onPressed: () async {
                
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