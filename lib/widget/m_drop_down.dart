import 'package:flutter/material.dart';
import 'package:demo/widget/space.dart';

class MDropdownField<T> extends StatelessWidget {
  final String? title;
  final bool isRequired;
  final String? hintText;
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final Function(T? val)? onChanged;

  const MDropdownField({
    super.key,
    this.title,
    this.isRequired = false,
    this.hintText,
    required this.items,
    this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: title ?? 'Select Option',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Color(0xFF2C2F3A),
            ),
            children: [
              if (isRequired)
                const TextSpan(
                  text: ' *',
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
        const Space(10),
        DropdownButtonFormField<T>(
          value: value,
          items: items,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText ?? 'Select an option',
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
            filled: true,
            fillColor: const Color(0xF7F9FCFF),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          ),borderRadius: BorderRadius.circular(8),dropdownColor: const Color(0xF7F9FCFF),
          validator: (val) {
            if (isRequired && val == null) {
              return 'Please select an option';
            }
            return null;
          },
        ),
      ],
    );
  }
}
