// ignore_for_file: unnecessary_null_comparison

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:crud_with_provider/data/dummy_users.dart';
import 'package:crud_with_provider/models/user.dart';

class Users with ChangeNotifier {
  final Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int index) {
    return _items.values.elementAt(index);
  }

  void put(User user) {
    if (user == null) {
      return;
    }

    String? userId = user.id;

    if (_items.containsKey(user.id) && user.id != null) {
      //update user data
      _items.update(
        userId!,
        (_) => User(
          name: user.name,
          email: user.email,
          avatarUrl: user.avatarUrl,
        ),
      );
    } else {
      //insert new user
      final idGenerator = Random().nextDouble().toString();
      _items.putIfAbsent(
        idGenerator,
        () => User(
          id: idGenerator,
          name: user.name,
          email: user.email,
          avatarUrl: user.avatarUrl,
        ),
      );
    }

    notifyListeners();
  }

  void userRemove(User user) {
    if (user != null && user.id != null) {
      _items.remove(user.id);
      notifyListeners();
    }
  }
}
