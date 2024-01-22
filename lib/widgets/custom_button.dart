// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final Color buttonColor;
  final Color buttonTextColor;
  final String buttonText;
  final VoidCallback onPress;
  const CustomButton({
    Key? key,
    required this.buttonColor,
    required this.buttonTextColor,
    required this.buttonText,
    required this.onPress,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: widget.buttonColor),
        child: Center(
          child: Text(
            widget.buttonText,
            style: TextStyle(color: widget.buttonTextColor),
          ),
        ),
      ),
    );
  }
}
