import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_advanced_networkimage_2/provider.dart';
import 'package:food_delivery_app/screens/home_shimmer_screen.dart';
import 'package:food_delivery_app/utils/globals.dart';
import 'package:food_delivery_app/widgets/custom_app_bar.dart';
import 'package:food_delivery_app/widgets/custom_filter_bar.dart';
import 'package:food_delivery_app/widgets/custom_restaurant_card.dart';
import 'package:food_delivery_app/widgets/custom_search_bar_text_button.dart';
import 'package:food_delivery_app/widgets/custom_category_card.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String routename = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  double elevation = 0;
  double paintOffset = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  void didChangeDependencies() {
    // precacheImage(const NetworkImage('https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/biryani.png'), context);
    // precacheImage(const NetworkImage('https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/cake.png'), context);
    // precacheImage(const NetworkImage('https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/cholebhature.png'), context);
    // precacheImage(const NetworkImage('https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/dessert.png'), context);
    // precacheImage(const NetworkImage('https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/icecream.png'), context);
    // precacheImage(const NetworkImage('https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/rolls.png'), context);
    // precacheImage(const NetworkImage('https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/idli.png'), context);
    // precacheImage(const NetworkImage('https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/northindian.png'), context);
    // precacheImage(const NetworkImage('https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/pavbhaji.png'), context);
    // precacheImage(const NetworkImage('https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/pizza.png'), context);
    // precacheImage(const NetworkImage('https://raw.githubusercontent.com/singh3abhi/Food-Delivery-App/main/assets/categoryImages/samosas.png'), context);

    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) => loadData());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController.removeListener(onScroll);
    super.dispose();
  }

  void onScroll() {
    setState(() {
      if (_scrollController.offset > 0 && _scrollController.offset < 530 && _scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        elevation = 4;
      } else if (_scrollController.offset > 0 && _scrollController.offset < 473 && _scrollController.position.userScrollDirection == ScrollDirection.forward) {
        elevation = 4;
      } else {
        elevation = 0;
      }
    });
  }

  Future loadData() async {
    setState(() => isLoading = true);

    await Future.wait(homeCategoryItems.map((items) => cacheImage(context, items.urlImage)).toList());
    // await Future.delayed(const Duration(seconds: 0));

    setState(() => isLoading = false);
  }

  Future reloadScreen() async {
    setState(() => isLoading = true);

    await Future.delayed(const Duration(seconds: 1));
    setState(() => isLoading = false);
  }

  Future cacheImage(BuildContext context, String urlImage) => precacheImage(
        AdvancedNetworkImage(
          urlImage,
          useDiskCache: true,
          cacheRule: const CacheRule(maxAge: Duration(days: 7)),
        ),
        context,
      );

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const HomeShimmerScreen()
        : Scaffold(
            body: SafeArea(
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification notification) {
                  if (notification.leading) {
                    notification.paintOffset = 126;
                  }

                  return true;
                },
                child: RefreshIndicator(
                  edgeOffset: 126,
                  displacement: 15,
                  color: const Color.fromARGB(255, 241, 87, 1),
                  onRefresh: () {
                    return Future.delayed(const Duration(milliseconds: 200), () {
                      reloadScreen();
                    });
                  },
                  child: CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                      const CustomAppBarDelegate(),
                      SliverPersistentHeader(
                        key: ValueKey('$elevation'),
                        delegate: SearchBarButtonDelgate(elevation),
                        pinned: true,
                      ),

                      SliverPersistentHeader(
                        delegate: FirstBodyDelegate(),
                      ),
                      SliverPersistentHeader(
                        delegate: FilterBarDelegate(),
                        pinned: true,
                      ),
                      // SliverPersistentHeader(
                      //   delegate: SecondBody(),
                      // ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: 10,
                          (context, index) => Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: RestaurantCard(
                              item: homeRestaurantItems[index],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // // appBar: const CustomAppBar(),
            // body: SafeArea(
            //   child: NestedScrollView(
            //     floatHeaderSlivers: true,
            //     headerSliverBuilder: (context, innerBoxIsScrolled) => [
            //       const CustomAppBar(),
            //       SliverPersistentHeader(
            //         delegate: SectionHeaderDelegate2("Section B"),
            //         pinned: true,
            //       ),
            //     ],
            //     body: SingleChildScrollView(
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           // const SizedBox(
            //           //   height: 80,
            //           //   child: Center(child: CustomSearchBarButton()),
            //           // ),
            //           //Created Banner MySelf
            //           Container(
            //             height: 160,
            //             width: double.infinity,
            //             decoration: const BoxDecoration(
            //               color: Color.fromARGB(255, 255, 242, 238),
            //               borderRadius: BorderRadius.only(
            //                 bottomLeft: Radius.circular(30),
            //                 bottomRight: Radius.circular(30),
            //               ),
            //             ),
            //             child: Stack(
            //               children: [
            //                 const Positioned(
            //                   right: 0,
            //                   bottom: 0,
            //                   child: Image(
            //                     height: 150,
            //                     width: 150,
            //                     image: AssetImage('assets/banners/presents.png'),
            //                   ),
            //                 ),
            //                 Positioned(
            //                   top: 30,
            //                   right: 140,
            //                   child: RotationTransition(
            //                     turns: const AlwaysStoppedAnimation(15 / 360),
            //                     child: Container(
            //                       height: 25,
            //                       width: 25,
            //                       child: const Opacity(
            //                         opacity: 1,
            //                         child: Image(
            //                           height: 150,
            //                           width: 150,
            //                           color: Color.fromARGB(64, 130, 70, 226),
            //                           image: AssetImage('assets/banners/star.png'),
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //                 Positioned(
            //                   top: 8,
            //                   right: 100,
            //                   child: RotationTransition(
            //                     turns: const AlwaysStoppedAnimation(180 / 360),
            //                     child: Container(
            //                       height: 16,
            //                       width: 16,
            //                       child: const Opacity(
            //                         opacity: 1,
            //                         child: Image(
            //                           height: 150,
            //                           width: 150,
            //                           color: Color.fromARGB(64, 130, 70, 226),
            //                           image: AssetImage('assets/banners/star.png'),
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //                 Positioned(
            //                   top: 20,
            //                   right: 60,
            //                   child: RotationTransition(
            //                     turns: const AlwaysStoppedAnimation(5 / 360),
            //                     child: Container(
            //                       height: 10,
            //                       width: 10,
            //                       child: const Opacity(
            //                         opacity: 1,
            //                         child: Image(
            //                           height: 150,
            //                           width: 150,
            //                           color: Color.fromARGB(64, 130, 70, 226),
            //                           image: AssetImage('assets/banners/star.png'),
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //                 Positioned(
            //                   left: 30,
            //                   top: 20,
            //                   child: Text(
            //                     'WELCOME TO SWIGGY',
            //                     style: GoogleFonts.karla(
            //                       fontSize: 16,
            //                       letterSpacing: 2,
            //                       color: const Color.fromARGB(255, 99, 94, 95),
            //                       fontWeight: FontWeight.w500,
            //                     ),
            //                   ),
            //                 ),
            //                 Positioned(
            //                   left: 30,
            //                   top: 50,
            //                   child: RichText(
            //                     text: TextSpan(
            //                       style: GoogleFonts.figtree(
            //                         color: const Color.fromARGB(179, 0, 0, 0),
            //                         fontSize: 24,
            //                         fontWeight: FontWeight.w800,
            //                         height: 1.2,
            //                         letterSpacing: -0.5,
            //                         wordSpacing: 3,
            //                       ),
            //                       children: const [
            //                         TextSpan(text: 'Enjoy '),
            //                         TextSpan(text: 'Free delivery\n', style: TextStyle(color: Color.fromARGB(255, 241, 87, 1))),
            //                         TextSpan(text: '& 50% OFF ', style: TextStyle(color: Color.fromARGB(255, 241, 87, 1))),
            //                         TextSpan(text: 'on your\n'),
            //                         TextSpan(text: 'first order'),
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.fromLTRB(16, 16, 0, 25),
            //             child: Text(
            //               'abhinav, what\'s on your mind?',
            //               style: GoogleFonts.figtree(
            //                 fontSize: 17,
            //                 fontWeight: FontWeight.bold,
            //                 color: Colors.black,
            //               ),
            //             ),
            //           ),
            //           isLoading
            //               ? const Center(child: CircularProgressIndicator())
            //               : SizedBox(
            //                   height: 240,
            //                   child: ListView.separated(
            //                     separatorBuilder: (context, index) => const SizedBox(
            //                       width: 30,
            //                     ),
            //                     scrollDirection: Axis.horizontal,
            //                     itemCount: homeCategoryItems.length ~/ 2,
            //                     itemBuilder: (context, index) => CategoryCard(
            //                       items: homeCategoryItems,
            //                       index: index,
            //                       len: homeCategoryItems.length,
            //                       check: true,
            //                     ),
            //                   ),
            //                 ),
            //           const SizedBox(
            //             height: 50,
            //           ),
            //           const FilterBar(),
            //           Padding(
            //             padding: const EdgeInsets.fromLTRB(16, 16, 0, 25),
            //             child: Text(
            //               '251 restaurants to explore',
            //               style: GoogleFonts.figtree(
            //                 fontSize: 17,
            //                 fontWeight: FontWeight.bold,
            //                 color: Colors.black,
            //               ),
            //             ),
            //           ),
            //           ListView.separated(
            //             separatorBuilder: (context, index) => const SizedBox(
            //               height: 20,
            //             ),
            //             shrinkWrap: true,
            //             primary: false,
            //             itemCount: 10,
            //             physics: const NeverScrollableScrollPhysics(),
            //             itemBuilder: (context, index) => RestaurantCard(
            //               item: homeRestaurantItems[index],
            //             ),
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          );
  }
}

