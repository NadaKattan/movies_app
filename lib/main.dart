import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/color_manager.dart';
import 'package:movies/core/routes/route_generator.dart';
import 'package:movies/core/routes/routes.dart';
import 'package:movies/firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseFirestore.instance.disableNetwork();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => MaterialApp(
        scrollBehavior: const MaterialScrollBehavior()
            .copyWith(dragDevices: {PointerDeviceKind.mouse}),
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          appBarTheme: AppBarTheme(color: ColorManager.appBarBackground),
          scaffoldBackgroundColor: ColorManager.primary,
          // textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.movieDetails,
      ),
    );
  }
}