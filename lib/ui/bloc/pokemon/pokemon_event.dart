part of 'pokemon_bloc.dart';

class PokemonEvent {}

class GetListPokemon extends PokemonEvent {
  GetListPokemon();
}

class GetPokemonPage extends PokemonEvent {
  final String url;
  GetPokemonPage({required this.url});
}

class GetPokemonInfo extends PokemonEvent {
  final String pokemonId;
  GetPokemonInfo({required this.pokemonId});
}

class FirstLoadDetailPokemon extends PokemonEvent {
  final bool firstLoadDetail;
  FirstLoadDetailPokemon({required this.firstLoadDetail});
}
