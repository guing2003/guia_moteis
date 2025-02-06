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
          Image.network(motel.logo, height: 150, width: double.infinity, fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(motel.fantasia, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text('Endereço: ${motel.bairro}', style: TextStyle(fontSize: 16)),
                SizedBox(height: 4),
                Text('Distância: ${motel.distancia} km', style: TextStyle(fontSize: 16)),
                SizedBox(height: 10),
                Text('Suítes:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Column(
                  children: motel.suites.map((suite) {
                    return Column(
                      children: [
                        SizedBox(height: 10),
                        Text(suite.nome, style: TextStyle(fontSize: 16)),
                        SizedBox(height: 4),
                        Text('Preço: R\$ ${suite.preco.toStringAsFixed(2)}', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 4),
                        Image.network(suite.fotos.isNotEmpty ? suite.fotos[0] : '', height: 100),
                      ],
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
