import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/ui/bloc/pokemon/pokemon_bloc.dart';
import 'package:pokedex/ui/pages/home_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pokedex/ui/pages/pokemon_detail_page.dart';

void main() async {
  await loadEnvVars();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PokemonBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: 'home',
        routes: {
          'home': (context) => const HomePage(),
          'pokemon_detail': (context) => const PokemonDetailPage(),
        },
        home: const HomePage()
      ),
    );
  }
}

Future loadEnvVars() async {
  await dotenv.load(
    fileName: '.env',
  );
}
