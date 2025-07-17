import 'package:duurzaam_dakservice/common/app_colors.dart';
import 'package:duurzaam_dakservice/data/services_data.dart';
import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        title: Text("Onze diensten"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) => InkWell(
            onTap: () => Navigator.pushNamed(context, '/detailService', arguments: listServicesData[index]),
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(listServicesData[index]['image'], width: double.infinity, fit: BoxFit.fill,)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        listServicesData[index]['title'], 
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ), 
          separatorBuilder: (context, index) => const SizedBox(height: 8,), 
          itemCount: listServicesData.length
        )
      )
    );
  }
}