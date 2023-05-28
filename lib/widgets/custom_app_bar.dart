import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/globals.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: InkWell(
        onTap: () {},
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
                Text(
                  GlobalLocationValues.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 18, 19, 28),
                    fontSize: 16,
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
              GlobalLocationValues.address,
              style: const TextStyle(fontSize: 10, color: Color.fromARGB(255, 81, 82, 81)),
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
              onPressed: () {},
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
