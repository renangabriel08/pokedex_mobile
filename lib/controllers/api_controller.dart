import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiController {
  static Future<List> pesquisarPokemon(String idRecebido) async {
    String id;
    String nome;
    String img;
    if (idRecebido != '') {
      try {
        final url = Uri.parse(
            'https://pokeapi.co/api/v2/pokemon/${idRecebido.toLowerCase()}');
        final req = await http.get(url);
        if (req.statusCode == 200) {
          final res = await jsonDecode(utf8.decode(req.bodyBytes));
          id = res['id'].toString();
          nome = res['name'];
          img = res['sprites']['front_default'];
        } else {
          id = '0';
          nome = 'Não encontrado';
          img =
              'https://mytopkid.com/wp-content/uploads/mytopkid.com-pokemon-cliparts-43-800x818.png';
        }
        return [img, id, nome];
      } catch (e) {
        id = '0';
        nome = 'Não encontrado';
        img =
            'https://mytopkid.com/wp-content/uploads/mytopkid.com-pokemon-cliparts-43-800x818.png';

        return [img, id, nome];
      }
    } else {
      id = '1';
      nome = 'Bulbasaur';
      img =
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png';

      return [img, id, nome];
    }
  }

  static Future<List> botoesPokemon(int idRecebido, String tipo) async {
    int novoId;

    if (tipo == 'proximo') {
      novoId = idRecebido + 1;
    } else {
      novoId = idRecebido - 1;
    }

    String id = novoId.toString();
    String nome;
    String img;
    if ((novoId > 0 && tipo != 'proximo') ||
        (novoId < 1011 && tipo == 'proximo')) {
      try {
        final url = Uri.parse('https://pokeapi.co/api/v2/pokemon/$id');
        final req = await http.get(url);
        if (req.statusCode == 200) {
          final res = await jsonDecode(utf8.decode(req.bodyBytes));
          id = res['id'].toString();
          nome = res['name'];
          img = res['sprites']['front_default'];
        } else {
          id = '0';
          nome = 'Não encontrado';
          img =
              'https://mytopkid.com/wp-content/uploads/mytopkid.com-pokemon-cliparts-43-800x818.png';
        }
        return [img, id, nome];
      } catch (e) {
        id = '0';
        nome = 'Não encontrado';
        img =
            'https://mytopkid.com/wp-content/uploads/mytopkid.com-pokemon-cliparts-43-800x818.png';

        return [img, id, nome];
      }
    } else {
      id = '1';
      nome = 'Bulbasaur';
      img =
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png';

      return [img, id, nome];
    }
  }
}
