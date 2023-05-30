import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static String routename = '/login-screen';

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter your mobile number\nto get OTP',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
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
                prefixIcon: const Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '+91',
                        style: TextStyle(
                          color: Color.fromARGB(190, 0, 0, 0),
                          fontSize: 16,
                        ),
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
            ),
            const SizedBox(height: 16),
            RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 13, color: Color.fromARGB(186, 0, 0, 0)),
                children: [
                  const TextSpan(text: 'By clicking, I accept the '),
                  TextSpan(
                    text: 'terms of service',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Single tapped.
                        print('test1');
                      },
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: Color.fromARGB(125, 0, 0, 0),
                      decorationThickness: 2,
                    ),
                  ),
                  const TextSpan(text: ' and '),
                  TextSpan(
                    text: 'privacy policy ',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Single tapped.
                        print('test2');
                      },
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: Color.fromARGB(125, 0, 0, 0),
                      decorationThickness: 2,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}