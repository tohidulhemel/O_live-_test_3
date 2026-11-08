import 'package:flutter/material.dart';

class ResultDisplay extends StatelessWidget {
  const ResultDisplay({super.key, required this.result});

  final String result;

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: const InputDecoration(
        labelText: 'Result',
        labelStyle: TextStyle(fontSize: 18, color: Color(0xFF8E8E93)),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      child: Text(
        // Keep the field height stable while there is no result yet.
        result.isEmpty ? ' ' : result,
        style: const TextStyle(fontSize: 22, color: Color(0xFF444444)),
      ),
    );
  }
}
