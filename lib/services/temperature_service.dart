class TemperatureService {
  const TemperatureService._();

  /// F = (C * 9 / 5) + 32
  static double celsiusToFahrenheit(double celsius) {
    return (celsius * 9 / 5) + 32;
  }

  /// C = (F - 32) * 5 / 9
  static double fahrenheitToCelsius(double fahrenheit) {
    return (fahrenheit - 32) * 5 / 9;
  }
}
