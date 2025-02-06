import 'package:flutter/material.dart';
import '../models/motel.dart';
import '../services/motel_services.dart';
class MotelProvider extends ChangeNotifier {
  final MotelService _service = MotelService();
  List<Motel> _moteis = [];
  bool _isLoading = false;

  List<Motel> get moteis => _moteis;
  bool get isLoading => _isLoading;

  Future<void> carregarMoteis() async {
    _isLoading = true;
    notifyListeners();

    try {
      _moteis = await _service.fetchMoteis();
    } catch (e) {
      _moteis = [];
    }

    _isLoading = false;
    notifyListeners();
  }
}

