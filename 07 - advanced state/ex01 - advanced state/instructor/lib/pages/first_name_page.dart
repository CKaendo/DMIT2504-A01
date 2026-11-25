import 'package:flutter/material.dart';

import '../models/user.dart';


class FirstNamePage extends StatelessWidget {
  const FirstNamePage({required this.user, super.key});

  final User user;

  @override
  Widget build(BuildContext context) {
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
            // use a ListenableBuilder to re-render on shared state change
            // (ListenableBuilder is the receiving end of ChangeNotifier().notifyListeners() )
            ListenableBuilder(
              listenable: user, // every ListenableBuilder needs a listenable param that is some class extended from ChangeNotifier
              builder: (BuildContext context, Widget? child) => 
                Text('User name: ${user.firstName}, ${user.lastName}'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Update our user firs name here
        onPressed: () {
          //noop;
        },
        child: const Icon(Icons.update),
      ),
    );
  }
}
