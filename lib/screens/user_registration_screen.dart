import 'package:flutter/material.dart';
import 'package:food_delivery_app/model/user_model.dart';
import 'package:food_delivery_app/provider/auth_provider.dart';
import 'package:food_delivery_app/screens/location_access_screen.dart';
import 'package:food_delivery_app/utils/globals.dart';
import 'package:food_delivery_app/utils/utils.dart';
import 'package:food_delivery_app/widgets/custom_text_button.dart';
import 'package:provider/provider.dart';

class UserRegistrationScreen extends StatefulWidget {
  const UserRegistrationScreen({super.key});

  @override
  State<UserRegistrationScreen> createState() => _UserRegistrationScreenState();
}

class _UserRegistrationScreenState extends State<UserRegistrationScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
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
                  color: kColor,
                  backgroundColor: Color.fromARGB(83, 241, 89, 1),
                  strokeWidth: 7,
                ),
              ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              const Text(
                'Help us get to know you',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              _CustomTextField(text: 'Name', keyboardType: TextInputType.name, controller: nameController),
              const SizedBox(height: 20),
              _CustomTextField(text: 'Email (Optional)', keyboardType: TextInputType.emailAddress, controller: emailController),
              const SizedBox(height: 20),
              CustomTextButton(
                text: 'Confirm Details',
                height: 60,
                ontap: () => storeData(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Store User Data To Database
  void storeData() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    UserModel userModel = UserModel(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      phoneNumber: ap.phoneNumber,
      uid: ap.uid,
    );
    if (nameController.text.isEmpty) {
      showSnackBar(context, "Please Enter the name");
    } else {
      ap.saveUserDataToFirebase(
        context: context,
        userModel: userModel,
        onSuccess: () {
          // once data is saved we need to store it locally also
          ap.saveUserDataToSP().then(
                (value) => ap.setSignIn().then(
                      (value) => Navigator.pushNamedAndRemoveUntil(
                        context,
                        LocationAccessScreen.routename,
                        (route) => false,
                      ),
                    ),
              );
        },
      );
    }
  }
}

class _CustomTextField extends StatefulWidget {
  const _CustomTextField({
    super.key,
    required this.text,
    required this.keyboardType,
    required this.controller,
  });

  final String text;
  final TextInputType keyboardType;
  final TextEditingController controller;

  @override
  State<_CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<_CustomTextField> {
  Color kBorderColor = Colors.grey;

  void changBorderColor() {
    setState(() {
      if (widget.controller.text.isEmpty) {
        kBorderColor = Colors.grey;
      } else {
        kBorderColor = const Color.fromARGB(255, 226, 86, 7);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      showCursor: false,
      onChanged: (value) => changBorderColor(),
      decoration: InputDecoration(
        labelText: widget.text,
        labelStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w600,
        ),
        floatingLabelStyle: const TextStyle(
          color: Color.fromARGB(255, 226, 86, 7),
          fontWeight: FontWeight.w600,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 2,
            color: kBorderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 2,
            color: Color.fromARGB(255, 226, 86, 7),
          ),
        ),
      ),
    );
  }
}
