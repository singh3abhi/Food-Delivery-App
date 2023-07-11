import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/globals.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.text, required this.ontap, required this.height});
  final String text;
  final VoidCallback ontap;
  final double height;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: ontap,
      style: TextButton.styleFrom(
        minimumSize: Size(double.infinity, height),
        backgroundColor: kColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
