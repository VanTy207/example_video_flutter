import 'package:flutter/material.dart';
class ThemeProvider extends ChangeNotifier {
  bool turnLight = false;


  void doSomething(bool entry) {
    turnLight = entry;
    notifyListeners();
  }

  void loading(){

  }

  // void changeTru(bool entry) {
  //   turnLight = entry;
  //   notifyListeners();
  // }
}

class SomeOtherClass extends ChangeNotifier{
  bool turnLight = false;

  void doSomething(bool entry) {
    turnLight = entry;
    notifyListeners();
  }
}