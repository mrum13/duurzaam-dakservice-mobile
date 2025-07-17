import 'package:duurzaam_dakservice/common/app_colors.dart';
import 'package:flutter/material.dart';

class CardContentDarkBlue extends StatelessWidget {
  final String title1;
  final String title2;
  final String description;

  const CardContentDarkBlue({
    super.key,
    required this.title1,
    required this.title2,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text("$title1 ",
                style: TextStyle(
                    color: AppColors.green2Color,
                    fontSize: 16,
                    fontWeight: FontWeight.w700)),
            Text(title2,
                style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700)),
          ],
        ),
        const SizedBox(height: 8,),
        Text(description,
            style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 14,
                fontWeight: FontWeight.w600)),
      ],
    );
  }
}