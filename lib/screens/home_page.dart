import 'package:duurzaam_dakservice/common/app_colors.dart';
import 'package:duurzaam_dakservice/widgets/card_content_dark_blue.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> services = [
      {
        "title1": "Gecertificeerde",
        "title2": "vakmannen",
        "desc":
            "Om samen naar het beste resultaat te komen werken wij met de beste vakmannen in de markt!",
      },
      {
        "title1": "Tevreden",
        "title2": "klanten",
        "desc":
            "Door onze snelle service, onze meedenkende vakmannen en onze oplossingen op maat.",
      },
      {
        "title1": "Duurzaam",
        "title2": "maatwerk",
        "desc":
            "Voor een langdurig resultaat, verduurzaming van uw woning en verhoging van de woningwaarde.",
      },
      {
        "title1": "24/7",
        "title2": "beschikbaar",
        "desc":
            "Schade aan uw dak is al vervelend genoeg, daarom staan wij altijd klaar om u te helpen met een reparatie!",
      }
    ];

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 56,
                padding: const EdgeInsets.all(16.0),
                color: AppColors.whiteColor,
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/splash_logo.png",
                      // width: ,
                      height: 48,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      "Duurzaam Dakservice",
                      style: TextStyle(
                        color: AppColors.green2Color,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Image.asset(
                    "assets/images/background.jpg",
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 1,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 1,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text(
                            //   "Duurzaam Dakservice",
                            //   style: TextStyle(
                            //     color: AppColors.green2Color,
                            //     fontSize: 16,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            const SizedBox(height: 8),
                            Text(
                              "Voor elk dakprobleem een duurzame oplossing in Hilversum",
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Een duurzaam dak is niet alleen goed voor het milieu, maar ook voor uw portemonnee. Met de juiste dakoplossingen bespaart u jaarlijks op energiekosten en verhoogt u uw wooncomfort. Ons dakdekkersbedrijf in Hilversum staat klaar om u te helpen met hoogwaardige en duurzame dakdiensten.",
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Icon(
                                  Icons.arrow_circle_right,
                                  color: AppColors.whiteColor,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "Deskundige dakdekkers",
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.arrow_circle_right,
                                  color: AppColors.whiteColor,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "24/7 bereikbaar",
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.arrow_circle_right,
                                  color: AppColors.whiteColor,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "Hoge kwaliteit materialen",
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Navigator.pushNamed(context, '/contact');
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 40),
                                backgroundColor: AppColors.yellowColor,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                              child: Text(
                                "Offerte Aanvragen",
                                style: TextStyle(color: AppColors.blackColor),
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.call,
                                  color: AppColors.whiteColor,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "Bel Robert: ",
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "085 130 7292",
                                  style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColors.green1Color),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Gratis advies op maat",
                                      style: TextStyle(
                                          color: AppColors.whiteColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 8),
                                  Text(
                                      "Onze dakdekkers staan klaar om u te voorzien van advies op maat, of het nu gaat om renoveren of repareren, we staan voor u klaar!",
                                      style: TextStyle(
                                          color: AppColors.whiteColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500)),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.arrow_circle_right,
                                        color: AppColors.whiteColor,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        "Deskundige dakdekkers",
                                        style: TextStyle(
                                          color: AppColors.whiteColor,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.arrow_circle_right,
                                        color: AppColors.whiteColor,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        "24/7 bereikbaar",
                                        style: TextStyle(
                                          color: AppColors.whiteColor,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.arrow_circle_right,
                                        color: AppColors.whiteColor,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        "Hoge kwaliteit materialen",
                                        style: TextStyle(
                                          color: AppColors.whiteColor,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Navigator.pushNamed(context, '/contact');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      minimumSize:
                                          const Size(double.infinity, 40),
                                      backgroundColor: AppColors.yellowColor,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24, vertical: 12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                    ),
                                    child: Text(
                                      "Vrijblijvende offerte",
                                      style: TextStyle(
                                          color: AppColors.blackColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        width: double.infinity,
                        color: AppColors.darkBlueColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 16),
                          child: Column(
                            children: [
                              CardContentDarkBlue(
                                title1: services[0]['title1'],
                                title2: services[0]['title2'],
                                description: services[0]['desc'],
                              ),
                              const SizedBox(height: 12),
                              CardContentDarkBlue(
                                title1: services[1]['title1'],
                                title2: services[1]['title2'],
                                description: services[1]['desc'],
                              ),
                              const SizedBox(height: 12),
                              CardContentDarkBlue(
                                title1: services[2]['title1'],
                                title2: services[2]['title2'],
                                description: services[2]['desc'],
                              ),
                              const SizedBox(height: 12),
                              CardContentDarkBlue(
                                title1: services[3]['title1'],
                                title2: services[3]['title2'],
                                description: services[3]['desc'],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
