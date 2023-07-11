import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/provider/auth_provider.dart';
import 'package:food_delivery_app/provider/location_provider.dart';
import 'package:food_delivery_app/provider/state_provider.dart';
import 'package:food_delivery_app/screens/home_screen.dart';
import 'package:food_delivery_app/screens/home_shimmer_screen.dart';
import 'package:food_delivery_app/screens/location_access_screen.dart';
import 'package:food_delivery_app/screens/login_screen.dart';
import 'package:food_delivery_app/screens/onBoarding_screen.dart';
import 'package:food_delivery_app/screens/search_screen.dart';
import 'package:food_delivery_app/screens/splash_screen.dart';
import 'package:food_delivery_app/utils/globals.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await loadImage(const NetworkImage('https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/background/1.jpeg'));

  runApp(const MyApp());
}

Future<void> loadImage(ImageProvider provider) {
  final config = ImageConfiguration(
    bundle: rootBundle,
    devicePixelRatio: 1,
    platform: defaultTargetPlatform,
  );
  final Completer<void> completer = Completer();
  final ImageStream stream = provider.resolve(config);

  late final ImageStreamListener listener;

  listener = ImageStreamListener((ImageInfo image, bool sync) {
    debugPrint("Image ${image.debugLabel} finished loading");
    completer.complete();
    stream.removeListener(listener);
  }, onError: (dynamic exception, StackTrace? stackTrace) {
    completer.complete();
    stream.removeListener(listener);
    FlutterError.reportError(FlutterErrorDetails(
      context: ErrorDescription('image failed to load'),
      library: 'image resource service',
      exception: exception,
      stack: stackTrace,
      silent: true,
    ));
  });

  stream.addListener(listener);
  return completer.future;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   const SystemUiOverlayStyle(
    //     statusBarColor: Colors.white,
    //     statusBarIconBrightness: Brightness.dark,
    //   ),
    // );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => LocationProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => StateProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: kColor, //<-- SEE HERE
          ),
          useMaterial3: true,
        ),
        scrollBehavior: CustomScrollBehavior(),
        home: const StatePersistence(),
        routes: {
          HomeScreen.routename: (context) => const HomeScreen(),
          SearchScreen.routename: (context) => const SearchScreen(),
          LocationAccessScreen.routename: (context) => const LocationAccessScreen(),
          LoginScreen.routename: (context) => const LoginScreen(),
          // VerifyOtpScreen.routename: (context) => const VerifyOtpScreen(),
          CustomSplashScreen.routename: (context) => const CustomSplashScreen(),
          OnBoardingScreen.routename: (context) => const OnBoardingScreen(),
        },
      ),
    );
  }
}

class StatePersistence extends StatelessWidget {
  const StatePersistence({super.key});

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    Future getDataFromSP() async {
      if (ap.isSignedIn) {
        ap.getDataFromSP();
      }
    }

    return FutureBuilder(
      future: getDataFromSP(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const HomeShimmerScreen();
        } else {
          if (ap.isSignedIn) {
            return const HomeScreen();
          } else {
            return const OnBoardingScreen();
          }
        }
      },
    );
  }
}

class CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    // When modifying this function, consider modifying the implementation in
    // the base class ScrollBehavior as well.
    late final AndroidOverscrollIndicator indicator;
    indicator = AndroidOverscrollIndicator.glow;
    // if (Theme.of(context).useMaterial3) {
    //   indicator = AndroidOverscrollIndicator.stretch;
    // } else {
    //   indicator = AndroidOverscrollIndicator.glow;
    // }
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        return child;
      case TargetPlatform.android:
        switch (indicator) {
          case AndroidOverscrollIndicator.stretch:
            return StretchingOverscrollIndicator(
              axisDirection: details.direction,
              clipBehavior: details.clipBehavior ?? Clip.hardEdge,
              child: child,
            );
          case AndroidOverscrollIndicator.glow:
            break;
        }
      case TargetPlatform.fuchsia:
        break;
    }
    return GlowingOverscrollIndicator(
      axisDirection: details.direction,
      color: kColor,
      child: child,
    );
  }
}
