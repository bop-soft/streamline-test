import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:streamline/config/constants.dart';

class StreamlineTextField extends StatelessWidget {
  const StreamlineTextField(
      {super.key,
      required this.label,
      this.controller,
      this.validator,
      this.suffixIcon,
      this.keyboardType,
      this.inputFormatters,
      this.helperText,
      this.obscureText,
      this.decoration,
      this.readonly,
      this.prefixIcon,
      this.onTap,
      this.initialValue,
      this.onChanged,
      this.hintText,
      this.autofocus,
      this.validatorText,
      });
  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? helperText;
  final bool? obscureText;
  final InputDecoration? decoration;
  final bool? readonly;
  final Widget? prefixIcon;
  final void Function()? onTap;
  final String? initialValue;
  final void Function(String)? onChanged;
  final String? hintText;
  final bool? autofocus;
  final String? validatorText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.0,
      child: TextFormField(
        cursorColor: primaryColor,
        readOnly: readonly ?? false,
        onTap: onTap,
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters:
            inputFormatters ?? [LengthLimitingTextInputFormatter(50)],
        onChanged: onChanged,
        validator: validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return validatorText ?? "";
              }
              return null;
            },
        obscureText: obscureText ?? false,
        autofocus: autofocus ?? false,
        decoration: decoration ??
            InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              label: Text(label),
              labelStyle: TextStyle(color: Colors.green),
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              helperText: helperText ?? '',
              hintText: hintText,
              
            ),
      ),
    );
  }
}