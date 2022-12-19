import 'dart:convert';
import 'package:http/http.dart' as http;

class PokemonService {
  Future list(String url) async {
    Uri fullUrl = Uri.parse(url);
    final response = await http.get(fullUrl);
    return jsonDecode(response.body);
  }
}
