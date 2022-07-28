import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:flutter/material.dart';

class SearchText extends StatelessWidget {
  const SearchText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: _buildBoxDecoration(),
      child: TextField(
        decoration: CustomInputs.searchInputDecoration(hintText: 'Buscar', icon: Icons.search_outlined),
      ),
    );
  }
  
  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    color: Colors.grey.withOpacity(0.1),
    borderRadius: BorderRadius.circular(10)
  );
}