import 'package:flutter/material.dart';
import '../../core/models/motel.dart';

class MotelCard extends StatefulWidget {
  final Motel motel;

  const MotelCard({Key? key, required this.motel}) : super(key: key);

  @override
  _MotelCardState createState() => _MotelCardState();
}

class _MotelCardState extends State<MotelCard> {
  int _selectedSuiteIndex = 0;
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final motel = widget.motel;

    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          color: Colors.transparent,
          child: Text(
            'Motéis Disponiveis',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),

        // Card do Motel
        Card(
          margin: EdgeInsets.all(12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔹 Cabeçalho do motel
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(motel.logo),
                      radius: 24,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            motel.fantasia,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            motel.bairro,
                            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.amber, width: 1.5),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.amber, size: 18),
                                    SizedBox(width: 4),
                                    Text(
                                      motel.media.toStringAsFixed(1),
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "Avaliações: ${motel.qtdAvaliacoes}",
                                style: TextStyle(fontSize: 12, color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        _isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: _isFavorite ? Colors.redAccent : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isFavorite = !_isFavorite; // Alterna o estado de favorito
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 12),

                // 🔹 Suítes com PageView
                SizedBox(
                  height: 250,
                  child: PageView.builder(
                    itemCount: motel.suites.length,
                    controller: PageController(viewportFraction: 0.85),
                    onPageChanged: (index) {
                      setState(() {
                        _selectedSuiteIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      final suite = motel.suites[index];

                      return Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                suite.fotos[0],
                                height: 180,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              suite.nome,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                // 🔹 Ícones da categoria
                if (motel.suites.isNotEmpty) ...[
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: motel.suites[_selectedSuiteIndex]
                          .itensCategoria
                          .where((item) => item.iconeUrl.isNotEmpty)
                          .map((item) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          child: Image.network(
                            item.iconeUrl,
                            height: 40,
                            width: 40,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 12),
                ],
                SizedBox(height: 12),

                // 🔹 Tempo de permanência e preços
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tempo de permanência",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: motel.suites[_selectedSuiteIndex]
                          .periodos
                          .map((periodo) {
                        return _buildTimeOption(
                            periodo.tempoFormatado, periodo.valorTotal);
                      }).toList(),
                    ),
                  ],
                ),
                SizedBox(height: 12),

                // 🔹 Status de disponibilidade
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          color: motel.suites[_selectedSuiteIndex].qtd > 0
                              ? Colors.green[100]
                              : Colors.red[100],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            motel.suites[_selectedSuiteIndex].qtd > 0
                                ? "Suítes disponíveis: ${motel.suites[_selectedSuiteIndex].qtd}"
                                : "Indisponível no app",
                            style: TextStyle(
                              color: motel.suites[_selectedSuiteIndex].qtd > 0
                                  ? Colors.green
                                  : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton.icon(
                      onPressed: () {
                        if (motel.suites[_selectedSuiteIndex].qtd > 0) {
                          // Lógica de reserva aqui
                        } else {
                          // Ação para notificar sobre disponibilidade
                        }
                      },
                      icon: Icon(Icons.notifications, color: Colors.black),
                      label: Text(
                        motel.suites[_selectedSuiteIndex].qtd > 0
                            ? "Reservar"
                            : "Avise-me",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple[200],
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimeOption(String duration, double price) {
    return Column(
      children: [
        Text(
          duration,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(
          'R\$ ${price.toStringAsFixed(2)}',
          style: TextStyle(fontSize: 12, color: Colors.grey[700]),
        ),
      ],
    );
  }
}
