import 'package:flutter/material.dart';
import 'package:flutter_movie_explorer/manager/movie_maneger.dart';
import 'package:flutter_movie_explorer/routes/app_routes.dart';
import 'package:flutter_movie_explorer/ui/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MovieManeger()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.tag,
      onGenerateRoute: AppRoutes.generateRoutes,
    );
  }
}
