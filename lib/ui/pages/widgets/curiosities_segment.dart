import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/pokemon/pokemon_bloc.dart';

class CuriositiesSegment extends StatelessWidget {
  const CuriositiesSegment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonBloc, PokemonState>(
      builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Height",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(state.pokemon.height.toString(),
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Weight",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(state.pokemon.weight.toString(),
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Base Happiness",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(state.species.baseHappiness.toString(),
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Base Experience",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(state.pokemon.baseExperience.toString(),
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                )
              ]),
            );
          },
        );
      },
    );
  }
}
