import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/home_page.dart';
import 'core/providers/motel_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MotelProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Guia de Motéis',
      theme: ThemeData(primarySwatch: Colors.red),
      home: HomePage(),
    );
  }
}
