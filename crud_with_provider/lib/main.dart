import 'package:crud_with_provider/provider/users.dart';

import 'package:crud_with_provider/views/user_form.dart';
import 'package:crud_with_provider/views/user_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => Users())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: const UserList(),
        initialRoute: '/',
        routes: {
          '/': (context) => const UserList(),
          '/User_Form': (context) => UserForm(),
        },
      ),
    );
  }
}
