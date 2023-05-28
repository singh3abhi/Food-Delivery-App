import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/custom_app_bar.dart';
import 'package:food_delivery_app/widgets/custom_search_bar_text_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.name, required this.address});
  static String routename = '/home-screen';
  final String name;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(name: name, address: address),
      body: const Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: CustomSearchBarButton(),
      ),
    );
  }
}
