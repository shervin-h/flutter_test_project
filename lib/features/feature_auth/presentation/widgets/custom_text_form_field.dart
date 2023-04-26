import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.controller,
    this.validator,
    this.obscureText,
    this.keyboardType,
    this.maxLength,
    this.hintText,
    this.hintStyle,
    this.radius,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final int? maxLength;
  final String? hintText;
  final TextStyle? hintStyle;
  final double? radius;

  @override
  Widget build(BuildContext context) {

    final ThemeData themeData = Theme.of(context);

    return Material(
      elevation: 6,
      color: themeData.colorScheme.primary,
      borderRadius: BorderRadius.circular(radius ?? 16),
      child: TextFormField(
        validator: validator,
        controller: controller,
        obscureText: obscureText ?? false,
        keyboardType: keyboardType,
        maxLength: maxLength,
        style: TextStyle(
          fontFamily: 'Vazir',
          color: Colors.grey.shade800,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle ?? TextStyle(
            fontFamily: 'Vazir',
            color: Colors.grey.shade500,
            fontWeight: FontWeight.bold,
          ),
          contentPadding: const EdgeInsets.all(8),
          counterText: "",
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(radius ?? 16)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: themeData.colorScheme.primary, width: 2), borderRadius: BorderRadius.circular(radius ?? 16)),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(radius ?? 16)),
          errorBorder: OutlineInputBorder(borderSide: BorderSide(color: themeData.colorScheme.secondary, width: 2), borderRadius: BorderRadius.circular(radius ?? 16)),
        ),
      ),
    );
  }
}
