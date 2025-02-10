import 'dart:convert';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:guia_moteis/core/models/motel.dart';
import 'package:guia_moteis/core/services/motel_services.dart';
import 'package:mockito/mockito.dart';
import 'motel_services_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MotelService sut;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    sut = MotelService(client: mockClient);
  });

  test('Deve carregar os motéis corretamente quando o client responder status code 200', () async {
    // Given
    final jsonString = {
      "data": {
        "moteis": [
          {
            "fantasia": "Motel Paraíso",
            "logo": "https://example.com/logo.png",
            "bairro": "Centro",
            "distancia": 2.5,
            "qtdFavoritos": 124,
            "suites": [
              {
                "nome": "Suite Luxo",
                "preco": 299.99,
                "qtd": 3,
                "fotos": [
                  "https://example.com/suite1_foto1.jpg",
                  "https://example.com/suite1_foto2.jpg"
                ],
                "categoriaItens": [
                  {
                    "icone": "https://example.com/icons/wi-fi.png"
                  },
                  {
                    "icone": "https://example.com/icons/ar-condicionado.png"
                  }
                ],
                "periodos": [
                  {
                    "tempoFormatado": "2 horas",
                    "valorTotal": 199.99
                  },
                  {
                    "tempoFormatado": "4 horas",
                    "valorTotal": 349.99
                  }
                ]
              },
              {
                "nome": "Suite Executiva",
                "preco": 159.99,
                "qtd": 5,
                "fotos": [
                  "https://example.com/suite2_foto1.jpg",
                  "https://example.com/suite2_foto2.jpg"
                ],
                "categoriaItens": [
                  {
                    "icone": "https://example.com/icons/wi-fi.png"
                  },
                  {
                    "icone": "https://example.com/icons/tv.png"
                  }
                ],
                "periodos": [
                  {
                    "tempoFormatado": "1 hora",
                    "valorTotal": 99.99
                  },
                  {
                    "tempoFormatado": "3 horas",
                    "valorTotal": 269.99
                  }
                ]
              }
            ],
            "media": 4.5,
            "qtdAvaliacoes": 68
          }
        ]
      }
    };

    final response = utf8.encode(json.encode(jsonString));
    when(mockClient.get(Uri.parse("https://www.jsonkeeper.com/b/1IXK")))
        .thenAnswer((_) async => http.Response.bytes(response, 200));

    // When
    final result = await sut.fetchMoteis();

    // Then
    final firstMotel = result[0];
    expect(result, isA<List<Motel>>());
    expect(result.length, 1);
    expect(firstMotel.suites.length, 2);
  });
}
