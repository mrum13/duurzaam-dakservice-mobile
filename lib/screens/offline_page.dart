import 'package:duurzaam_dakservice/common/app_colors.dart';
import 'package:flutter/material.dart';

class OfflinePage extends StatelessWidget {
  const OfflinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.signal_wifi_off, size: 64, color: Colors.grey),
              const SizedBox(height: 16),
              const Text(
                "Geen internetverbinding",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Controleer uw verbinding en probeer het opnieuw.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              IconButton(
                onPressed: (){}, 
                icon: Icon(Icons.refresh, size: 32, color: AppColors.green1Color),
              )
            ],
          ),
        ),
      ),
      );
  }
}