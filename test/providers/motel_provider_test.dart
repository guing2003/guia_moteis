import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis/core/models/motel.dart';
import 'package:guia_moteis/core/providers/motel_provider.dart';
import 'package:guia_moteis/core/services/motel_services.dart';
import 'package:mockito/mockito.dart';


class MockMotelService extends Mock implements MotelService {}

void main() {
  late MotelProvider motelProvider;
  late MockMotelService mockMotelService;

  setUp(() {
    mockMotelService = MockMotelService();
    motelProvider = MotelProvider();
    motelProvider.service = mockMotelService;
  });

  test('Deve carregar os motéis corretamente e atualizar o estado', () async {
    // Configurando o mock para retornar uma lista de motéis
    when(mockMotelService.fetchMoteis()).thenAnswer(
          (_) async => [
        Motel(
          fantasia: 'Fantasia',
          logo: 'logo',
          bairro: 'bairro',
          distancia: 1.0,
          qtdFavoritos: 5,
          suites: [],
          media: 4.5,
          qtdAvaliacoes: 10,
        ),
      ],
    );

    // Chama o método que carrega os motéis
    await motelProvider.carregarMoteis();

    // Verificando se o estado foi atualizado corretamente
    expect(motelProvider.moteis.isNotEmpty, true);
    expect(motelProvider.isLoading, false);
  });

  test('Deve lidar com erro ao carregar os motéis', () async {
    // Simulando um erro na requisição
    when(mockMotelService.fetchMoteis()).thenThrow(Exception('Erro ao carregar'));

    // Chama o método que carrega os motéis
    await motelProvider.carregarMoteis();

    // Verifica se o estado de loading foi desligado mesmo após erro
    expect(motelProvider.isLoading, false);
    expect(motelProvider.moteis.isEmpty, true);
  });
}
