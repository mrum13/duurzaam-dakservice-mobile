import 'package:duurzaam_dakservice/common/app_colors.dart';
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
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.green1Color),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Neem vrijblijvend contact op",
                          style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Heeft u vragen en/of opmerkingen? Neem vrijblijvend contact op met onze dakdekkers, we helpen u graag!",
                          style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        CustomTextField(
                            hintText: "Naam", prefixIcon: Icons.person),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextField(
                            hintText: "Woonplaats", prefixIcon: Icons.domain),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextField(
                            hintText: "Telefoonnummer", prefixIcon: Icons.call),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextField(
                            hintText: "E-mailadres", prefixIcon: Icons.email),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextField(
                            hintText: "Waar kunnen we je mee helpen?",
                            prefixIcon: Icons.edit),
                        const SizedBox(
                          height: 12,
                        ),
                        ElevatedButton(
                          onPressed: () {},
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
                              Text(
                                "Contact opnemen",
                                style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
                      onPressed: () {},
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
                  const SizedBox(height: 56,)
                ],
              ),
            ),
          ),
        ));
  }
}
