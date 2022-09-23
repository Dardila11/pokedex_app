import 'package:flutter/material.dart';
import 'package:pokeprovider_app/domain/model/pokemon.dart';

class StatsTab extends StatelessWidget {
  const StatsTab({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          StatsRow(
              statDescription: 'Attack', statValue: pokemon.attack.toString()),
          StatsRow(
              statDescription: 'Defense',
              statValue: pokemon.defense.toString()),
          StatsRow(
              statDescription: 'Special Attack',
              statValue: pokemon.specialAttack.toString()),
          StatsRow(
              statDescription: 'Special Defense',
              statValue: pokemon.specialDefense.toString()),
          StatsRow(
              statDescription: 'Speed', statValue: pokemon.speed.toString()),
        ],
      ),
    );
  }
}

class StatsRow extends StatelessWidget {
  const StatsRow(
      {super.key, required this.statDescription, required this.statValue});

  final String statDescription;
  final String statValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(statDescription)),
        const SizedBox(width: 10),
        Text(statValue),
        const SizedBox(width: 10),
        Expanded(flex: 2, child: HorizontalBar(value: statValue)),
      ],
    );
  }
}

class HorizontalBar extends StatelessWidget {
  const HorizontalBar({super.key, required this.value});

  final String value;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 200,
          height: 10,
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        Container(
          width: 200 * (double.parse(value) / 100),
          height: 10,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ],
    );
  }
}
