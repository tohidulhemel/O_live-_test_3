import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/converter_provider.dart';
import '../widgets/convert_button.dart';
import '../widgets/degrees_input_field.dart';
import '../widgets/result_display.dart';
import '../widgets/type_dropdown.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({super.key});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  final TextEditingController _degreesController = TextEditingController();

  @override
  void dispose() {
    _degreesController.dispose();
    super.dispose();
  }

  void _onConvert() {
    FocusScope.of(context).unfocus();
    context.read<ConverterProvider>().convert(_degreesController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Temperature Converter',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 24),
          child: Consumer<ConverterProvider>(
            builder: (context, provider, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: DegreesInputField(
                          controller: _degreesController,
                          errorText: provider.errorText,
                        ),
                      ),
                      const SizedBox(width: 36),
                      Expanded(
                        child: TypeDropdown(
                          value: provider.selectedType,
                          onChanged: provider.setType,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  ResultDisplay(result: provider.result),
                  const SizedBox(height: 40),
                  ConvertButton(onPressed: _onConvert),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
