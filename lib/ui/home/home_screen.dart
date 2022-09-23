import 'package:flutter/material.dart';
import 'package:pokeprovider_app/domain/model/pokemon.dart';
import 'package:pokeprovider_app/domain/repository/pokemon_api.dart';
import 'package:pokeprovider_app/ui/details/details_screen.dart';
import 'package:pokeprovider_app/ui/extensions/string_ext.dart';
import 'package:pokeprovider_app/ui/providers/pokemon_provider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import 'widgets/search_box.dart';
import 'widgets/topbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen._();

  // init homeScreen with HomeProvider
  // this way we only inject HomeProvider to this screen not globally
  static Widget init() {
    return ChangeNotifierProvider(
      lazy: false,
      create: (context) => PokemonProvider(
        // find the injected dependency
        pokemonApi: context.read<PokemonApi>(),
      )..loadPokemons(),
      // and then load homeScreen()
      child: const HomeScreen._(),
    );
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final pokemonApiResult = context.watch<PokemonProvider>().pokemonList;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Topbar(),
              const SizedBox(height: 10),
              const Text('Search your favorite Pokemon'),
              const SizedBox(height: 10),
              const SearchBox(),
              const SizedBox(height: 20),
              pokemonApiResult == null
                  ? Expanded(
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        enabled: true,
                        child: const PokemonGridShimmer(),
                      ),
                    )
                  : const Expanded(child: PokemonGrid())
            ],
          ),
        ),
      ),
    );
  }
}

class PokemonGridShimmer extends StatelessWidget {
  const PokemonGridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: 8,
      itemBuilder: ((context, index) {
        return const Card();
      }),
    );
  }
}

class PokemonGrid extends StatelessWidget {
  const PokemonGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemonApiResult = context.watch<PokemonProvider>().searchList;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: pokemonApiResult?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        final pokemon = pokemonApiResult![index];
        return PokemonItem(pokemon: pokemon);
      },
    );
  }
}

class PokemonItem extends StatelessWidget {
  const PokemonItem({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final homeProvider = context.read<PokemonProvider>();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider.value(
              value: homeProvider,
              child: DetailsScreen(context, pokemon: pokemon),
            ),
          ),
        );
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Hero(
                tag: pokemon.id,
                child: Image.network(
                  pokemon.imageurl,
                  height: 150,
                  width: 150,
                ),
              ),
            ),
            Text(
              pokemon.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              pokemon.id.removeFirstCharacter,
              style: const TextStyle(
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
