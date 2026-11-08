import 'package:flutter/foundation.dart';

import '../models/conversion_type.dart';
import '../services/temperature_service.dart';

class ConverterProvider extends ChangeNotifier {
  ConversionType _selectedType = ConversionType.fahrenheitToCelsius;
  String? _errorText;
  String _result = '';

  ConversionType get selectedType => _selectedType;
  String? get errorText => _errorText;
  String get result => _result;

  void setType(ConversionType type) {
    if (type == _selectedType) return;
    _selectedType = type;
    // The old result no longer matches the selected type.
    _result = '';
    _errorText = null;
    notifyListeners();
  }

  /// Validates [input], converts it and stores the formatted result.
  void convert(String input) {
    final text = input.trim();

    if (text.isEmpty) {
      _fail('Please enter a temperature value');
      return;
    }

    final value = double.tryParse(text);
    if (value == null || value.isNaN || value.isInfinite) {
      _fail('Please enter a valid number');
      return;
    }

    final double converted;
    switch (_selectedType) {
      case ConversionType.celsiusToFahrenheit:
        converted = TemperatureService.celsiusToFahrenheit(value);
        break;
      case ConversionType.fahrenheitToCelsius:
        converted = TemperatureService.fahrenheitToCelsius(value);
        break;
    }

    _errorText = null;
    _result = '${converted.toStringAsFixed(2)} ${_selectedType.resultUnit}';
    notifyListeners();
  }

  void _fail(String message) {
    _errorText = message;
    _result = '';
    notifyListeners();
  }
}
