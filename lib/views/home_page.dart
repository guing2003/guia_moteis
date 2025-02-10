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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MotelProvider>(context, listen: false).loadMotel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guia de Motéis'),
        backgroundColor: Colors.red[500],
      ),
      body: Consumer<MotelProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (provider.moteis.isEmpty) {
            return Center(child: Text('Nenhum motel encontrado.'));
          }

          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 12),
            itemCount: provider.moteis.length,
            itemBuilder: (context, index) {
              return MotelCard(motel: provider.moteis[index]);
            },
          );
        },
      ),
    );
  }
}
