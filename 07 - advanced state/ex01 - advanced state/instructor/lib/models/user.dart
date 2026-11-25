import 'package:flutter/material.dart';

// make User class extend ChangeNotifier, giving us access to notifyListeners()
class User extends ChangeNotifier {
  User(String firstName, String lastName) {
    this.firstName = firstName;
    this.lastName = lastName;
  }

  String? _firstName;
  String? _lastName;

  String? get firstName => _firstName;
  String? get lastName => _lastName;

  // currently, these private-public field pairs (and getters/setters for them) basically do nothing
  // the entire point of using private fields with setters - just like rendering automation for state -
  // is being able to fire additional behaviour whenever we change data (because we're in a function, not
  // just overwriting the value of an attribute directly)
  set firstName(newFirstName) {
    _firstName = newFirstName;
    // addt'l behaviour we want to fire in here (every time name changes) is blasting a notification about the value changing
    notifyListeners();
    // "every time something tries to write User().firstName, change the value and yell about that happening to whoever is listening on the other end"
  }

  set lastName(newLastName) {
    _lastName = newLastName;
    notifyListeners();
  }
}
