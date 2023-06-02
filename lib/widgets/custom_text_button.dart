import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.text, required this.ontap});
  final String text;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: ontap,
      style: TextButton.styleFrom(
        fixedSize: const Size(360, 60),
        backgroundColor: const Color.fromARGB(255, 241, 87, 1),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 17),
      ),
    );
  }
}
