import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/custom_shimmer_widget.dart';

class HomeShimmerScreen extends StatelessWidget {
  const HomeShimmerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    ShimmerWidget.rectangular(width: 25, height: 25, shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                    const SizedBox(width: 10),
                    ShimmerWidget.rectangular(width: 165, height: 25, shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                    const SizedBox(width: 145),
                    ShimmerWidget.circular(width: 25, height: 25, shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                  ],
                ),
                const SizedBox(height: 25),
                ShimmerWidget.rectangular(width: double.infinity, height: 30, shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                const SizedBox(height: 24),
                SizedBox(
                  height: 85,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(width: 11),
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Center(
                      child: ShimmerWidget.rectangular(width: 85, height: 85, shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  height: 85,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(width: 11),
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Center(
                      child: ShimmerWidget.rectangular(width: 85, height: 85, shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                ShimmerWidget.rectangular(width: double.infinity, height: 165, shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                const SizedBox(height: 25),
                ShimmerWidget.rectangular(width: double.infinity, height: 165, shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                const SizedBox(height: 25),
                ShimmerWidget.rectangular(width: double.infinity, height: 60, shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
