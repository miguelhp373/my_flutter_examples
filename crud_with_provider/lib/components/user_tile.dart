import 'package:crud_with_provider/models/user.dart';
import 'package:crud_with_provider/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  const UserTile({Key? key, required this.user}) : super(key: key);

  final User user;
  @override
  Widget build(BuildContext context) {
    final avatarBoolean = user.avatarUrl.isEmpty
        ? const CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));

    return ListTile(
      onTap: () => Navigator.of(context).pushNamed(
        '/User_Form',
        arguments: user,
      ),
      leading: avatarBoolean,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: SizedBox(
        width: 50,
        child: Row(
          children: [
            IconButton(
              onPressed: () => {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Excluir usuário'),
                    content: Text('Deseja excluir o usuário: ${user.name} ?'),
                    actions: [
                      TextButton(
                        child: const Text('Não'),
                        onPressed: () => Navigator.of(context).pop(false),
                      ),
                      TextButton(
                        child: const Text('Sim'),
                        onPressed: () => Navigator.of(context).pop(true),
                      ),
                    ],
                  ),
                ).then(
                  (confirmed) {
                    if (confirmed) {
                      Provider.of<Users>(context, listen: false)
                          .userRemove(user);
                    }
                  },
                ),
              },
              color: Colors.red,
              icon: const Icon(Icons.delete),
            )
          ],
        ),
      ),
    );
  }
}
