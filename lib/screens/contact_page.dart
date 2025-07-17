import 'package:duurzaam_dakservice/common/app_colors.dart';
import 'package:duurzaam_dakservice/screens/help_page.dart';
import 'package:duurzaam_dakservice/services/utility_service.dart';
import 'package:duurzaam_dakservice/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Contact"),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  const SizedBox(
                    height: 24,
                  ),
                  Text("Deskundig en duurzaam voor uw dak",
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                      "Contact opnemen is vrijblijvend en binnen één minuut geregeld, met spoed een dakdekker nodig? Dan is bellen atlijd sneller!",
                      style: TextStyle(
                          color: AppColors.grayColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                  const SizedBox(
                    height: 24,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {UtilityService.launchURL('tel:','0851307292');},
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.call),
                                          const SizedBox(width: 8),
                                          Text("Telefoon"),
                                        ],
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.whiteColor,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 24, vertical: 12),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(24),
                                        ),
                                        minimumSize: Size(double.infinity, 44),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {UtilityService.launchURL('wa.me','0851307292');},
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.chat),
                                          const SizedBox(width: 8),
                                          Text("WhatsApp"),
                                        ],
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.whiteColor,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 24, vertical: 12),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(24),
                                        ),
                                        minimumSize: Size(double.infinity, 44),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    // Add your image upload widget here
                                  ],
                                ),
                              );
                            },
                          );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.yellowColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.phone,
                            color: AppColors.blackColor,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Bel Robert:085 130 7292",
                            style: TextStyle(
                                color: AppColors.blackColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12,),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HelpPage()
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.green2Color,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.info,
                            color: AppColors.whiteColor,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Hulp",
                            style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
