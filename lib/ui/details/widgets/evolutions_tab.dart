import 'package:flutter/material.dart';
import 'package:pokeprovider_app/domain/model/pokemon.dart';
import 'package:pokeprovider_app/ui/details/details_screen.dart';
import 'package:pokeprovider_app/ui/providers/pokemon_provider.dart';
import 'package:provider/provider.dart';

class EvolutionsTab extends StatelessWidget {
  const EvolutionsTab({
    super.key,
    required this.pokemonsEvolution,
  });

  final List<String> pokemonsEvolution;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: pokemonsEvolution.map((id) {
        context.read<PokemonProvider>().getPokemonById(id);
        return GestureDetector(
          onTap: () {
            final pokemonProvider = context.read<PokemonProvider>();
            context.read<PokemonProvider>().getPokemonById(id);
            Pokemon newPokemon = context.read<PokemonProvider>().pokemon!;
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => ChangeNotifierProvider.value(
                  value: pokemonProvider,
                  child: DetailsScreen(context, pokemon: newPokemon),
                ),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.grey.shade300,
            ),
            width: 150,
            height: 150,
            child: Image.network(
              context.read<PokemonProvider>().pokemon!.imageurl,
              width: 100,
              height: 100,
            ),
          ),
        );
      }).toList(),
    );
  }
}
