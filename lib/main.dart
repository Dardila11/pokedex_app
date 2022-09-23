import 'package:flutter/material.dart';
import 'package:pokeprovider_app/data/services/pokemon_service.dart';
import 'package:pokeprovider_app/domain/repository/pokemon_api.dart';
import 'package:pokeprovider_app/ui/providers/theme_provider.dart';
import 'package:pokeprovider_app/ui/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PokemonApi>(
          create: (_) => PokemonService(),
        ),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: ((context, provider, _) {
          final isLight = provider.isLight;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Pokemon Provider',
            theme: isLight ? ThemeData.light() : ThemeData.dark(),
            home: const SplashScreen(),
          );
        }),
      ),
    );
  }
}
