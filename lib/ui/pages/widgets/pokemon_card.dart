import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/domain/entities/pokemon_entity.dart';

class PokemonCard extends StatelessWidget {
  final int index;
  final Pokemon pokemon;
  const PokemonCard({super.key, required this.pokemon, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, 'pokemon_detail',
            arguments: {'pokemonId': index + 1});
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.teal[100]),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(pokemon.name!.toUpperCase()),
            CachedNetworkImage(
              imageUrl:
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png",
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ],
        ),
      ),
    );
  }
}
