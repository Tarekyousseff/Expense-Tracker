// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  TextEditingController controller;
  final String hintText;
  final Color inputColor;
  TextInputType keyboardType;
  CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.inputColor,
    required this.keyboardType,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: widget.inputColor, fontWeight: FontWeight.w500),
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.green, width: 2)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: Colors.green,
                style: BorderStyle.solid,
              )),
          hintText: widget.hintText,
          hintStyle:
              const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.red))),
    );
  }
}
