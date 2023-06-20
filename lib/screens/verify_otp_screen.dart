import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/provider/auth_provider.dart';
import 'package:food_delivery_app/screens/location_access_screen.dart';
import 'package:food_delivery_app/screens/user_registration_screen.dart';
import 'package:food_delivery_app/utils/globals.dart';
import 'package:food_delivery_app/widgets/custom_text_button.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String verificationId;
  // final TextEditingController otpController = TextEditingController();
  const VerifyOtpScreen({super.key, required this.verificationId});
  static String routename = '/verify-otp-screen';

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  int countDownSeconds = 30;
  Timer? timer;
  bool _isButtonEnabled = false;
  String? otpCode;

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

  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = Provider.of<AuthProvider>(context, listen: false).otpcontroller;

    void validateOTP() {
      otpCode = otpController.text;
      setState(() {
        _isButtonEnabled = (otpCode!.length == 6);
      });
      print(_isButtonEnabled);
      print(otpCode);
    }

    final defaultPinTheme = PinTheme(
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
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromARGB(255, 241, 87, 1), width: 2),
      borderRadius: BorderRadius.circular(10),
    );

    final submittedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromARGB(255, 241, 87, 1), width: 2),
      borderRadius: BorderRadius.circular(10),
    );

    final isLoading = Provider.of<AuthProvider>(context, listen: true).isLoading;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Image.asset(
                  'icons/back.png',
                  width: 26,
                ),
              ),
            ),
            if (isLoading)
              Transform.scale(
                scale: 0.5,
                child: const CircularProgressIndicator(
                  color: Color.fromARGB(255, 241, 87, 1),
                  backgroundColor: Color.fromARGB(83, 241, 89, 1),
                  strokeWidth: 7,
                ),
              ),
          ],
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
                androidSmsAutofillMethod: AndroidSmsAutofillMethod.none,
                length: 6,
                controller: otpController,
                onChanged: (value) => validateOTP(),
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                // errorPinTheme: ,
              ),
            ),
            const SizedBox(height: 18),

            Visibility(
              visible: countDownSeconds > 0 && otpController.length == 0,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.scale(
                    scale: 0.5,
                    child: const CircularProgressIndicator(
                      color: Color.fromARGB(255, 241, 87, 1),
                      backgroundColor: Color.fromARGB(83, 241, 89, 1),
                      strokeWidth: 7,
                    ),
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
                height: 60,
                ontap: _isButtonEnabled
                    ? () {
                        verifyOTP(context, otpCode!);
                      }
                    : () {},
              ),
            ),
            // Pre Caching Lottie Gifs
            Visibility(
              visible: false,
              maintainSize: false,
              maintainState: true,
              maintainAnimation: false,
              maintainInteractivity: false,
              child: Row(
                children: [
                  Lottie.network(
                    'https://assets10.lottiefiles.com/packages/lf20_kuiykf08.json',
                  ),
                ],
              ),
            ),
            Visibility(
              visible: false,
              maintainSize: false,
              maintainState: true,
              maintainAnimation: false,
              maintainInteractivity: false,
              child: Row(
                children: [
                  Lottie.network(
                    'https://assets6.lottiefiles.com/packages/lf20_urdso8u9.json',
                  ),
                ],
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

  // Verify OTP

  void verifyOTP(BuildContext context, String userOtp) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    ap.verifyOtp(
      context: context,
      verificationId: widget.verificationId,
      userOtp: userOtp,
      onSuccess: () {
        // check wheather user exists in db
        ap.checkExistingUser().then(
          (value) async {
            if (value == true) {
              // user exists in our app
              ap.getDataFromFirestore().then(
                    (value) => ap.saveUserDataToSP().then(
                          (value) => ap.setSignIn().then(
                                (value) => Navigator.pushNamed(context, LocationAccessScreen.routename),
                              ),
                        ),
                  );
            } else {
              // new user
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserRegistrationScreen(),
                  ),
                  (route) => false);
            }
          },
        );
      },
    );
  }
}
