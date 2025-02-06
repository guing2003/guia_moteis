import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/providers/motel_provider.dart';
import 'widgets/motel_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Carregar os motéis assim que a tela for criada
    Provider.of<MotelProvider>(context, listen: false).carregarMoteis();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MotelProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Motéis Disponíveis')),
      body: provider.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: provider.moteis.length,
        itemBuilder: (context, index) {
          return MotelCard(motel: provider.moteis[index]);
        },
      ),
    );
  }
}
