import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomTextFormField({
     super.key,
     required this.label,
     this.controller,
     this.validator});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          errorBorder: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(),           
          focusedBorder: const OutlineInputBorder(),
          disabledBorder: const OutlineInputBorder(),
          focusedErrorBorder: const OutlineInputBorder(),
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator:validator ,
      ),
    );
  }
}