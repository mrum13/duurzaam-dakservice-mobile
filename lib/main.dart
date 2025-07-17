import 'package:duurzaam_dakservice/cubit/navbar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'screens/splash_screen.dart';
import 'services/notification_service.dart';
import 'services/utility_service.dart';
import 'package:flutter/services.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  print('🚀 Starting app initialization...');

  try {
    WidgetsFlutterBinding.ensureInitialized();
    print('✅ WidgetsFlutterBinding initialized');

    print('🔥 Initializing Firebase...');
    await Firebase.initializeApp().timeout(
      Duration(seconds: 30),
      onTimeout: () {
        print('❌ Firebase initialization timeout');
        throw Exception('Firebase initialization timeout');
      },
    );
    print('✅ Firebase initialized successfully');

    print('🔔 Initializing notifications...');
    await NotificationService.initialize().timeout(
      Duration(seconds: 15),
      onTimeout: () {
        print('❌ Notification service timeout');
        throw Exception('Notification service timeout');
      },
    );
    print('✅ Notification service initialized');

    print('🛠️ Initializing utility service...');
    await UtilityService.initialize().timeout(
      Duration(seconds: 10),
      onTimeout: () {
        print('❌ Utility service timeout');
        throw Exception('Utility service timeout');
      },
    );
    print('✅ Utility service initialized');

    print('🎉 All services initialized successfully');
  } catch (e) {
    print('💥 Initialization error: $e');
  }

  print('🏃 Running app...');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print('🏗️ Building MyApp widget...');
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavbarCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Duurzaam Dakservice',
        home: const SplashScreen(),
        builder: (context, child) {
          SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
            statusBarColor: Colors.blueAccent,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.dark,
          ));
          return child!;
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
