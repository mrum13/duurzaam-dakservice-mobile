import 'package:flutter/material.dart';

class DetailServicePage extends StatelessWidget {
  const DetailServicePage({super.key});

  @override
  Widget build(BuildContext context) {
        final serviceData = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text(serviceData['title'] ?? "Service Details"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(serviceData['image'] ?? 'assets/default_image.png', 
                height: 200, 
                width: double.infinity,
                fit: BoxFit.fill),
              ),
              const SizedBox(height: 16),
              Text(
                serviceData['title_detail'] ?? "No description available.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
              ),
              const SizedBox(height: 8),
              Text(
                serviceData['desc'] ?? "No description available.",
                
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              )
            ],
          ),
        ),
      ),
    );
  }
}