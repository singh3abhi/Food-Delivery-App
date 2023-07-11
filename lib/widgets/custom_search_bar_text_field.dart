import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key, required this.check, required this.text, required this.controller});
  final bool check;
  final String text;
  final TextEditingController controller;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), //shadow color
                spreadRadius: 0.5, // spread radius
                blurRadius: 0.5, // shadow blur radius
                offset: const Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          child: TextField(
            controller: widget.controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromARGB(255, 255, 255, 255),
              hintText: widget.text,
              hintStyle: const TextStyle(color: Color.fromARGB(255, 144, 145, 151)),
              contentPadding: const EdgeInsets.all(10),
              prefixIconConstraints: const BoxConstraints(minWidth: 23, maxHeight: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                // borderSide: const BorderSide(color: Color.fromARGB(255, 217, 218, 219), width: 1.2),
                borderSide: BorderSide(color: Colors.grey.shade400, width: 1.2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                // borderSide: const BorderSide(color: Color.fromARGB(255, 217, 218, 219), width: 1.2),
                borderSide: BorderSide(color: Colors.grey.shade400, width: 1.2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                // borderSide: const BorderSide(color: Color.fromARGB(255, 217, 218, 219), width: 1.2),
                borderSide: BorderSide(color: Colors.grey.shade400, width: 1.2),
              ),
              prefixIcon: widget.check
                  ? const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                      child: Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 102, 104, 110),
                      ),
                    )
                  : null,
              suffixIcon: widget.check
                  ? null
                  : Row(
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
      ),
    );
  }
}
