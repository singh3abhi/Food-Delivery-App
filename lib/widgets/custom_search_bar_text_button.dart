import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/search_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class CustomSearchBarButton extends StatelessWidget {
  const CustomSearchBarButton({super.key, required this.text, this.isCenter = false});
  final String text;
  final bool isCenter;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      height: 46,
      width: width * 0.915,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 242, 242, 242),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: const SearchScreen(),
                    type: PageTransitionType.rightToLeft,
                  ),
                );
              },
              style: const ButtonStyle(splashFactory: NoSplash.splashFactory),
              child: Row(
                children: [
                  if (isCenter) SizedBox(width: width * 0.248),
                  Text(
                    text,
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.5,
                      letterSpacing: -0.5,
                      wordSpacing: 0,
                      color: Colors.black54,
                      height: 1,
                    ),
                  ),
                  // SizedBox(width: width * 0.368),
                  isCenter ? SizedBox(width: width * 0.132) : SizedBox(width: width * 0.148),
                  const Icon(
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
          ),
        ],
      ),
    );
  }
}
