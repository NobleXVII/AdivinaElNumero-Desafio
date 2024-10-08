import 'dart:math';
import 'package:flutter/foundation.dart';

class GlobalState with ChangeNotifier, DiagnosticableTreeMixin {
  Random rand = Random();

  bool _status = false;
  int _dificultad = 0;
  int _intentos = 5;
  int _numeritoMagico = 0;
  List _menorQue = [];
  List _mayorQue = [];
  List<Map<String, dynamic>> _historial = [];

  GlobalState() {
    _numeritoMagico = rand.nextInt(10)+1;
  }

  bool get status => _status;
  int get dificultad => _dificultad;
  int get intentos => _intentos;
  int get numeritoMagico => _numeritoMagico;
  List get menorQue => _menorQue;
  List get mayorQue => _mayorQue;
  List get historial => _historial;

  void esFacil() {
    _dificultad = 0;
    _status = false;
    _intentos = 5;
    _menorQue = [];
    _mayorQue = [];
    _numeritoMagico = rand.nextInt(10)+1;
    notifyListeners();
  }

  void esMedio() {
    _dificultad = 1;
    _status = false;
    _intentos = 10;
    _menorQue = [];
    _mayorQue = [];
    _numeritoMagico = rand.nextInt(20)+1;
    notifyListeners();
  }

  void esDificil() {
    _dificultad = 2;
    _status = false;
    _intentos = 15;
    _menorQue = [];
    _mayorQue = [];
    _numeritoMagico = rand.nextInt(100)+1;
    notifyListeners();
  }

  void esExtremo() {
    _dificultad = 3;
    _status = false;
    _intentos = 25;
    _menorQue = [];
    _mayorQue = [];
    _numeritoMagico = rand.nextInt(1000)+1;
    notifyListeners();
  }

  void intento(int valor) {
    if (valor == _numeritoMagico) {
      _status = true;
      afterWinOrLose();
      _historial.add({'value': valor, 'win': true});
    } else {
      (valor > _numeritoMagico)
          ? _menorQue.add(valor)
          : _mayorQue.add(valor);
      _intentos--;
      if (_intentos == 0) {
        _historial.add({'value': _numeritoMagico, 'win': false});
        afterWinOrLose();
      }
    }
    notifyListeners();
  }

  void afterWinOrLose() {
    switch (_dificultad) {
      case 0:
        esFacil();
        break;
      case 1:
        esMedio();
        break;
      case 2:
        esDificil();
        break;
      case 3:
        esExtremo();
        break;
    }
  }

}