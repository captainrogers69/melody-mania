import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/domain/models/response/browse_category_resp.dart';
import '../../../components/cache_image.dart';
import '../../../utils/extensions/melody_extension.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  const CategoryCard({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.sp,
      decoration: BoxDecoration(
        borderRadius: eventRadiusSmaller,
        // color: colors[index],
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Transform.rotate(
          //   angle: math.pi / 4,
          CacheImage(
            image: category.icons!.first.url!,
            roundCorner: 5,
            height: 20.sp,
            width: 20.sp,
          ),
          // ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              category.name.toString(),
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}
