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
                Text('User name: ${user.firstName} ${user.lastName}'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Update our user first name here - let's just update with a fixed value
        // to prove/observe that shared state changing
        // -> I should be able to click the button that changes the name on one screen,
        //    and see that change reflected when I navigate to the other screen that also shows User firstname/lastname.
        onPressed: () => user.firstName = 'Test',
        child: const Icon(Icons.update),
      ),
    );
  }
}
