import 'package:flutter/material.dart';

class KasbonProvider extends ChangeNotifier {
  String name = ' ';
  String harga = ' ';
 

  void setKasbon(String names, String price, ) {
    name = names;
    harga = price;
 
    notifyListeners();
  }

  void updateUserKasbon(String names ,String newharga, ) {
    harga = newharga;
    name = names;
 
    notifyListeners();
  }
 
  Future<void> updateKasbon(String names, String price,  ) async {
        this.harga = price;
        this.name = names;
    
      notifyListeners();
  }

}
