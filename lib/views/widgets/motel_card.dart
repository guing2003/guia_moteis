import 'package:flutter/material.dart';
import '../../core/models/motel.dart';

class MotelCard extends StatelessWidget {
  final Motel motel;

  const MotelCard({Key? key, required this.motel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Exibe o logo do motel
          Image.network(
            motel.logo,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  motel.fantasia,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  'Bairro: ${motel.bairro}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 4),
                Text(
                  'Distância: ${motel.distancia.toStringAsFixed(2)} km',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  'Suítes:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                // Exibe as suítes com um PageView
                SizedBox(
                  height: 250,
                  child: PageView.builder(
                    itemCount: motel.suites.length,
                    controller: PageController(viewportFraction: 0.9),
                    itemBuilder: (context, index) {
                      final suite = motel.suites[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            suite.nome,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Preço: R\$ ${suite.preco.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 8),
                          // PageView para imagens das suítes
                          SizedBox(
                            height: 180,
                            child: PageView.builder(
                              itemCount: suite.fotos.length,
                              controller: PageController(viewportFraction: 0.8),
                              itemBuilder: (context, fotoIndex) {
                                return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  child: Image.network(
                                    suite.fotos[fotoIndex],
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
