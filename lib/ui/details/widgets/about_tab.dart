import 'package:flutter/material.dart';
import 'package:pokeprovider_app/domain/model/pokemon.dart';
import 'package:pokeprovider_app/ui/extensions/string_ext.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            pokemon.ydescription,
            softWrap: true,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: pokemon.typeofpokemon
                .map(
                  (type) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Chip(
                      label: Text(type.name.capitalize),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
