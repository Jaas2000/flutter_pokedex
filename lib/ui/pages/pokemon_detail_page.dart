import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/ui/bloc/pokemon/pokemon_bloc.dart';
import 'package:pokedex/ui/pages/widgets/segment_detail.dart';

class PokemonDetailPage extends StatefulWidget {
  const PokemonDetailPage({super.key});

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  late PokemonBloc pokemonBloc;

  @override
  void initState() {
    pokemonBloc = BlocProvider.of<PokemonBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    pokemonBloc.add(FirstLoadDetailPokemon(firstLoadDetail: true));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments! as Map;

    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.redAccent,
      elevation: 0,
    ),
      body: SafeArea(
        child: BlocBuilder<PokemonBloc, PokemonState>(
          builder: (context, state) {
            if (state.firstLoadDetail) {
              context.read<PokemonBloc>().add(
                  GetPokemonInfo(pokemonId: arguments["pokemonId"].toString()));
            }

            return state.firstLoadDetail
                ? Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Lottie.asset(
                        'assets/lotties/pokeball.json',
                        height: 100
                      ),
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 15,),
                        Text(
                          state.pokemon.name!.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 5,
                          ),
                        ),
                        Image.network(
                            height: 100.0,
                            width: 100.0,
                            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${arguments['pokemonId']}.png'),
                        const Text(
                          "TYPE",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: state.pokemon.types!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(state.pokemon.types![index].type!.name!.toUpperCase(),
                                        style: const TextStyle(fontSize: 15),),
                                    ],
                                  ),
                                ],
                              ),
                            );                               
                          }
                        ),
                        
                        const SizedBox(height: 15),

                        const Text(
                          "ABOUT",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text((state.species.flavorTextEntries![0].flavorText!).replaceAll('\n', ''),
                          style: const TextStyle(fontSize: 15),
                        ),

                        const SizedBox(height: 15),

                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: const SegmentDetail(),
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
