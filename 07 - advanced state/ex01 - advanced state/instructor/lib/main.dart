import 'package:flutter/material.dart';

import '../context/user_notifier.dart';
import '../models/user.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

// create the state notifier for the specific datamodel wherever the shared notifier wrapper is being called
User user = User('Jane', 'Doe');

// I want everything in my app to have access to this shared state, so I'm placing the notifier here.

// I can also only wrap specific sections of my element tree in context if I wanted; in a more complex app
// with more parts, I would wrap only the elements that *need* access to shared state in that notifier, rather than
// simply putting *all* shared-state notifiers at app-level.

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // we need to wrap MaterialApp because of the Navigator (router class).
    // it also uses its own shared state under the hood, but *is created in MaterialApp* when MaterialApp instantiates.
    // -> if we didn't, Navigator wouldn't pass down context that can be used by pushed pages to find the UserNotifier
    
    // In other words: Navigator is created by MaterialApp. When I push a route, the new page gets a context from the Navigator.
    // *If* I place UserNotifier *inside* MaterialApp, pages I push onto the route stack won't be able to see it
    // *because* their context is not capable of reaching above/outside the Navigator.
    
    // therefore, I use a Builder to create a new context that sits between UserNotifier and MaterialApp
    // to ensure that the lookup chaining works.
    return UserNotifier(
      user: user,
      child: Builder(
        builder: (BuildContext context) {
          return MaterialApp(
            home: Scaffold(body: Center(child: HomePage()))
          );
        }
      ),
    );
  }
}
