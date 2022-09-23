import 'package:flutter/material.dart';
import 'package:pokeprovider_app/domain/model/pokemon.dart';
import 'package:pokeprovider_app/domain/repository/pokemon_api.dart';

class PokemonProvider extends ChangeNotifier {
  PokemonProvider({
    required this.pokemonApi,
  });

  final PokemonApi pokemonApi;
  List<Pokemon>? pokemonList;
  List<Pokemon>? searchList;
  Pokemon? pokemon;

  void _setSearchList() {
    searchList = List<Pokemon>.from(pokemonList ?? []);
  }

  void getPokemonById(String id) {
    pokemon = pokemonList!.firstWhere((poke) => poke.id == id);
  }

  void loadPokemons() async {
    pokemonList = await pokemonApi.getPokemons();
    _setSearchList();
    notifyListeners();
  }

  void searchPokemon(String filter) {
    final cleanFilter = filter.toLowerCase();
    if (filter == "") {
      _setSearchList();
    } else {
      searchList = List<Pokemon>.from(pokemonList!.where(
        (pokemon) =>
            pokemon.name.toLowerCase().contains(cleanFilter) ||
            pokemon.id.toLowerCase().contains(cleanFilter),
      ));
    }
    notifyListeners();
  }
}
