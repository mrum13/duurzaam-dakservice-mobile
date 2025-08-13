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
          child: PageView(scrollDirection: Axis.horizontal, children: [
            Container(
              width: MediaQuery.sizeOf(context).width - 32,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.grayColor, width: 0.5),
              ),
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Stap 1: Kies uw onderwerp",
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.asset(
                            "assets/images/step1_3.png",
                            height: 200,
                            width: 200,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Image.asset(
                            "assets/images/step3_1.png",
                            height: 250,
                            width: 250,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text("1. Selecteer het onderwerp van uw aanvraag",
                        style: TextStyle(color: AppColors.blackColor)),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                        "2. Omschrijf uw situatie duidelijk zodat wij u het beste kunnen helpen",
                        style: TextStyle(color: AppColors.blackColor)),
                    const SizedBox(
                      height: 8,
                    ),
                    Text("3. Selecteer waar u het probleem gevonden heeft",
                        style: TextStyle(color: AppColors.blackColor)),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width - 32,
              height: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.grayColor, width: 0.5),
              ),
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Stap 2: Foto's en/of video's",
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
                    Text("4. Upload een foto of video van de situatie",
                        style: TextStyle(color: AppColors.blackColor)),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                        "5. U kunt uploaden vanuit uw galerij, maar ook direct een foto maken vanuit de app",
                        style: TextStyle(color: AppColors.blackColor)),
                  ],
                ),
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
                  Text("Stap 3: Uw gegevens",
                      style: TextStyle(
                          color: AppColors.blackColor, fontSize: 18)),
                  const SizedBox(height: 32),
                  Center(
                    child: Image.asset(
                      "assets/images/step3_2.png",
                      height: 300,
                      width: 300,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text("6. Vul hier uw gegevens in zodat we zo snel mogelijk contact met u kunnen opnemen voor uw dak",
                      style: TextStyle(color: AppColors.blackColor)),
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Stap 4. Gegevens controleren",
                        style:
                            TextStyle(color: AppColors.blackColor, fontSize: 18)),
                    const SizedBox(height: 8),
                    Center(
                      child: Image.asset(
                        "assets/images/step4.png",
                      ),
                    ),
                    SizedBox(height: 16),
                    Text("7. Controleer uw gegevens voordat u het formulier verzend",
                        style: TextStyle(color: AppColors.blackColor)),
                    const SizedBox(height: 8,),
                    Text("8. Verzend het formulier en wij nemen zo snel mogelijk contact me u op",
                        style: TextStyle(color: AppColors.blackColor)),
                    const SizedBox(height: 8,),
                    Text("9. Mocht u meer haast hebben, u kunt ons altijd bellen via de belknop onderin!",
                        style: TextStyle(color: AppColors.blackColor)),
                  ],
                ),
              ),
            ),
          ])),
    );
  }
}
