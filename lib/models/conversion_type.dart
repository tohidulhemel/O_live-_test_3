enum ConversionType {
  celsiusToFahrenheit,
  fahrenheitToCelsius,
}

extension ConversionTypeX on ConversionType {
  /// Text shown in the dropdown.
  String get label {
    switch (this) {
      case ConversionType.celsiusToFahrenheit:
        return 'Celsius to Fahrenheit (°C → °F)';
      case ConversionType.fahrenheitToCelsius:
        return 'Fahrenheit to Celsius';
    }
  }

  /// Unit symbol appended to the result.
  String get resultUnit {
    switch (this) {
      case ConversionType.celsiusToFahrenheit:
        return '°F';
      case ConversionType.fahrenheitToCelsius:
        return '°C';
    }
  }
}
