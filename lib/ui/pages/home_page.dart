import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/ui/bloc/pokemon/pokemon_bloc.dart';
import 'package:pokedex/ui/pages/widgets/pokemon_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController = ScrollController();
  late PokemonBloc pokemonBloc;
  @override
  void initState() {
    pokemonBloc = BlocProvider.of<PokemonBloc>(context);
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        pokemonBloc.add(GetPokemonPage(url: pokemonBloc.state.nextPage));
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokedex"),
        backgroundColor: Colors.redAccent,
        elevation: 0,
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state.firstLoad) {
            context.read<PokemonBloc>().add(GetListPokemon());
          }
          return SingleChildScrollView(
            controller: scrollController,
            child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.pokemons.length,
                itemBuilder: (BuildContext context, int index) {
                  return PokemonCard(
                    index: index,
                    pokemon: state.pokemons[index],
                  );
                }),
          );
        },
      ),
    );
  }
}
