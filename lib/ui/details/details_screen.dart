import 'package:flutter/material.dart';
import 'package:pokeprovider_app/domain/model/pokemon.dart';
import 'package:pokeprovider_app/ui/details/widgets/about_tab.dart';
import 'package:pokeprovider_app/ui/details/widgets/stats_tab.dart';
import 'package:pokeprovider_app/ui/extensions/string_ext.dart';

import 'widgets/evolutions_tab.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen(
    BuildContext context, {
    super.key,
    required this.pokemon,
  });

  /* static Widget init(BuildContext context, {required Pokemon pokemon}) {
    return ChangeNotifierProvider(
      lazy: false,
      create: (_) => pokemonProvider(
        pokemonApi: context.watch<PokemonApi>(),
      ),
      child: DetailsScreen._(pokemon: pokemon),
    );
  } */

  final Pokemon pokemon;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Column(
          children: [
            Text(
              widget.pokemon.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.pokemon.id.removeFirstCharacter,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.blueGrey,
            ),
            child: Hero(
              tag: widget.pokemon.id,
              child: Image.network(
                widget.pokemon.imageurl,
                width: 150,
                height: 150,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: TabBar(
              controller: tabController,
              labelColor: Colors.black,
              indicatorColor: Colors.blueGrey,
              tabs: const [
                Tab(text: 'About'),
                Tab(text: 'Evolutions'),
                Tab(text: 'Stats'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                AboutTab(pokemon: widget.pokemon),
                EvolutionsTab(
                  pokemonsEvolution: widget.pokemon.evolutions,
                ),
                StatsTab(pokemon: widget.pokemon),
              ],
            ),
          )
        ],
      )),
    );
  }
}
