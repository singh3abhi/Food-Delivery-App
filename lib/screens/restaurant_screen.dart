import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_app/provider/state_provider.dart';
import 'package:food_delivery_app/utils/globals.dart';
import 'package:food_delivery_app/widgets/custom_menu_card.dart';
import 'package:food_delivery_app/widgets/custom_search_bar_text_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key, required this.item});
  final CardItem item;

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  bool remove = false;
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;
  int _pageIndex = 0;
  late ScrollController _scrollController;
  bool _isAppBarVisible = false;
  bool _isFilterBarVisible = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _scrollController = ScrollController();
    _scrollController.addListener(onScroll);
    _startTimer();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    _scrollController.dispose();
    _scrollController.removeListener(onScroll);
    super.dispose();
  }

  // For Scroll Listener
  void onScroll() {
    setState(() {
      if (_scrollController.offset > 0) {
        print(_scrollController.offset);
        _isAppBarVisible = true;
        if (_scrollController.offset == 1) _scrollController.animateTo(200, duration: const Duration(milliseconds: 1), curve: Curves.easeInOut);
      } else {
        _isAppBarVisible = false;
      }

      if (_scrollController.offset >= 486) {
        _isFilterBarVisible = true;
      } else {
        _isFilterBarVisible = false;
      }
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 4),
      (_) {
        _currentPage++;

        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate.fixed(
                  [
                    Container(
                      height: 340,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 229, 229, 237),
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(32),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 17,
                            top: 25,
                            child: SafeArea(
                              child: GestureDetector(
                                onTap: () {},
                                child: GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: Image.asset(
                                    'icons/back.png',
                                    width: 25,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(18, 0, 18, 20),
                              child: Container(
                                // height: 230,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                  border: Border.all(
                                    color: Colors.grey.withOpacity(0.6),
                                    width: 0.7,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      offset: const Offset(0, 0.5),
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            color: Colors.white,
                                            width: 260,
                                            child: Text(
                                              // 'La Pino\'z Pizza',
                                              widget.item.restaurantName!,
                                              style: GoogleFonts.nunito(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 20,
                                                letterSpacing: -0.2,
                                                wordSpacing: -1,
                                                height: 1,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () => Navigator.pop(context),
                                                child: Image.asset(
                                                  'icons/share.png',
                                                  width: 18,
                                                  color: Colors.black54,
                                                ),
                                              ),
                                              const SizedBox(width: 16),
                                              GestureDetector(
                                                onTap: () => Navigator.pop(context),
                                                child: Image.asset(
                                                  'icons/heart.png',
                                                  width: 20,
                                                  color: Colors.black54,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 3),
                                      Row(
                                        children: [
                                          Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(255, 27, 166, 114),
                                              borderRadius: BorderRadius.circular(100),
                                            ),
                                            child: const Icon(
                                              Icons.star,
                                              size: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            // ' 3.9 (1K+ ratings) ',
                                            ' ${widget.item.rating} (${widget.item.noOfRatings} ratings)',
                                            style: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 14.5, letterSpacing: -0.2, wordSpacing: -1),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              print('Tapped');
                                              setState(() {
                                                remove = true;
                                              });
                                            },
                                            child: const Icon(
                                              Icons.info_outline,
                                              size: 18,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          const Text(' • '),
                                          Text(
                                            '₹350 for two',
                                            style: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 14.5, letterSpacing: -0.2, wordSpacing: -1),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        // 'Pizzas, Pastas',
                                        widget.item.tags!,
                                        style: GoogleFonts.nunito(fontSize: 14.5, letterSpacing: -0.2, wordSpacing: -1),
                                      ),
                                      const Divider(color: Color.fromARGB(24, 0, 0, 0), thickness: 1),
                                      Row(
                                        children: [
                                          SizedBox(
                                            child: Image.asset(
                                              'icons/routeFlow.png',
                                              width: 16,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          SizedBox(
                                            height: 50,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(height: 1),
                                                RichText(
                                                  text: TextSpan(
                                                    style: GoogleFonts.nunito(fontSize: 14, color: Colors.black54, letterSpacing: -0.2, wordSpacing: -1),
                                                    children: [
                                                      TextSpan(text: 'Outlet     ', style: GoogleFonts.nunito(fontWeight: FontWeight.bold, color: Colors.black)),
                                                      TextSpan(
                                                        // text: 'Rani Bazaar',
                                                        text: widget.item.address,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 0),
                                                Row(
                                                  children: [
                                                    RichText(
                                                      text: TextSpan(
                                                        style: GoogleFonts.nunito(fontSize: 14, color: Colors.black54, letterSpacing: -0.2, wordSpacing: -1),
                                                        children: [
                                                          TextSpan(text: '${widget.item.time}   ', style: GoogleFonts.nunito(fontWeight: FontWeight.bold, color: Colors.black)),
                                                          const TextSpan(text: 'Delivery to Samta Nagar'),
                                                        ],
                                                      ),
                                                    ),
                                                    const Icon(
                                                      Icons.arrow_drop_down,
                                                      size: 30,
                                                      color: kColor,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      const Divider(color: Color.fromARGB(24, 0, 0, 0), thickness: 1),
                                      Row(
                                        children: [
                                          const Icon(Icons.info, color: kColor),
                                          const SizedBox(width: 4),
                                          Text(
                                            // '5.0 km',
                                            widget.item.distance!,
                                            style: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 15, letterSpacing: -0.2, wordSpacing: -1),
                                          ),
                                          const SizedBox(width: 5),
                                          const SizedBox(
                                            height: 15,
                                            child: VerticalDivider(
                                              color: Colors.black87,
                                              thickness: 1,
                                              width: 1,
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            '₹14 ',
                                            style: GoogleFonts.nunito(
                                              decoration: TextDecoration.lineThrough,
                                              letterSpacing: -0.2,
                                              wordSpacing: -1,
                                            ),
                                          ),
                                          Text(
                                            'Free Delivery on your order',
                                            style: GoogleFonts.nunito(fontSize: 14.5, letterSpacing: -0.2, wordSpacing: -1),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (remove)
                            Positioned(
                              left: width * 0.364,
                              top: 183,
                              child: Container(
                                height: 55,
                                width: 210,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 10, 40, 0),
                                  child: SizedBox(
                                    child: Text(
                                      'Ratings are verified and based on recent orders',
                                      style: GoogleFonts.nunito(
                                        fontSize: 12,
                                        letterSpacing: -0.2,
                                        wordSpacing: -1,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          if (remove)
                            Positioned(
                              left: width * 0.362,
                              top: 151,
                              child: const Icon(
                                Icons.arrow_drop_up_outlined,
                                size: 60,
                                color: Colors.black,
                              ),
                            ),
                          if (remove)
                            Positioned(
                              left: width * 0.8,
                              top: 195,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    remove = false;
                                  });
                                },
                                child: Container(
                                  height: 16,
                                  width: 16,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'icons/remove.png',
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                      child: Container(
                        height: 75,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 6,
                              child: PageView.builder(
                                controller: _pageController,
                                onPageChanged: (index) {
                                  _timer.cancel();
                                  _currentPage = index;
                                  _startTimer();

                                  setState(() {
                                    _pageIndex = index % offerItems.length;
                                  });
                                },
                                itemBuilder: (context, index) => pageSkeleton(
                                  item: offerItems[index % offerItems.length],
                                  radius: _pageIndex == 0 ? 40 : 30,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.horizontal(
                                    right: Radius.circular(22),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${_pageIndex + 1}/5',
                                      style: GoogleFonts.nunito(fontWeight: FontWeight.w800, fontSize: 16, letterSpacing: -0.5, wordSpacing: 10, color: kColor),
                                    ),
                                    const SizedBox(height: 2),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        ...List.generate(
                                          3,
                                          (index) => Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 2),
                                            child: dotIndicator(index: index, pageIndex: _pageIndex),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      color: Colors.white,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '꧁༺',
                              style: TextStyle(color: Colors.black54),
                            ),
                            Text(
                              ' MENU ',
                              style: GoogleFonts.nunito(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                letterSpacing: 1.5,
                                wordSpacing: -1,
                              ),
                            ),
                            const Text(
                              '༻꧂',
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(18, 20, 18, 20),
                      child: CustomSearchBarButton(text: 'Search for dishes', isCenter: true),
                    ),
                  ],
                ),
              ),
              SliverPersistentHeader(
                delegate: FilterBarDelegate(),
                pinned: false,
              ),
              SliverList(
                delegate: SliverChildListDelegate.fixed(
                  [
                    Divider(
                      color: Colors.grey.shade300,
                      thickness: 1.6,
                      indent: 18,
                      endIndent: 18,
                    ),
                    for (int i = 0; i < homeRestaurantItems[0].categoryList!.length; i++) ...[
                      // homeRestaurantItems[0].categoryList![i].menu == null ? : MenuCategory(item: homeRestaurantItems[0].categoryList![i]),
                      MenuCategory(item: homeRestaurantItems[0].categoryList![i]),
                      Container(
                        color: Colors.grey.shade200,
                        height: 20,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          if (_isAppBarVisible)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Material(
                shadowColor: Colors.black,
                elevation: 4,
                child: Container(
                  // height: 80,
                  color: Colors.white,
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(17, 0, 17, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Image.asset(
                                'icons/back.png',
                                width: 25,
                                color: Colors.black54,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                alignment: Alignment.center, // Center the content
                                child: Text(
                                  '${widget.item.restaurantName} • ${widget.item.time}',
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.openSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Image.asset(
                                  'icons/search.png',
                                  width: 24,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      if (_isFilterBarVisible) const _FilterBar(),
                      if (_isFilterBarVisible) const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget pageSkeleton({
    required OffersCardItem item,
    required double radius,
  }) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(22),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 12),
          Container(
            height: 55,
            width: 55,
            decoration: ShapeDecoration(
              shape: const StarBorder(points: 8, innerRadiusRatio: 0.75, pointRounding: 0.3),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: item.imagePath == null
                    ? [
                        const Color.fromARGB(255, 93, 113, 194),
                        const Color.fromARGB(255, 53, 37, 134),
                      ]
                    : const [
                        Color.fromARGB(255, 242, 242, 242),
                        Color.fromARGB(255, 232, 232, 233)
                      ],
              ),
            ),
            child: Center(
              child: item.imagePath == null
                  ? Text(
                      'SAVE BIG',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w800,
                        fontSize: 12,
                        letterSpacing: -0.5,
                        wordSpacing: 10,
                        color: Colors.white,
                        height: 1,
                      ),
                    )
                  : Image.asset(
                      item.imagePath!,
                      width: radius,
                      height: radius,
                      // color: Colors.white,
                    ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(
                item.title1,
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w800,
                  fontSize: 22,
                  letterSpacing: -0.2,
                  wordSpacing: -1,
                ),
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  Text(
                    item.title2,
                    style: GoogleFonts.nunito(fontWeight: FontWeight.w800, fontSize: 12, letterSpacing: -0.2, wordSpacing: -1, color: Colors.black45),
                  ),
                  const SizedBox(
                    height: 12,
                    child: VerticalDivider(
                      color: Colors.black54,
                      thickness: 1,
                      width: 1,
                    ),
                  ),
                  Text(
                    item.title3,
                    style: GoogleFonts.nunito(fontWeight: FontWeight.w800, fontSize: 12, letterSpacing: -0.2, wordSpacing: -1, color: Colors.black45),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget dotIndicator({
    required int index,
    required int pageIndex,
  }) {
    bool isActive = false;
    // print(index);

    if (index == 0 && pageIndex == 0) {
      isActive = true;
    } else if (index == 2 && pageIndex == 4) {
      isActive = true;
    } else if (index == 1 && pageIndex != 0 && pageIndex != 4) {
      isActive = true;
    }

    return Container(
      height: isActive ? 8 : 5,
      width: isActive ? 8 : 5,
      decoration: BoxDecoration(shape: BoxShape.circle, color: isActive ? kColor : Colors.grey.shade300),
    );
  }
}

class FilterBarDelegate extends SliverPersistentHeaderDelegate {
  final double height;

  FilterBarDelegate([this.height = 70]);

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 70,
      color: Colors.white,
      child: const Center(child: _FilterBar()),
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}

class _FilterBar extends StatelessWidget {
  const _FilterBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bp = Provider.of<StateProvider>(context);
    final veg = Provider.of<StateProvider>(context, listen: true).veg;
    final vegOffset = Provider.of<StateProvider>(context, listen: true).vegOffset;
    final nonVeg = Provider.of<StateProvider>(context, listen: true).nonVeg;
    final nonVegOffset = Provider.of<StateProvider>(context, listen: true).nonVegOffset;
    return Container(
      height: 35,
      color: Colors.white,
      child: Row(
        children: [
          const SizedBox(width: 18),
          GestureDetector(
            onTap: () async {
              if (veg) {
                await bp.vegOffFilter();
              } else {
                await bp.vegOnFilter();
              }
            },
            child: Container(
              height: 35,
              width: 75,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey.shade400,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      height: 12,
                      width: 40,
                      decoration: BoxDecoration(
                        color: veg ? Colors.green : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 8,
                    top: 6,
                    child: AnimatedSlide(
                      duration: const Duration(milliseconds: 100),
                      offset: vegOffset,
                      curve: Curves.ease,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.green,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.circle,
                            size: 10,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 5),
          GestureDetector(
            onTap: () async {
              if (nonVeg) {
                await bp.nonVegOffFilter();
              } else {
                await bp.nonVegOnFilter();
              }
            },
            child: Container(
              height: 35,
              width: 75,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey.shade400,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      height: 12,
                      width: 40,
                      decoration: BoxDecoration(
                        color: nonVeg ? Colors.red : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 8,
                    top: 6,
                    child: AnimatedSlide(
                      duration: const Duration(milliseconds: 100),
                      offset: nonVegOffset,
                      curve: Curves.ease,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.red,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Image.asset(
                            'icons/triangle.png',
                            color: Colors.red,
                            height: 12,
                            width: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 5),
          Container(
            height: 35,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey.shade400,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                'Bestseller',
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  letterSpacing: -0.2,
                  color: Colors.black87,
                  height: 1,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MenuCategory extends StatefulWidget {
  const MenuCategory({super.key, required this.item});
  final CategoryItem item;

  @override
  State<MenuCategory> createState() => _MenuCategoryState();
}

class _MenuCategoryState extends State<MenuCategory> with AutomaticKeepAliveClientMixin {
  bool isExpanded1 = true;
  bool isExpanded2 = true;
  double turns = 0.0;
  bool innerExpanded = false;
  double kHeight = 150;

  Future toggleExpanded() async {
    setState(() {
      isExpanded1 = !isExpanded1;
      if (isExpanded1) {
        turns += 4.0 / 8.0;
      } else {
        turns -= 4.0 / 8.0;
      }
    });

    if (isExpanded2) {
      // await Future.delayed(const Duration(milliseconds: 50));S
      setState(() {
        isExpanded2 = false;
      });
    } else {
      await Future.delayed(const Duration(milliseconds: 310));
      setState(() {
        isExpanded2 = true;
      });
    }
  }

  void updateHeight(double newHeight) {
    setState(() {
      kHeight += newHeight;
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    // final kHeight = Provider.of<StateProvider>(context, listen: true).kHeight;
    super.build(context); // Ensure the state is kept alive
    return widget.item.menu == null
        ? AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOutExpo,
            height: kHeight,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 0, 5, 0),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Text(
                          '${widget.item.categoryName} (${widget.item.subCategoryList!.length})',
                          style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w800,
                            fontSize: 21,
                            letterSpacing: -0.5,
                            color: Colors.black,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  for (int i = 0; i < widget.item.subCategoryList!.length; i++) ...[
                    MenuSubCategory(
                      item: widget.item.subCategoryList![i],
                      updateParentHeight: updateHeight,
                    ),
                  ]
                ],
              ),
            ),
          )
        : AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOutExpo,
            height: isExpanded1 ? (185 + 35) * widget.item.menu!.length + 50 : 50, // Set the desired expanded and collapsed heights
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 0, 5, 0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: toggleExpanded,
                    child: Container(
                      height: 50,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${widget.item.categoryName} (${widget.item.menu!.length})',
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w800,
                              fontSize: 21,
                              letterSpacing: -0.5,
                              color: Colors.black,
                              height: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: AnimatedRotation(
                              duration: const Duration(milliseconds: 250),
                              turns: turns,
                              child: Image.asset(
                                'icons/arrowdown.png',
                                width: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (isExpanded2)
                    Container(
                      color: Colors.white,
                      height: (185.0 + 35) * widget.item.menu!.length,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.item.menu!.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            const SizedBox(height: 20),
                            CustomMenuCard(item: widget.item.menu![index]),
                            const SizedBox(height: 15),
                            if (index != widget.item.menu!.length - 1)
                              Divider(
                                color: Colors.grey.shade300,
                                thickness: 1.5,
                                height: 0,
                              ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
  }
}

class MenuSubCategory extends StatefulWidget {
  const MenuSubCategory({super.key, required this.item, required this.updateParentHeight});
  final SubCategoryItem item;
  final void Function(double newHeight) updateParentHeight;
  @override
  State<MenuSubCategory> createState() => _MenuSubCategoryState();
}

class _MenuSubCategoryState extends State<MenuSubCategory> with AutomaticKeepAliveClientMixin {
  bool isExpanded1 = false;
  bool isExpanded2 = false;
  double turns = 0.0;

  Future toggleExpanded({required BuildContext context}) async {
    // final sp = Provider.of<StateProvider>(context, listen: false);
    setState(() {
      if (isExpanded1) {
        turns -= 4.0 / 8.0;
        widget.updateParentHeight(-(185.0 + 35) * widget.item.subMenu!.length);
        // sp.changeHeight(height: -185.0 * widget.item.subMenu!.length);
      } else {
        widget.updateParentHeight((185.0 + 35) * widget.item.subMenu!.length);
        // sp.changeHeight(height: 185.0 * widget.item.subMenu!.length);

        turns += 4.0 / 8.0;
      }
      isExpanded1 = !isExpanded1;
    });

    if (isExpanded2) {
      setState(() {
        isExpanded2 = false;
      });
    } else {
      await Future.delayed(const Duration(milliseconds: 310));
      setState(() {
        isExpanded2 = true;
      });
    }
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context); // Ensure the state is kept alive
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOutExpo,
      height: isExpanded1 ? (185 + 35) * widget.item.subMenu!.length + 50 : 50, // Set the desired expanded and collapsed heights
      color: Colors.white,
      child: Column(
        children: [
          GestureDetector(
            onTap: () => toggleExpanded(context: context),
            child: Container(
              height: 50,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 300,
                    child: Text(
                      '${widget.item.subCategoryName} (${widget.item.subMenu!.length})',
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        letterSpacing: -0.5,
                        color: Colors.black54,
                        height: 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: AnimatedRotation(
                      duration: const Duration(milliseconds: 250),
                      turns: turns,
                      child: Image.asset(
                        'icons/arrowdown.png',
                        width: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isExpanded2)
            Container(
              color: Colors.white,
              height: (185.0 + 35) * widget.item.subMenu!.length,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.item.subMenu!.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    const SizedBox(height: 20),
                    CustomMenuCard(item: widget.item.subMenu![index]),
                    const SizedBox(height: 15),
                    if (index != widget.item.subMenu!.length - 1)
                      Divider(
                        color: Colors.grey.shade300,
                        thickness: 1.5,
                        height: 0,
                      ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
