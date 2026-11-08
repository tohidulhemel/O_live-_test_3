import 'package:flutter/material.dart';

import '../models/conversion_type.dart';

class TypeDropdown extends StatelessWidget {
  const TypeDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final ConversionType value;
  final ValueChanged<ConversionType> onChanged;

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: const InputDecoration(
        labelText: 'Type',
        labelStyle: TextStyle(fontSize: 18, color: Color(0xFF8E8E93)),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.fromLTRB(0, 8, 0, 4),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<ConversionType>(
          value: value,
          isExpanded: true,
          isDense: true,
          style: const TextStyle(fontSize: 16, color: Color(0xFF444444)),
          items: ConversionType.values
              .map(
                (type) => DropdownMenuItem<ConversionType>(
                  value: type,
                  child: Text(type.label, overflow: TextOverflow.ellipsis),
                ),
              )
              .toList(),
          onChanged: (type) {
            if (type != null) onChanged(type);
          },
        ),
      ),
    );
  }
}
