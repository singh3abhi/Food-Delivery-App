import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:food_delivery_app/utils/globals.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';

class RestaurantCard extends StatefulWidget {
  const RestaurantCard({super.key, required this.item});
  final CardItem item;

  @override
  State<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  bool likeActive = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 15),
          Center(
            child: Stack(
              children: [
                // Container(
                //   width: 125,
                //   height: 150,
                //   decoration: BoxDecoration(
                //
                //     image: const DecorationImage(
                //       image: AssetImage('assets/loading.jpg'),
                //       fit: BoxFit.cover,
                //     ),
                //     boxShadow: const [
                //       BoxShadow(
                //         color: Color.fromARGB(144, 0, 0, 0),
                //         blurRadius: 2,
                //         offset: Offset(0, 1),
                //       ),
                //     ],
                //   ),
                //   child: Container(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(16),
                //       gradient: LinearGradient(
                //         begin: Alignment.center,
                //         end: Alignment.bottomCenter,
                //         colors: [
                //           Colors.black.withOpacity(0.1),
                //           Colors.black.withOpacity(0.4),
                //           Colors.black.withOpacity(0.7),
                //           Colors.black.withOpacity(0.9),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                // Container(
                //   width: 125,
                //   height: 150,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(16),
                //     image: DecorationImage(
                //       image: NetworkImage(widget.item.urlImage),
                //       fit: BoxFit.cover,
                //     ),
                //     boxShadow: const [
                //       BoxShadow(
                //         color: Color.fromARGB(144, 0, 0, 0),
                //         blurRadius: 2,
                //         offset: Offset(0, 1),
                //       ),
                //     ],
                //   ),
                //   child: Container(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(16),
                //       gradient: LinearGradient(
                //         begin: Alignment.center,
                //         end: Alignment.bottomCenter,
                //         colors: [
                //           Colors.black.withOpacity(0.1),
                //           Colors.black.withOpacity(0.4),
                //           Colors.black.withOpacity(0.7),
                //           Colors.black.withOpacity(0.9),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                CachedNetworkImage(
                  imageUrl: widget.item.urlImage,
                  imageBuilder: (context, imageProvider) => Container(
                    width: 125.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.1),
                            Colors.black.withOpacity(0.4),
                            Colors.black.withOpacity(0.7),
                            Colors.black.withOpacity(0.9),
                          ],
                        ),
                      ),
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
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.1),
                            Colors.black.withOpacity(0.4),
                            Colors.black.withOpacity(0.7),
                            Colors.black.withOpacity(0.9),
                          ],
                        ),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                Positioned(
                  bottom: 12,
                  left: 10,
                  child: Text(
                    '50% OFF',
                    style: GoogleFonts.karla(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: -2,
                      wordSpacing: 0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 4,
                  left: 10,
                  child: Text(
                    'UPTO ₹80',
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
                const Positioned(
                  right: 7,
                  top: 7,
                  child: Icon(
                    Icons.favorite_border_rounded,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  top: 7.9,
                  right: 5,
                  child: LikeButton(
                    size: 28,
                    likeBuilder: (isLiked) {
                      return Icon(
                        Icons.favorite,
                        color: isLiked ? Colors.pink : const Color.fromARGB(0, 255, 131, 131),
                        size: 23,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 17,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item.restaurantName!,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.openSans(
                    fontSize: 16.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 3),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: double.parse(widget.item.rating!) >= 3.9 ? const Color.fromARGB(255, 17, 102, 73) : const Color.fromARGB(255, 27, 166, 114),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      '${widget.item.rating} (${widget.item.noOfRatings})',
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.circle,
                        color: Colors.black,
                        size: 5,
                      ),
                    ),
                    Text(
                      widget.item.time!,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.openSans(fontSize: 15.5, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  widget.item.tags!,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.openSans(fontSize: 14.5, color: const Color.fromARGB(255, 71, 74, 76)),
                ),
                Row(
                  children: [
                    Text(
                      widget.item.address!,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.openSans(fontSize: 14.5, color: const Color.fromARGB(255, 71, 74, 76)),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.circle,
                        color: Color.fromARGB(255, 103, 106, 109),
                        size: 3,
                      ),
                    ),
                    Text(
                      widget.item.distance!,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.openSans(fontSize: 14.5, color: const Color.fromARGB(255, 71, 74, 76)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      height: 25,
                      width: 25,
                      color: Colors.white,
                      child: ClipPolygon(
                        sides: 6,
                        borderRadius: 5.0, // Defaults to 0.0 degrees
                        rotate: 0.0, // Defaults to 0.0 degrees
                        boxShadows: [
                          PolygonBoxShadow(color: Colors.black, elevation: 1.0),
                          PolygonBoxShadow(color: Colors.grey, elevation: 5.0)
                        ],
                        child: Container(
                          color: const Color.fromARGB(255, 101, 65, 228),
                          child: Center(
                            child: Image.asset(
                              'icons/scooter.png',
                              width: 12,
                              height: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'FREE DELIVERY',
                      style: TextStyle(
                        color: Color.fromARGB(255, 101, 65, 228),
                        fontWeight: FontWeight.w900,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.more_vert_rounded,
              color: Color.fromARGB(255, 151, 152, 155),
            ),
          )
        ],
      ),
    );
  }
}
