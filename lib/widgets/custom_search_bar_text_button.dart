import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/search_screen.dart';

class CustomSearchBarButton extends StatelessWidget {
  const CustomSearchBarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 350,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 241, 240, 245),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, SearchScreen.routename);
              },
              style: const ButtonStyle(splashFactory: NoSplash.splashFactory),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Search for dishes & restaurants',
                    style: TextStyle(
                      color: Color.fromARGB(255, 112, 111, 116),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 106, 105, 110),
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              const SizedBox(
                height: 22,
                child: VerticalDivider(
                  color: Color.fromARGB(255, 205, 204, 209),
                  thickness: 1,
                  width: 1,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.mic_outlined,
                  color: Color.fromARGB(255, 244, 98, 15),
                ),
                style: const ButtonStyle(splashFactory: NoSplash.splashFactory),
              ),
            ],
          )
        ],
      ),
    );
  }
}
