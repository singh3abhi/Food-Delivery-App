import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/location_access_screen.dart';
import 'package:food_delivery_app/utils/globals.dart';
import 'package:food_delivery_app/widgets/custom_text_button.dart';
import 'package:pinput/pinput.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});
  static String routename = '/verify-otp-screen';

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _otpController = TextEditingController();
  int countDownSeconds = 30;
  Timer? timer;
  bool _isButtonEnabled = false;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    const onSec = Duration(seconds: 1);
    timer = Timer.periodic(onSec, (Timer timer) {
      if (countDownSeconds == 0) {
        timer.cancel();
      } else {
        setState(() {
          countDownSeconds--;
        });
      }
    });
  }

  String formatCountDown() {
    int minutes = (countDownSeconds ~/ 60);
    int seconds = countDownSeconds % 60;
    String formattedMinutes = minutes.toString().padLeft(2, '0');
    String formattedSeconds = seconds.toString().padLeft(2, '0');
    return '$formattedMinutes:$formattedSeconds';
    // return formattedMinutes;
  }

  void _validateOTP() {
    String otp = _otpController.text;
    setState(() {
      _isButtonEnabled = (otp.length == 6);
    });
    print(_isButtonEnabled);
    print(otp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset(
              'icons/back.png',
              width: 26,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Verify the OTP sent to\n${GlobalUserValues.number}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              child: Pinput(
                length: 6,
                controller: _otpController,
                onChanged: (value) => _validateOTP(),
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                defaultPinTheme: PinTheme(
                  height: 50,
                  width: 50,
                  textStyle: const TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black.withOpacity(0.3),
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Visibility(
              visible: countDownSeconds > 0,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.scale(
                    scale: 0.7,
                    child: const CircularProgressIndicator(
                      color: Color.fromARGB(255, 241, 87, 1),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Auto fetching OTP..',
                    style: TextStyle(fontSize: 17, color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Opacity(
              opacity: _isButtonEnabled ? 1 : 0.5,
              child: CustomTextButton(
                text: 'Continue',
                ontap: _isButtonEnabled
                    ? () {
                        Navigator.pushNamed(context, LocationAccessScreen.routename);
                      }
                    : () {},
              ),
            ),
            const SizedBox(height: 18),
            Visibility(
              visible: countDownSeconds > 0,
              child: Text(
                'Didn\'t receive it? Retry in ${formatCountDown()}',
                style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
              ),
            ),
            Visibility(
              visible: countDownSeconds == 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Retry via:',
                    style: TextStyle(fontSize: 17, color: Colors.grey.shade700),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 70,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(40, 241, 87, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Row(
                          children: [
                            SizedBox(
                              width: 3,
                            ),
                            Icon(
                              Icons.messenger_outline_rounded,
                              color: Color.fromARGB(255, 241, 87, 1),
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'SMS',
                              style: TextStyle(
                                color: Color.fromARGB(255, 241, 87, 1),
                                fontWeight: FontWeight.w900,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        height: 40,
                        width: 70,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(40, 241, 87, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Row(
                          children: [
                            SizedBox(
                              width: 3,
                            ),
                            Icon(
                              Icons.phone,
                              color: Color.fromARGB(255, 241, 87, 1),
                            ),
                            SizedBox(width: 6),
                            Text(
                              'CALL',
                              style: TextStyle(
                                color: Color.fromARGB(255, 241, 87, 1),
                                fontWeight: FontWeight.w900,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
