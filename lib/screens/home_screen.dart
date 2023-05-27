import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/custom_appBar.dart';
import 'package:food_delivery_app/widgets/custom_search_bar_text_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String routename = '/home-screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: CustomSearchBarButton(),
      ),
    );
  }
}
