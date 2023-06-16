import 'package:flex_with_main_child/flex_with_main_child.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage_2/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.index, required this.len, required this.check, required this.items});
  final int index;
  final int len;
  final List items;
  // check if we require single item or double item in one card
  final bool check;

  @override
  Widget build(BuildContext context) {
    final mainChildKey = GlobalKey();
    return check
        ? Row(
            children: [
              Visibility(
                visible: index == 0,
                child: const SizedBox(
                  width: 25,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 85,
                    width: 85,
                    child: Image(
                      image: AdvancedNetworkImage(
                        items[index].urlImage,
                        useDiskCache: true,
                      ),
                      fit: BoxFit.scaleDown,
                    ),
                    // child: Image(
                    //   image: CachedNetworkImageProvider(items[index].urlImage),
                    //   fit: BoxFit.scaleDown,
                    // ),
                    // child: Image.network(
                    //   items[index].urlImage,
                    //   fit: BoxFit.scaleDown,
                    // ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Expanded(
                    child: Text(
                      items[index].categoryName,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 85,
                    width: 85,
                    child: Image(
                      image: AdvancedNetworkImage(
                        items[index + len ~/ 2].urlImage,
                        useDiskCache: true,
                      ),
                      fit: BoxFit.scaleDown,
                    ),
                    // child: Image.network(
                    //   items[index + len ~/ 2].urlImage,
                    //   fit: BoxFit.scaleDown,
                    // ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Expanded(
                    child: Text(
                      items[index + len ~/ 2].categoryName,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: index == len / 2 - 1,
                child: const SizedBox(
                  width: 25,
                ),
              ),
            ],
          )
        : Row(
            children: [
              Visibility(
                visible: index == 0,
                child: const SizedBox(
                  width: 25,
                ),
              ),
              ColumnWithMainChild(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainChildKey: mainChildKey,
                children: [
                  Container(
                    key: mainChildKey,
                    height: 60,
                    width: 60,
                    child: Image(
                      image: AdvancedNetworkImage(
                        items[index].urlImage,
                        useDiskCache: true,
                      ),
                      fit: BoxFit.scaleDown,
                    ),
                    // child: Image.network(
                    //   items[index].urlImage,
                    //   fit: BoxFit.contain,
                    // ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    items[index].categoryName,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: index == len - 1,
                child: const SizedBox(
                  width: 25,
                ),
              ),
            ],
          );
  }
}
