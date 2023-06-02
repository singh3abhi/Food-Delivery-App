import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/custom_search_bar_text_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  static String routename = '/search-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 120,
        flexibleSpace: SafeArea(
          // child:  color: Colors.blue,
          child: Column(
            children: [
              const SizedBox(height: 10),
              Stack(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Search for dishes & restaurants'),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
                      child: Image.asset(
                        'icons/back.png',
                        width: 23,
                      ),
                    ),
                  ),
                ],
              ),
              const CustomSearchBar(),
            ],
          ),
        ),
      ),
      // body: const Center(
      //   child: CustomSearchBar(),
      // ),
    );
  }
}
