import 'dart:convert';

List<Pokemon> pokemonFromJson(String str) =>
    List<Pokemon>.from(json.decode(str).map((x) => Pokemon.fromJson(x)));

class Pokemon {
  Pokemon({
    required this.name,
    required this.id,
    required this.imageurl,
    required this.xdescription,
    required this.ydescription,
    required this.height,
    required this.category,
    required this.weight,
    required this.typeofpokemon,
    required this.weaknesses,
    required this.evolutions,
    required this.abilities,
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
    required this.total,
    required this.genderless,
    required this.eggGroups,
    required this.evolvedfrom,
    required this.reason,
    required this.baseExp,
  });

  final String name;
  final String id;
  final String imageurl;
  final String xdescription;
  final String ydescription;
  final String height;
  final String category;
  final String weight;
  final List<Typeofpokemon> typeofpokemon;
  final List<Typeofpokemon> weaknesses;
  final List<String> evolutions;
  final List<String> abilities;
  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDefense;
  final int speed;
  final int total;
  final int genderless;
  final String eggGroups;
  final String evolvedfrom;
  final String reason;
  final String baseExp;

  Pokemon copyWith({
    String? name,
    String? id,
    String? imageurl,
    String? xdescription,
    String? ydescription,
    String? height,
    String? category,
    String? weight,
    List<Typeofpokemon>? typeofpokemon,
    List<Typeofpokemon>? weaknesses,
    List<String>? evolutions,
    List<String>? abilities,
    int? hp,
    int? attack,
    int? defense,
    int? specialAttack,
    int? specialDefense,
    int? speed,
    int? total,
    int? genderless,
    String? eggGroups,
    String? evolvedfrom,
    String? reason,
    String? baseExp,
  }) =>
      Pokemon(
        name: name ?? this.name,
        id: id ?? this.id,
        imageurl: imageurl ?? this.imageurl,
        xdescription: xdescription ?? this.xdescription,
        ydescription: ydescription ?? this.ydescription,
        height: height ?? this.height,
        category: category ?? this.category,
        weight: weight ?? this.weight,
        typeofpokemon: typeofpokemon ?? this.typeofpokemon,
        weaknesses: weaknesses ?? this.weaknesses,
        evolutions: evolutions ?? this.evolutions,
        abilities: abilities ?? this.abilities,
        hp: hp ?? this.hp,
        attack: attack ?? this.attack,
        defense: defense ?? this.defense,
        specialAttack: specialAttack ?? this.specialAttack,
        specialDefense: specialDefense ?? this.specialDefense,
        speed: speed ?? this.speed,
        total: total ?? this.total,
        genderless: genderless ?? this.genderless,
        eggGroups: eggGroups ?? this.eggGroups,
        evolvedfrom: evolvedfrom ?? this.evolvedfrom,
        reason: reason ?? this.reason,
        baseExp: baseExp ?? this.baseExp,
      );

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
      name: json["name"],
      id: json["id"],
      imageurl: json["imageurl"],
      xdescription: json["xdescription"],
      ydescription: json["ydescription"],
      height: json["height"],
      category: json["category"],
      weight: json["weight"],
      typeofpokemon: List<Typeofpokemon>.from(
          json["typeofpokemon"].map((x) => typeofpokemonValues.map[x])),
      weaknesses: List<Typeofpokemon>.from(
          json["weaknesses"].map((x) => typeofpokemonValues.map[x])),
      evolutions: List<String>.from(json["evolutions"].map((x) => x)),
      abilities: List<String>.from(json["abilities"].map((x) => x)),
      hp: json["hp"],
      attack: json["attack"],
      defense: json["defense"],
      specialAttack: json["special_attack"],
      specialDefense: json["special_defense"],
      speed: json["speed"],
      total: json["total"],
      eggGroups: json["egg_groups"],
      evolvedfrom: json["evolvedfrom"],
      reason: json["reason"],
      baseExp: json["base_exp"],
      genderless: json['genderless']);

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "imageurl": imageurl,
        "xdescription": xdescription,
        "ydescription": ydescription,
        "height": height,
        "category": category,
        "weight": weight,
        "evolutions": List<dynamic>.from(evolutions.map((x) => x)),
        "abilities": List<dynamic>.from(abilities.map((x) => x)),
        "hp": hp,
        "attack": attack,
        "defense": defense,
        "special_attack": specialAttack,
        "special_defense": specialDefense,
        "speed": speed,
        "total": total,
        "genderless": genderless,
        "egg_groups": eggGroups,
        "evolvedfrom": evolvedfrom,
        "reason": reason,
        "base_exp": baseExp,
      };
}

enum Typeofpokemon {
  GRASS,
  POISON,
  FIRE,
  FLYING,
  WATER,
  BUG,
  NORMAL,
  ELECTRIC,
  GROUND,
  FAIRY,
  FIGHTING,
  PSYCHIC,
  ROCK,
  STEEL,
  ICE,
  GHOST,
  DRAGON,
  DARK,
  NONE
}

final typeofpokemonValues = EnumValues({
  "Bug": Typeofpokemon.BUG,
  "Dark": Typeofpokemon.DARK,
  "Dragon": Typeofpokemon.DRAGON,
  "Electric": Typeofpokemon.ELECTRIC,
  "Fairy": Typeofpokemon.FAIRY,
  "Fighting": Typeofpokemon.FIGHTING,
  "Fire": Typeofpokemon.FIRE,
  "Flying": Typeofpokemon.FLYING,
  "Ghost": Typeofpokemon.GHOST,
  "Grass": Typeofpokemon.GRASS,
  "Ground": Typeofpokemon.GROUND,
  "Ice": Typeofpokemon.ICE,
  "None": Typeofpokemon.NONE,
  "Normal": Typeofpokemon.NORMAL,
  "Poison": Typeofpokemon.POISON,
  "Psychic": Typeofpokemon.PSYCHIC,
  "Rock": Typeofpokemon.ROCK,
  "Steel": Typeofpokemon.STEEL,
  "Water": Typeofpokemon.WATER
});

class EnumValues<T> {
  Map<String, T> map;

  EnumValues(this.map);
}
