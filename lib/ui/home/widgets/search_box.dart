import 'package:flutter/material.dart';
import 'package:pokeprovider_app/ui/providers/pokemon_provider.dart';
import 'package:provider/provider.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        context.read<PokemonProvider>().searchPokemon(value);
      },
      decoration: const InputDecoration(
        hintText: 'Bulbasaur',
        filled: true,
        prefixIcon: Icon(Icons.search),
        enabledBorder: InputBorder.none,
      ),
    );
  }
}
