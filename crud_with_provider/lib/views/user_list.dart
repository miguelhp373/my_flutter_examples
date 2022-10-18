import 'package:crud_with_provider/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crud_with_provider/components/user_tile.dart';
import 'package:crud_with_provider/provider/users.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Users user = Provider.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.of(context).pushNamed(
          '/User_Form',
          arguments: User(
            id: '',
            name: '',
            email: '',
            avatarUrl: '',
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Lista de Usuários'),
      ),
      body: ListView.builder(
        itemCount: user.count,
        itemBuilder: ((context, index) => UserTile(
              user: user.byIndex(index),
            )),
      ),
    );
  }
}
