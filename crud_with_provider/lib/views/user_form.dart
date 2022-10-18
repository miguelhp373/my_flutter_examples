// ignore_for_file: unnecessary_null_comparison

import 'package:crud_with_provider/models/user.dart';
import 'package:crud_with_provider/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formSubmit = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadDataOfForm(User user) {
    if (user != null) {
      _formData['id'] = user.id!;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['avatarUrl'] = user.avatarUrl;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final user = ModalRoute.of(context)?.settings.arguments as User;

    _loadDataOfForm(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: _formSubmit,
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                TextFormField(
                  initialValue: _formData['name'],
                  decoration: const InputDecoration(label: Text('Nome')),
                  onSaved: (value) => _formData['name'] = value!,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Preencha o Nome!';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: _formData['email'],
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(label: Text('Email')),
                  onSaved: (value) => _formData['email'] = value!,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Preencha o Email!';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: _formData['avatarUrl'],
                  keyboardType: TextInputType.url,
                  decoration: const InputDecoration(label: Text('Avatar Url')),
                  onSaved: (value) => _formData['avatarUrl'] = value!,
                ),
                const SizedBox(height: 40),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.save),
                        SizedBox(width: 5),
                        Text('Salvar'),
                      ],
                    ),
                    onPressed: () {
                      final isFormValid = _formSubmit.currentState!.validate();
                      if (isFormValid) {
                        _formSubmit.currentState?.save();
                        Provider.of<Users>(context, listen: false).put(User(
                          id: _formData['id']!,
                          name: _formData['name']!,
                          email: _formData['email']!,
                          avatarUrl: _formData['avatarUrl']!,
                        ));
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
