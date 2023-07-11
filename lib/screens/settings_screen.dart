import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_delivery_app/utils/globals.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final ScrollController _scrollController = ScrollController();
  Offset offset = const Offset(0, -1);

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset >= 78.85714285714738 && _scrollController.position.userScrollDirection == ScrollDirection.reverse) {
      // Animate in
      setState(() {
        offset = Offset(offset.dx, 1);
      });
    } else if (_scrollController.offset < 78.85714285714738 && _scrollController.position.userScrollDirection == ScrollDirection.forward) {
      // Animate out
      setState(() {
        offset = Offset(offset.dx, 0);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification notification) {
          if (notification.leading) {
            notification.paintOffset = kToolbarHeight;
          }

          return true;
        },
        child: SafeArea(
          child: Stack(
            children: [
              CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.white,
                    scrolledUnderElevation: 0,
                    automaticallyImplyLeading: false,
                    pinned: true,
                    title: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Image.asset(
                        'icons/back.png',
                        width: 25,
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'ABHINAV',
                                      style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: const SizedBox(
                                        child: Text(
                                          'EDIT',
                                          style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 244, 98, 15), fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const Text(
                                  '+91 - 6375458334  •  rockyrdx1@gmail.com',
                                  style: TextStyle(
                                    fontSize: 13.5,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black54,
                                    letterSpacing: 0,
                                    wordSpacing: -1,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Divider(
                                  color: Color.fromARGB(218, 0, 0, 0),
                                  thickness: 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          height: 492,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: settingItems.length,
                            itemBuilder: (context, index) => settingCard(
                              title1: settingItems[index].title1,
                              title2: settingItems[index].title2,
                              imagePath: settingItems[index].imagePath,
                              len: settingItems.length,
                              index: index,
                            ),
                          ),
                        ),
                        Container(
                          height: 30,
                          color: Colors.grey.shade100,
                        ),
                        SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(14, 17, 14, 17),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'LOGOUT OPTIONS',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: 12,
                                  child: Image.asset(
                                    'icons/arrowdown.png',
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 200,
                          color: Colors.grey.shade100,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: -62, // Adjust the position as needed
                left: 0,
                right: 0,
                child: AnimatedSlide(
                  offset: offset,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  child: Material(
                    elevation: 0.5,
                    color: Colors.white,
                    child: SizedBox(
                      height: 60,
                      child: Row(
                        children: [
                          const SizedBox(width: 14),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Image.asset(
                              'icons/back.png',
                              width: 25,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'MY ACCOUNT',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget settingCard({
    required String title1,
    required String title2,
    required String imagePath,
    required int len,
    required int index,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 11),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title1,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black.withOpacity(0.75)),
                    ),
                    Text(
                      title2,
                      style: const TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.normal,
                        color: Colors.black54,
                        letterSpacing: 0,
                        wordSpacing: -1,
                      ),
                    ),
                    if (index == len - 2)
                      const Text(
                        'Membership',
                        style: TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.normal,
                          color: Colors.black54,
                          letterSpacing: 0,
                          wordSpacing: -1,
                        ),
                      ),
                  ],
                ),
                SizedBox(
                  width: 12,
                  child: Image.asset(
                    imagePath,
                    color: Colors.black54,
                  ),
                )
              ],
            ),
            const SizedBox(height: 11),
            if (index != len - 1)
              const Divider(
                color: Colors.black26,
                thickness: 1.5,
              ),
          ],
        ),
      ),
    );
  }
}
