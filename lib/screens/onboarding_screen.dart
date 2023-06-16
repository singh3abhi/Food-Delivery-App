import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/login_screen.dart';
import 'package:food_delivery_app/widgets/custom_text_button.dart';
import 'package:transparent_image/transparent_image.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  static String routename = '/onboarding-screen';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> with TickerProviderStateMixin {
  int _currentIndex = 0;
  Timer? timer;
  List<String> images = [
    'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/background/1.jpeg',
    'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/background/3.jpeg',
    'https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/background/2.jpeg',
  ];

  List<String> customText = [
    'Order from top restaurants',
    'Get groceries in 15-30 mins',
    'Upto 40% off on dining bills',
  ];

  AnimationController? _controller;
  Animation<double>? _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.easeInOut,
      ),
    );
    _controller!.forward();

    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    _controller?.dispose();

    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // precacheImage(NetworkImage(images[0]), context);
    precacheImage(NetworkImage(images[1]), context);
    precacheImage(NetworkImage(images[2]), context);
    super.didChangeDependencies();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      setState(() {
        // print(_currentIndex);
        if (_currentIndex < images.length - 1) {
          _currentIndex++;
        } else {
          _currentIndex = 0;
        }
      });
      _controller!.reset();
      _controller!.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          FadeTransition(
            opacity: _controller!,
            child: FadeInImage.memoryNetwork(
              // fadeInDuration: Duration(milliseconds: 1000),
              // fadeOutDuration: Duration(milliseconds: 1000),
              image: images[_currentIndex],
              placeholder: kTransparentImage,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(0.8),
                  Colors.black.withOpacity(0.1),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    'assets/WhiteLogo.png',
                    height: 60,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Swiggy',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      'Food',
                      style: TextStyle(color: _currentIndex == 0 ? Colors.white : const Color.fromARGB(153, 255, 255, 255), fontSize: 22),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.circle,
                        color: Color.fromARGB(255, 241, 87, 1),
                        size: 7,
                      ),
                    ),
                    Text(
                      'Instamart',
                      style: TextStyle(color: _currentIndex == 1 ? Colors.white : const Color.fromARGB(153, 255, 255, 255), fontSize: 22),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.circle,
                        color: Color.fromARGB(255, 241, 87, 1),
                        size: 7,
                      ),
                    ),
                    Text(
                      'Dineout',
                      style: TextStyle(color: _currentIndex == 2 ? Colors.white : const Color.fromARGB(153, 255, 255, 255), fontSize: 22),
                    ),
                  ],
                ),
                // const SizedBox(height: 10),
                const Divider(
                  height: 20,
                  color: Colors.white38,
                ),
                FadeTransition(
                  opacity: _opacityAnimation!,
                  child: Text(
                    customText[_currentIndex],
                    style: const TextStyle(color: Color.fromARGB(223, 255, 255, 255), fontSize: 25),
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextButton(
                  text: 'Get Started',
                  ontap: () => Navigator.pushNamed(context, LoginScreen.routename),
                ),
                const SizedBox(height: 40),
              ],
            ),
          )
        ],
      ),
    );
  }
}
