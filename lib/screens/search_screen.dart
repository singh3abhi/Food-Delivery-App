import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/globals.dart';
import 'package:food_delivery_app/widgets/custom_search_bar_text_field.dart';
import 'package:food_delivery_app/widgets/custom_category_card.dart';
import 'package:lottie/lottie.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  static String routename = '/search-screen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Scaffold(
            body: Center(
              child: Container(
                height: 300,
                width: 300,
                child: Lottie.network('https://assets1.lottiefiles.com/packages/lf20_urdso8u9.json'),
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 90,
              flexibleSpace: SafeArea(
                // child:  color: Colors.blue,
                child: Column(
                  children: [
                    const SizedBox(height: 5),
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
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(
                  color: Color.fromARGB(255, 242, 243, 247),
                  thickness: 10,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 15, 0, 30),
                  child: Text(
                    'Popular Cuisines',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 30,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: searchCategoryItems.length,
                    itemBuilder: (context, index) => CategoryCard(
                      items: searchCategoryItems,
                      index: index,
                      len: searchCategoryItems.length,
                      check: false,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Color.fromARGB(255, 242, 243, 247),
                  thickness: 10,
                ),
              ],
            ),
          );
  }

  // Widget buildCard({required CardItem item, required int index, required int len}) {
  //   return Row(
  //     children: [
  //       Visibility(
  //         visible: index == 0,
  //         child: const SizedBox(
  //           width: 25,
  //         ),
  //       ),
  //       Column(
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           Container(
  //             height: 60,
  //             width: 60,
  //             child: Image.network(
  //               item.urlImage,
  //               fit: BoxFit.scaleDown,
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 3,
  //           ),
  //           Expanded(
  //             child: Text(
  //               item.name,
  //               style: const TextStyle(
  //                 fontSize: 14,
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //       Visibility(
  //         visible: index == len - 1,
  //         child: const SizedBox(
  //           width: 25,
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
