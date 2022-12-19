import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/pokemon/pokemon_bloc.dart';

class StatsSegment extends StatelessWidget {
  const StatsSegment({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonBloc, PokemonState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: state.pokemon.stats!.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(state.pokemon.stats![index].stat!.name!.toUpperCase(),
                        style: const TextStyle(fontSize: 15),
                      ),
                      Text(state.pokemon.stats![index].baseStat!.toString(),
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  LinearProgressIndicator(
                    backgroundColor: Colors.red[100],
                    color: Colors.redAccent,
                    minHeight: 8,
                    value: state.pokemon.stats![index].baseStat! / 100,
                  ),
                  const SizedBox(height: 10),
                ]);
              }),
        );
      },
    );
  }
}
