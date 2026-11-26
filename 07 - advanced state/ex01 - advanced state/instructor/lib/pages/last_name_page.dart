import 'package:flutter/material.dart';

import '../context/user_notifier.dart';
import '../models/user.dart';


class LastNamePage extends StatelessWidget {
  const LastNamePage({super.key});

  @override
  Widget build(BuildContext context) {

    User user = UserNotifier.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Last Name Page'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 24.0,
            ),
            ListenableBuilder(
              // what changes here? absolutely nothing.
              listenable: user,
              builder: (BuildContext context, Widget? child) => 
                Text('User name: ${user.firstName} ${user.lastName}'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => user.lastName = 'Test',
        child: const Icon(Icons.update),
      ),
    );
  }
}
