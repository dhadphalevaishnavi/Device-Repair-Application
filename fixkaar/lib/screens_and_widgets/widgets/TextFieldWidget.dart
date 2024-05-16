import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData icon;
  final dynamic validationFunction;

  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.validationFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        controller: controller,
        obscureText: hintText == 'Password' ? true : false,
        decoration: InputDecoration(
            prefixIcon: Icon(icon),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            labelText: hintText,
            hintText: hintText),
        validator: validationFunction,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}
