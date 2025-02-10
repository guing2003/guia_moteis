import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis/core/providers/motel_provider.dart';
import 'package:guia_moteis/core/services/motel_services.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'motel_provider_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MotelProvider sut;
  late MotelService mockMotelService;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    mockMotelService = MotelService(client: mockClient);
    sut = MotelProvider();
    sut.service = mockMotelService;
  });

  test('Deve carregar os motéis corretamente e atualizar o estado', () async {
    when(mockClient.get(Uri.parse('https://www.jsonkeeper.com/b/1IXK')))
        .thenAnswer(
      (_) async => http.Response(
        jsonEncode({
          'sucesso': 'true',
          'data': {
            'moteis': [
              {
                'fantasia': 'Motel Paraíso',
                'logo': 'https://example.com/logo.png',
                'bairro': 'Centro',
                'distancia': 2.5,
                'qtdFavoritos': 124,
                'suites': [],
              },
            ],
          },
        }),
        200,
      ),
    );

    await sut.loadMotel();

    print('Motéis carregados: ${sut.moteis.length}');

    expect(sut.moteis.isNotEmpty, true);
    expect(sut.isLoading, false);
  });

  test('Deve lidar com erro ao carregar os motéis', () async {
    when(mockClient.get(Uri.parse('https://www.jsonkeeper.com/b/1IXK')))
        .thenThrow(Exception('Erro ao carregar'));

    await sut.loadMotel();

    expect(sut.isLoading, false);
    expect(sut.moteis.isEmpty, true);
  });
}
