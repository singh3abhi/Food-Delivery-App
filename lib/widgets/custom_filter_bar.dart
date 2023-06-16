import 'package:flutter/material.dart';

class FilterBar extends StatelessWidget {
  const FilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          const SizedBox(width: 15),
          Center(
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: const Color.fromARGB(188, 158, 158, 158),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    const Text(
                      'Filter',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(width: 6),
                    Image.asset(
                      'icons/filter.png',
                      width: 18,
                      height: 18,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          const FilterCard(text: 'Sort by', image: 'icons/arrowdown.png'),
          const SizedBox(width: 10),
          const FilterCard(text: 'Fast Delivery'),
          const SizedBox(width: 10),
          const FilterCard(text: 'Cuisines', image: 'icons/arrowdown.png'),
          const SizedBox(width: 10),
          const FilterCard(text: 'New on Swiggy'),
          const SizedBox(width: 10),
          const FilterCard(text: 'Ratings 4.0+'),
          const SizedBox(width: 10),
          const FilterCard(text: 'Pure Veg'),
          const SizedBox(width: 10),
          const FilterCard(text: 'Rs. 300-Rs. 600'),
          const SizedBox(width: 10),
          const FilterCard(text: 'Less than Rs. 300'),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}

class FilterCard extends StatelessWidget {
  const FilterCard({super.key, required this.text, this.image});
  final String text;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: const Color.fromARGB(188, 158, 158, 158),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Text(
                text,
                style: const TextStyle(fontSize: 14),
              ),
              if (image != null) const SizedBox(width: 6),
              if (image != null)
                Image.asset(
                  image!,
                  width: 13,
                  height: 13,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