class SearchBarButtonDelgate extends SliverPersistentHeaderDelegate {
  final double height;
  final double elevation;

  SearchBarButtonDelgate(this.elevation, [this.height = 70]);

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    // elevation = shrinkOffset > 0 ? 4 : 0;

    return Material(
      elevation: elevation,
      child: Container(
        height: 70,
        color: Colors.white,
        child: const Center(child: CustomSearchBarButton()),
      ),
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}

class FirstBodyDelegate extends SliverPersistentHeaderDelegate {
  final double height;

  FirstBodyDelegate([this.height = 475]);

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 160,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 242, 238),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Stack(
            children: [
              const Positioned(
                right: 0,
                bottom: 0,
                child: Image(
                  height: 150,
                  width: 150,
                  image: AssetImage('assets/banners/presents.png'),
                ),
              ),
              Positioned(
                top: 30,
                right: 140,
                child: RotationTransition(
                  turns: const AlwaysStoppedAnimation(15 / 360),
                  child: Container(
                    height: 25,
                    width: 25,
                    child: const Opacity(
                      opacity: 1,
                      child: Image(
                        height: 150,
                        width: 150,
                        color: Color.fromARGB(64, 130, 70, 226),
                        image: AssetImage('assets/banners/star.png'),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 100,
                child: RotationTransition(
                  turns: const AlwaysStoppedAnimation(180 / 360),
                  child: Container(
                    height: 16,
                    width: 16,
                    child: const Opacity(
                      opacity: 1,
                      child: Image(
                        height: 150,
                        width: 150,
                        color: Color.fromARGB(64, 130, 70, 226),
                        image: AssetImage('assets/banners/star.png'),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 20,
                right: 60,
                child: RotationTransition(
                  turns: const AlwaysStoppedAnimation(5 / 360),
                  child: Container(
                    height: 10,
                    width: 10,
                    child: const Opacity(
                      opacity: 1,
                      child: Image(
                        height: 150,
                        width: 150,
                        color: Color.fromARGB(64, 130, 70, 226),
                        image: AssetImage('assets/banners/star.png'),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 20,
                child: Text(
                  'WELCOME TO SWIGGY',
                  style: GoogleFonts.karla(
                    fontSize: 16,
                    letterSpacing: 2,
                    color: const Color.fromARGB(255, 99, 94, 95),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 50,
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.figtree(
                      color: const Color.fromARGB(179, 0, 0, 0),
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      height: 1.2,
                      letterSpacing: -0.5,
                      wordSpacing: 3,
                    ),
                    children: const [
                      TextSpan(text: 'Enjoy '),
                      TextSpan(text: 'Free delivery\n', style: TextStyle(color: Color.fromARGB(255, 241, 87, 1))),
                      TextSpan(text: '& 50% OFF ', style: TextStyle(color: Color.fromARGB(255, 241, 87, 1))),
                      TextSpan(text: 'on your\n'),
                      TextSpan(text: 'first order'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 0, 25),
          child: Text(
            'abhinav, what\'s on your mind?',
            style: GoogleFonts.figtree(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            if (notification.leading) {
              notification.paintOffset = 0;
            }
            return true;
          },
          child: SizedBox(
            height: 240,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                width: 30,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: homeCategoryItems.length ~/ 2,
              itemBuilder: (context, index) => CategoryCard(
                items: homeCategoryItems,
                index: index,
                len: homeCategoryItems.length,
                check: true,
              ),
            ),
          ),
        ),

        // const SizedBox(
        //   height: 50,
        // ),
      ],
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}

class FilterBarDelegate extends SliverPersistentHeaderDelegate {
  final double height;

  FilterBarDelegate([this.height = 45]);

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return Material(
      elevation: overlapsContent ? 4.0 : 0.0,
      child: Container(
        height: 45,
        color: Colors.white,
        child: const Center(child: FilterBar()),
      ),
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}

class SecondBodyDelegate extends SliverPersistentHeaderDelegate {
  final double height;

  SecondBodyDelegate([this.height = 1000]);

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
      shrinkWrap: true,
      primary: false,
      itemCount: 10,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => RestaurantCard(
        item: homeRestaurantItems[index],
      ),
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}

class CustomAppBarDelegate extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarDelegate({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return const CustomAppBar();
  }
}
