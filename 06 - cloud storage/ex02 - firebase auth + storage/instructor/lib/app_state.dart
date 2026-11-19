import 'package:flutter/material.dart';

class ApplicationState extends ChangeNotifier {

  // ChangeNotifier is a flutter built-in that allows us to automate subscribing to 'events' (ish)
  // and firing notifications to all relevant widgets, controllers, actors, etc. about a change.

  // It's a really similar patter nto JS event listeners, push notifications on your phone, etc.
  // imagine, Instagram for example: following someone new means 'subscribing' to their post events;
  // when they post a new post/story, 'news' of that happening gets pushed to every 'subscriber' (that's how you
  // get push notifications, how stuff shows up on your feed, etc.)

  // the thing that blasts out events doesn't have to know about which entities are listening for that event.
  // if you want to learn more about pub-sub: https://medium.com/@me4saurabh4u/publish-subscribe-pub-sub-model-in-depth-3481d973e6ba
  

  // ----
  // here we're going to write some logic so that we blast a notification that can be listened/subscribed to
  // whenever the user's auth state changes (i.e. they sign out, or sign in)

  notifyListeners(); // ChangeNotifier().notifyListeners() is what we want here; it blasts the relevant event out

}