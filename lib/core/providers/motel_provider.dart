import 'package:flutter/material.dart';
import '../models/motel.dart';
import '../services/motel_services.dart';


class MotelProvider extends ChangeNotifier {
  MotelService _service = MotelService();
  List<Motel> _moteis = [];
  bool _isLoading = false;


  set service(MotelService service) {
    _service = service;
  }

  List<Motel> get moteis => _moteis;
  bool get isLoading => _isLoading;

  Future<void> loadMotel() async {
    _isLoading = true;
    notifyListeners();

    try {
      _moteis = await _service.fetchMoteis();
      print('Motéis carregados: ${_moteis.length}');
    } catch (e) {
      print('Erro ao carregar motéis: $e');
      _moteis = [];
    }

    _isLoading = false;
    notifyListeners();
  }
}

