import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/globals.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterBar extends StatelessWidget {
  const FilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowIndicator();
          return true;
        },
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(width: 15),
          itemCount: filterItems.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => FilterCard(
            item: filterItems[index],
            index: index,
            len: filterItems.length,
          ),
        ),
      ),
    );
  }
}

class FilterCard extends StatelessWidget {
  const FilterCard({super.key, required this.item, required this.index, required this.len});
  final FilterCardItem item;
  final int index;
  final int len;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          if (index == 0) const SizedBox(width: 15),
          Material(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
            child: InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: () {},
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: const Color.fromARGB(188, 158, 158, 158),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Text(
                        item.text,
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          letterSpacing: -0.5,
                          color: Colors.black,
                          height: 1,
                        ),
                      ),
                      if (item.image != null) const SizedBox(width: 6),
                      if (item.image != null)
                        Image.asset(
                          item.image!,
                          width: item.size,
                          height: item.size,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (index == len - 1) const SizedBox(width: 15),
        ],
      ),
    );
  }
}
