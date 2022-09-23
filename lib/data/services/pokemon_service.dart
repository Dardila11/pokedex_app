import 'package:pokeprovider_app/domain/model/pokemon.dart';
import 'package:pokeprovider_app/domain/repository/pokemon_api.dart';
import 'package:http/http.dart' as http;

const pokemonApiUrl =
    'https://gist.githubusercontent.com/hungps/0bfdd96d3ab9ee20c2e572e47c6834c7/raw/pokemons.json';

class PokemonService implements PokemonApi {
  @override
  Future<List<Pokemon>> getPokemons() async {
    var url = Uri.parse(pokemonApiUrl);
    var response = await http.get(url);
    return pokemonFromJson(response.body);
  }
}
