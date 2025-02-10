import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/motel.dart';

class MotelService {
  final String apiUrl = "https://www.jsonkeeper.com/b/1IXK";

  final http.Client _client;

  MotelService({http.Client? client}) : _client = client ?? http.Client();

  Future<List<Motel>> fetchMoteis() async {
    final response = await _client.get(Uri.parse(apiUrl));
    print('Resposta da API: ${response.body}');

    if (response.statusCode == 200) {
      var utf8Response = utf8.decode(response.bodyBytes, allowMalformed: true);
      final data = json.decode(utf8Response);

      print('Dados decodificados: $data');  // Verifique os dados decodificados

      final moteisData = data['data']['moteis'] as List;

      return moteisData.map((json) => Motel.fromJson(json)).toList();
    } else {
      print('Erro ao carregar motéis: ${response.body}');
      throw Exception('Falha ao carregar os motéis');
    }
  }
}
