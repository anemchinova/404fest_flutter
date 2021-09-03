import 'package:flutter/material.dart';

class ProfileDescription extends StatelessWidget {
  const ProfileDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Имя Сотрудника'),
          SizedBox(height: 4),
          Text('Очень длинный текст про то, какой сотрудник молодец, как '
              'ему круто работается в Mercury Development и про то, '
              'что 404 - офигенный фест'),
        ],
      ),
    );
  }
}
