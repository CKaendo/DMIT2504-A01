import 'package:flutter/material.dart';

// I no longer need specific imports to my models in each page.
// That is FANTASTIC. It's not a big deal for us, but imagine
// a production-grade app that would need to import 20 models on each page!
import 'first_name_page.dart';
import 'last_name_page.dart';


class HomePage extends StatelessWidget {

  // when I create a new HomePage instance, I want to also give it user state
  // we'll use hardcoded initial values for that, just so we can see things propagating initially
  const HomePage({super.key});

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
                MaterialPageRoute(
                  // I no longer need to push the user; FirstNamePage can reach into context at will
                  builder: (context) => const FirstNamePage(),
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
                  builder: (context) => const LastNamePage(),
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
