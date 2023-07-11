import 'package:flutter/material.dart';
import 'package:food_delivery_app/provider/location_provider.dart';
import 'package:food_delivery_app/screens/location_search_screen.dart';
import 'package:food_delivery_app/screens/settings_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final lp = Provider.of<LocationProvider>(context, listen: false);
    return SliverAppBar(
      floating: true,
      // surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      scrolledUnderElevation: 0.0,
      automaticallyImplyLeading: false,
      title: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              child: const LocationSearchScreen(),
              type: PageTransitionType.bottomToTop,
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(
                  child: Icon(
                    Icons.near_me_rounded,
                    color: Color.fromARGB(255, 244, 98, 15),
                  ),
                ),
                Flexible(
                  child: Text(
                    lp.mainAddress,
                    // style: const TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 18, 19, 28), fontSize: 16.5),
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w800,
                      fontSize: 18.5,
                      letterSpacing: -0.5,
                      color: Colors.black,
                      height: 1,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black,
                ),
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              lp.secondaryAddress,
              // style: const TextStyle(fontSize: 13, color: Color.fromARGB(255, 81, 82, 81)),
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.w600,
                fontSize: 12.5,
                letterSpacing: -0.5,
                color: Colors.black54,
                // height: 1,
              ),
            ),
          ],
        ),
      ),
      centerTitle: true,
      actions: [
        Container(
          width: 35,
          height: 35,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 71, 71, 79),
            shape: BoxShape.circle,
          ),
          child: Align(
            alignment: Alignment.center,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(child: const SettingsScreen(), type: PageTransitionType.rightToLeft),
                );
              },
              icon: const Icon(
                Icons.person_rounded,
                color: Colors.white,
                size: 28,
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        )
      ],
    );
  }
}
