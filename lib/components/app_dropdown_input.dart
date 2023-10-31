import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppDropdownInput extends StatefulWidget {
  final String hintText;
  final List<String> options;
  final String value;
  final String Function(String) getLabel;
  final void Function(String) onChanged;

  const AppDropdownInput({
    required this.hintText,
    required this.options,
    required this.value,
    required this.getLabel,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<AppDropdownInput> createState() => _AppDropdownInputState();
}

class _AppDropdownInputState extends State<AppDropdownInput> {
  late String _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      builder: (FormFieldState<String> state) {
        return InputDecorator(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28.0),
              borderSide: const BorderSide(color: fTextColor),
              gapPadding: 0.0,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: widget.hintText,
          ),
          isEmpty: _selectedValue.isEmpty,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedValue,
              isDense: true,
              onChanged: (newValue) {
                setState(() {
                  _selectedValue = newValue!;
                  widget.onChanged(newValue);
                });
              },
              items: widget.options.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(
                    widget.getLabel(option),
                    style: const TextStyle(color: fTextColor),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
