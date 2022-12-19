import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pokedex/data/services/pokemon_service.dart';
import 'package:pokedex/domain/entities/detail_pokemon_entity.dart';
import 'package:pokedex/domain/entities/detail_species_entity.dart';
import 'package:pokedex/domain/entities/pokemon_entity.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc()
      : super(PokemonState(
            isLoading: false,
            firstLoad: true,
            firstLoadDetail: true,
            isError: false,
            errorMessage: "",
            nextPage: "",
            pokemon: DetailPokemon.fromJson({}),
            pokemons: const [],
            species: DetailSpecies.fromJson({}),
            )) {
    on<GetListPokemon>((event, emit) async {
      final response = await PokemonService().list(dotenv.get('MAIN_URL'));
      Result result = Result.fromJson(response);
      emit(state.copyWith(
          pokemons: result.results, nextPage: result.next, firstLoad: false));
    });

    on<GetPokemonPage>((event, emit) async {
      final response = await PokemonService().list(event.url);
      Result result = Result.fromJson(response);
      List<Pokemon> tempPokemon = state.pokemons;
      tempPokemon.addAll(result.results!);
      emit(state.copyWith(pokemons: tempPokemon, nextPage: result.next));
    });

    on<GetPokemonInfo>((event, emit) async {
      final response = await PokemonService()
          .list('${dotenv.get('MAIN_URL')}${event.pokemonId}');
      DetailPokemon result = DetailPokemon.fromJson(response);

      final responseSpecies = await PokemonService()
          .list('${dotenv.get('ABOUT_URL')}${event.pokemonId}');
      DetailSpecies resultSpecies = DetailSpecies.fromJson(responseSpecies);
      
      emit(state.copyWith(pokemon: result, species: resultSpecies, firstLoadDetail: false));
    });

    on<FirstLoadDetailPokemon>((event, emit) =>
        emit(state.copyWith(firstLoadDetail: event.firstLoadDetail)));
  }
}
