import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/converter_provider.dart';
import 'screens/converter_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ConverterProvider(),
      child: const TemperatureConverterApp(),
    ),
  );
}

class TemperatureConverterApp extends StatelessWidget {
  const TemperatureConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Converter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF007AFF),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const ConverterScreen(),
    );
  }
}
