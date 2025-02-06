import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/motel.dart';
class MotelService {
  final String apiUrl = "https://www.jsonkeeper.com/b/1IXK"; // Nova URL

  Future<List<Motel>> fetchMoteis() async {
    final response = await http.get(Uri.parse(apiUrl));
    print('Resposta da API: ${response.body}');

    if (response.statusCode == 200) {
      // Decodifica o JSON e acessa a chave 'data' para pegar a lista de motéis
      final data = json.decode(response.body);
      final moteisData = data['data']['moteis'] as List;

      // Mapeia os dados de moteis para os objetos Motel
      return moteisData.map((json) => Motel.fromJson(json)).toList();
    } else {
      print('Erro ao carregar motéis: ${response.body}');
      throw Exception('Falha ao carregar os motéis');
    }
  }
}
