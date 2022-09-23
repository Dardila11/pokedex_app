import 'package:flutter/material.dart';
import 'package:pokeprovider_app/ui/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class Topbar extends StatelessWidget {
  const Topbar({super.key});

  @override
  Widget build(BuildContext context) {
    final isLight = context.read<ThemeProvider>().isLight;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Pokédex',
          style: Theme.of(context).textTheme.headline4?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        IconButton(
            onPressed: () {
              context.read<ThemeProvider>().changeTheme();
            },
            icon: isLight
                ? const Icon(Icons.dark_mode)
                : const Icon(Icons.light_mode))
      ],
    );
  }
}
