import 'package:flutter/material.dart';

import '../context/user_notifier.dart';
import '../models/user.dart';


class FirstNamePage extends StatelessWidget {
  const FirstNamePage({super.key});

  @override
  Widget build(BuildContext context) {

    // I get access to context in the build method, so that's where I'll derive my user!
    User user = UserNotifier.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('First Name Page'),
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
        // nothing changes here either!
        // the only change we're making is providing access to shared User state through context, rather than lifting & passing state down
        onPressed: () => user.firstName = 'Surname',
        child: const Icon(Icons.update),
      ),
    );
  }
}
