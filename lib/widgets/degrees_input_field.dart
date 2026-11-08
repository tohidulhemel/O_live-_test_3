import 'package:flutter/material.dart';

class DegreesInputField extends StatelessWidget {
  const DegreesInputField({
    super.key,
    required this.controller,
    this.errorText,
  });

  final TextEditingController controller;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(
        signed: true,
        decimal: true,
      ),
      style: const TextStyle(fontSize: 22, color: Color(0xFF444444)),
      decoration: InputDecoration(
        labelText: 'Degrees',
        labelStyle: const TextStyle(fontSize: 18, color: Color(0xFF8E8E93)),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        errorText: errorText,
        errorMaxLines: 2,
      ),
    );
  }
}
