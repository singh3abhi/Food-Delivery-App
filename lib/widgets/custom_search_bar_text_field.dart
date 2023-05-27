import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController _textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: TextField(
          controller: _textcontroller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromARGB(255, 255, 255, 255),
            hintText: 'Search for dishes & restaurants',
            hintStyle: const TextStyle(color: Color.fromARGB(255, 112, 111, 116)),
            contentPadding: const EdgeInsets.all(10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: Colors.red),
            ),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
