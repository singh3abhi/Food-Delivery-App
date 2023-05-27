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
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_rounded),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  const Text('Search for dishes & restaurants'),
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
