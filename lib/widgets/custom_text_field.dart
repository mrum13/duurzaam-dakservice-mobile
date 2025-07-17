import 'package:duurzaam_dakservice/common/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  const CustomTextField({super.key, required this.hintText, this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: true,
      cursorHeight: 14,
      cursorColor: AppColors.darkBlueColor,
      decoration: InputDecoration(
          fillColor: AppColors.whiteColor,
          filled: true,
          isDense: true,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14, color: AppColors.grayColor),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.grayColor)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: AppColors.grayColor,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.darkBlueColor, width: 1.0),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 16, top: 12, bottom: 12, end: 10),
            child: Icon(
              prefixIcon,
              size: 20,
            ),
          )),
    );
  }
}
