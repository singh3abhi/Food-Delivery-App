import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                child: Icon(
                  Icons.near_me_rounded,
                  color: Color.fromARGB(255, 244, 98, 15),
                ),
              ),
              Text(
                'g 118',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 18, 19, 28),
                  fontSize: 16,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black,
              ),
            ],
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            'Samta Nager, Bikaner, Rajasthan, 334001, India',
            style: TextStyle(fontSize: 10, color: Color.fromARGB(255, 81, 82, 81)),
          ),
        ],
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
