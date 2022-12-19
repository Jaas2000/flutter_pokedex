import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/pokemon/pokemon_bloc.dart';

class AttackSegment extends StatelessWidget {
  const AttackSegment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonBloc, PokemonState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 400,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: state.pokemon.moves!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return RichText(
                        text: TextSpan(
                          children: [
                            const WidgetSpan(
                              child: Icon(
                                Icons.api_sharp, 
                                color: Colors.redAccent,
                                size: 20,
                              ),
                            ),

                            const TextSpan(
                              text: " ",
                            ),

                            TextSpan(
                              text: state.pokemon.moves![index].move!.name!,
                                style: const TextStyle(color: Colors.black, fontSize: 20)
                            ),
                            
                          ]
                        )
                      );
                    }),
              ),
            ],
          ),
        );
      },
    );
  }
}
