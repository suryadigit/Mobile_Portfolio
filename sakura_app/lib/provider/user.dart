import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String name = ' ';
  String username = ' ';
  String email = ' ';

  void setUser(String names, String user_name,  String mail) {
    name = names;
    username = user_name;
    email = mail;
    notifyListeners();
  }

  void updateUserProfile(String names ,String newusername, String newEmail) {
    username = newusername;
    name = names;
    email = newEmail;
    notifyListeners();
  }
 
  Future<void> updateUser(String names, String user_name, String mail,  ) async {
        this.username = user_name;
        this.name = names;
        this.email = mail;
      notifyListeners();
  }

}
