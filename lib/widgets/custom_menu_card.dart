import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery_app/utils/globals.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMenuCard extends StatelessWidget {
  const CustomMenuCard({
    super.key,
    required this.item,
  });
  final MenuItem? item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 185,
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: item!.isVeg ? Colors.green : Colors.red,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.circle,
                        size: 10,
                        color: item!.isVeg ? Colors.green : Colors.red,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    // 'Margherita Pizza (personal Giant Slice (22.5 Cm))',
                    item!.name,
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w700,
                      fontSize: 18.5,
                      letterSpacing: -0.5,
                      color: Colors.black,
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    // '₹140',
                    item!.price,
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      letterSpacing: -0.5,
                      color: Colors.black,
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (item!.rating != null)
                    Row(
                      children: [
                        RatingBar.builder(
                          itemCount: 5,
                          direction: Axis.horizontal,
                          itemSize: 18,
                          allowHalfRating: true,
                          initialRating: item!.rating!,
                          unratedColor: Colors.grey.shade300,
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.yellow.shade700,
                          ),
                          onRatingUpdate: (value) {},
                        ),
                        const SizedBox(width: 5),
                        Text(
                          // '4.5',
                          item!.rating.toString(),
                          style: GoogleFonts.nunito(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            letterSpacing: -0.5,
                            color: Colors.yellow.shade700,
                            height: 1,
                          ),
                        ),
                        const SizedBox(width: 3),
                        Text(
                          // '(8)',
                          '(${item!.noOfRatings})',
                          style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            letterSpacing: -0.2,
                            color: Colors.black,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 25),
                  GestureDetector(
                    onTap: () => showModalBottomSheet<dynamic>(
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext bc) => customBottomSheet(bc),
                    ),
                    child: Container(
                      height: 25,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey.shade400,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 5),
                          Text(
                            'More Details',
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w600,
                              fontSize: 11.5,
                              letterSpacing: -0.2,
                              color: Colors.black87,
                              height: 1,
                            ),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_right_rounded,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.white,
              child: Stack(
                children: [
                  if (item!.urlImage.isNotEmpty)
                    Align(
                      alignment: Alignment.topCenter,
                      child: GestureDetector(
                        onTap: () => showModalBottomSheet<dynamic>(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext bc) => customBottomSheet(bc),
                        ),
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: item!.urlImage,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(144, 0, 0, 0),
                                    blurRadius: 1,
                                    spreadRadius: 1,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                              ),
                            ),
                            placeholder: (context, url) => Container(
                              width: 125,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: const DecorationImage(
                                  image: AssetImage('assets/loading.jpg'),
                                  fit: BoxFit.cover,
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(144, 0, 0, 0),
                                    blurRadius: 2,
                                    spreadRadius: 2,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                              ),
                            ),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),
                  Align(
                    alignment: item!.urlImage.isNotEmpty ? Alignment.bottomCenter : Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 22),
                      child: Material(
                        shadowColor: Colors.black,
                        elevation: 4,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 38,
                          width: 110,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey.shade400,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'ADD',
                              style: GoogleFonts.nunito(
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                                letterSpacing: -0.2,
                                color: Colors.green,
                                height: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: item!.urlImage.isNotEmpty ? 6 : 50),
                      child: Text(
                        'Customisable',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.5,
                          letterSpacing: -0.2,
                          color: Colors.black54,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget customBottomSheet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(21),
          topRight: Radius.circular(21),
        ),
      ),
      child: Wrap(
        children: <Widget>[
          if (item!.urlImage.isNotEmpty)
            Stack(
              children: [
                Positioned(
                  child: Container(
                    color: Colors.transparent,
                    height: 260,
                    width: double.infinity, // Set a non-zero width, such as double.infinity for maximum width.
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(21),
                        topRight: Radius.circular(21),
                      ),
                      child: FittedBox(
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                        child: Image.network(
                          item!.urlImage,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: width * 0.89,
                  top: 15,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Material(
                      elevation: 2,
                      shadowColor: Colors.black,
                      shape: const CircleBorder(),
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset(
                            'icons/delete-cross.png',
                            color: Colors.black54,
                            width: 9,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          if (item!.urlImage.isEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 12, 18, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Material(
                      elevation: 2,
                      shadowColor: Colors.black,
                      shape: const CircleBorder(),
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset(
                            'icons/delete-cross.png',
                            color: Colors.black54,
                            width: 9,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: item!.isVeg ? Colors.green : Colors.red,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.circle,
                              size: 10,
                              color: item!.isVeg ? Colors.green : Colors.red,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          width: 230,
                          child: Text(
                            item!.name,
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w700,
                              fontSize: 18.5,
                              letterSpacing: -0.5,
                              color: Colors.black,
                              height: 1,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          // '₹140',
                          item!.price,
                          style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            letterSpacing: -0.5,
                            color: Colors.black,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 20),
                        Material(
                          shadowColor: Colors.black,
                          elevation: 4,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 38,
                            width: 115,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.grey.shade400,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'ADD',
                                style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16,
                                  letterSpacing: -0.2,
                                  color: Colors.green,
                                  height: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Customisable',
                          style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.5,
                            letterSpacing: -0.2,
                            color: Colors.black54,
                            height: 1,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10),
                if (item!.rating != null)
                  Row(
                    children: [
                      RatingBar.builder(
                        itemCount: 5,
                        direction: Axis.horizontal,
                        itemSize: 18,
                        allowHalfRating: true,
                        initialRating: item!.rating!,
                        unratedColor: Colors.grey.shade300,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.yellow.shade700,
                        ),
                        onRatingUpdate: (value) {},
                      ),
                      const SizedBox(width: 5),
                      Text(
                        // '4.5',
                        item!.rating.toString(),
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          letterSpacing: -0.5,
                          color: Colors.yellow.shade700,
                          height: 1,
                        ),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        // '(8)',
                        '(${item!.noOfRatings})',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          letterSpacing: -0.2,
                          color: Colors.black,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 10),
                Text(
                  item!.description,
                  style: GoogleFonts.nunito(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.5,
                    letterSpacing: -0.2,
                    wordSpacing: -1,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
