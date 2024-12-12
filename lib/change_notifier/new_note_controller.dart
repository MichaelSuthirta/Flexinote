import 'package:flutter/material.dart';

class NewNoteController extends ChangeNotifier {
  // Tambahkan properti dan metode di sini
  bool _readOnly = false;

  bool get readOnly => _readOnly;

  set readOnly(bool value) {
    if (_readOnly != value) {
      _readOnly = value;
      notifyListeners(); // Memberitahukan perubahan
    }
  }
}