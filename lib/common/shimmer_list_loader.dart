import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../utils/custom_dimensions.dart';

class ShimmerListLoader extends StatelessWidget {
  final double height;
  final double? width;
  const ShimmerListLoader({Key? key, required this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.builder(
        itemBuilder: (_, __) => Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Container(
            margin: const EdgeInsets.symmetric(
                horizontal: spacing_xxl_2, vertical: spacing_m),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            width: width ?? double.infinity,
            height: height,
          ),
        ),
        itemCount: 6,
      ),
    );
  }
}
