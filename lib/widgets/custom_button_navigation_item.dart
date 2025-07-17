import 'package:duurzaam_dakservice/common/app_colors.dart';
import 'package:duurzaam_dakservice/cubit/navbar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButtonNavigationItem extends StatelessWidget {
  final IconData icon;
  final int index;

  const CustomButtonNavigationItem({
    super.key,
    required this.icon,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<NavbarCubit>().setPage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Icon(
            icon,
            size: 24,
            color: context.read<NavbarCubit>().state == index
                ? AppColors.green1Color
                : AppColors.grayColor,
          ),
          Container(
            width: 30,
            height: 2,
            decoration: BoxDecoration(
                color: context.read<NavbarCubit>().state == index
                    ? AppColors.green1Color
                    : AppColors.transparentColor,
                borderRadius: BorderRadius.circular(18)),
          )
        ],
      ),
    );
  }
}