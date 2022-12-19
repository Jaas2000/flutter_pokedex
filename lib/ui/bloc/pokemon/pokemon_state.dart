part of 'pokemon_bloc.dart';

class PokemonState extends Equatable {
  final bool isLoading;
  final bool firstLoad;
  final bool firstLoadDetail;
  final bool isError;
  final String errorMessage;
  final String nextPage;
  final List<Pokemon> pokemons;
  final DetailPokemon pokemon;
  final DetailSpecies species;

  PokemonState(
      {required this.isLoading,
      required this.firstLoad,
      required this.firstLoadDetail,
      required this.isError,
      required this.errorMessage,
      required this.pokemons,
      required this.pokemon,
      required this.species,
      required this.nextPage});

  PokemonState copyWith(
      {bool? isLoading,
      bool? firstLoad,
      bool? firstLoadDetail,
      bool? isError,
      String? errorMessage,
      String? nextPage,
      List<Pokemon>? pokemons,
      DetailPokemon? pokemon,
      DetailSpecies? species,
      }) {
    return PokemonState(
        isLoading: isLoading ?? this.isLoading,
        firstLoad: firstLoad ?? this.firstLoad,
        firstLoadDetail: firstLoadDetail ?? this.firstLoadDetail,
        isError: isError ?? this.isError,
        errorMessage: errorMessage ?? this.errorMessage,
        pokemons: pokemons ?? this.pokemons,
        pokemon: pokemon ?? this.pokemon,
        species: species ?? this.species,
        nextPage: nextPage ?? this.nextPage);
  }

  @override
  List<Object> get props => [
        isLoading,
        firstLoad,
        firstLoadDetail,
        isError,
        errorMessage,
        pokemons,
        pokemon,
        species,
        nextPage
      ];
}
