import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      // controller: textEditingController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Mobile Number',
        labelStyle: const TextStyle(
          color: Color.fromARGB(255, 226, 86, 7),
          fontWeight: FontWeight.w600,
        ),
        hintText: '10 digit mobile number',
        hintStyle: const TextStyle(color: Colors.grey),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefix: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '+91',
              style: TextStyle(color: Color.fromARGB(190, 0, 0, 0)),
            ),
            SizedBox(
              width: 10,
            ),
            SizedBox(
              height: 22,
              child: VerticalDivider(
                color: Color.fromARGB(255, 205, 204, 209),
                thickness: 1,
                width: 1,
              ),
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 2,
            color: Color.fromARGB(255, 244, 98, 15),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 2,
            color: Color.fromARGB(255, 244, 98, 15),
          ),
        ),
      ),
    );
  }
}
