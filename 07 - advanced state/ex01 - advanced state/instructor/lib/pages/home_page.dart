import 'package:flutter/material.dart';

import '../models/user.dart';
import 'first_name_page.dart';
import 'last_name_page.dart';


class HomePage extends StatelessWidget {

  // when I create a new HomePage instance, I want to also give it user state
  // we'll use hardcoded initial values for that, just so we can see things propagating initially
  HomePage({super.key}) : user = User('Jane', 'Doe');

  // declare the field used in the constructor
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 24.0,
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                // pass the user to each page
                // (this feels similar to shared state, but what's different is the notification/updating mechanism)
                MaterialPageRoute(
                  builder: (context) => FirstNamePage(user: user),
                ),
              ),
              child: const Text('First Name Page'),
            ),
            const SizedBox(
              height: 24.0,
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => LastNamePage(user: user),
                ),
              ),
              child: const Text('Last Name Page'),
            ),
          ],
        ),
      ),
    );
  }
}
