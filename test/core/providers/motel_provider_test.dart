import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis/core/providers/motel_provider.dart';
import 'package:guia_moteis/core/services/motel_services.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'motel_provider_test.mocks.dart';

// Gerando o mock para http.Client
@GenerateMocks([http.Client])
void main() {
  late MotelProvider sut;
  late MotelService mockMotelService;
  late MockClient mockClient;

  setUp(() {
    // Criação do mock
    mockClient = MockClient();
    mockMotelService = MotelService(
        client: mockClient); // Passe o mock http.Client para o serviço
    sut = MotelProvider();
    sut.service = mockMotelService;
  });

  test('Deve carregar os motéis corretamente e atualizar o estado', () async {
    // Configurando o mock para retornar uma lista de motéis no formato correto
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

    // Chama o método que carrega os motéis
    await sut.loadMotel();

    // Imprime para verificar o que está sendo carregado
    print('Motéis carregados: ${sut.moteis.length}');

    // Verificando se o estado foi atualizado corretamente
    expect(sut.moteis.isNotEmpty, true);
    expect(sut.isLoading, false);
  });


  test('Deve lidar com erro ao carregar os motéis', () async {
    // Simulando um erro na requisição
    when(mockClient.get(Uri.parse('https://www.jsonkeeper.com/b/1IXK')))
        .thenThrow(Exception('Erro ao carregar'));

    // Chama o método que carrega os motéis
    await sut.loadMotel();

    // Verifica se o estado de loading foi desligado mesmo após erro
    expect(sut.isLoading, false);
    expect(sut.moteis.isEmpty, true);
  });
}
