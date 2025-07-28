import 'package:duurzaam_dakservice/common/app_colors.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    // CarouselController carouselController = CarouselController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Help"),
      ),
      body: Padding(
          padding: EdgeInsets.all(16.0),
          child: CarouselView(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              itemExtent: MediaQuery.sizeOf(context).width - 32,
              itemSnapping: true,
              // flexWeights: [1],
              scrollDirection: Axis.horizontal,
              // shrinkExtent: 10,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width - 32,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.grayColor, width: 0.5),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Step 1",
                          style: TextStyle(
                              color: AppColors.blackColor, fontSize: 18)),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Image.asset(
                              "assets/images/step1_1.png",
                              height: 200,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Image.asset(
                              "assets/images/step1_2.png",
                              height: 200,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Center(
                        child: Image.asset(
                          "assets/images/step1_3.png",
                          height: 200,
                          width: 200,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "1. Pilih jenis kendala",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: AppColors.blackColor)
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "2. Isi keterangan kendala",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: AppColors.blackColor)
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width - 32,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.grayColor, width: 0.5),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Step 2",
                          style: TextStyle(
                              color: AppColors.blackColor, fontSize: 18)),
                      const SizedBox(height: 8),
                      Center(
                        child: Image.asset(
                          "assets/images/step2_1.png",
                          height: 200,
                          width: 200,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Center(
                        child: Image.asset(
                          "assets/images/step2_2.png",
                          height: 300,
                          width: 300,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "3. Masukan foto kendala",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: AppColors.blackColor)
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "4. Bisa melalui kamera atau galeri",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: AppColors.blackColor)
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width - 32,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.grayColor, width: 0.5),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Step 3",
                          style: TextStyle(
                              color: AppColors.blackColor, fontSize: 18)),
                      const SizedBox(height: 8),
                      Center(
                        child: Image.asset(
                          "assets/images/step3_1.png",
                          height: 250,
                          width: 250,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Center(
                        child: Image.asset(
                          "assets/images/step3_2.png",
                          height: 300,
                          width: 300,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "5. Pilih lokasi kerusakan terbesar",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: AppColors.blackColor)
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width - 32,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.grayColor, width: 0.5),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Step 4",
                          style: TextStyle(
                              color: AppColors.blackColor, fontSize: 18)),
                      const SizedBox(height: 8),
                      Center(
                        child: Image.asset(
                          "assets/images/step4.png",
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "6. Lengkapi data diri",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: AppColors.blackColor)
                      ),
                    ],
                  ),
                ),
              ])),
    );
  }
}
