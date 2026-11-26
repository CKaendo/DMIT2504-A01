// We're still going to keep that event-driven re-rendering based on state change,
// *but* create a shared state provider (React: "context (provider)") that components can access
// data from at will.
//
// The ChangeNotifier().notifyListeners() approach solves a) separation of concerns (state mgmt vs. rendering UI),
// and b) event-driven (automated) re-rendering instead of manually having to declare setState in stateful widgets.
// It *doesn't* solve that I still need to lift state to a common ancestor in the element tree and pass it down,
// which would become horrible if e.g. I need to pass it down through 8 layers that won't be using that input param at all.

import 'package:flutter/material.dart'; // InheritedNotifer (context + event-driven state change notification) is technically a widget

import '../models/user.dart';

class UserNotifier {

  const UserNotifier({
    required User user,    // our User datamodel, which also fires notifiers
    required Widget child, // widget/component that should be nested inside this context
  });

  // this will start to look super goofy because we're back to C# levels of 'method bureaucracy'
  // we'll write something that starts to behave like Flutter context you're already familiar with
  // e.g. Theme.of(context) -> goes upwards in the element tree until it finds the theme
  static UserNotifier? maybeOf(BuildContext context) {
    // try to return a UserNotifier instance from context
  }

  static User of(BuildContext context) {
    // 1. try to find an existing UserNotifier instance to work with
    // 2. throw an error if we don't find one
    // 3. if we do, return the notifier
  }

}

/*

  `InheritedNotifier` gives us shared state available via the widget tree's `context`.
  Any widget living below it in the tree can just call UserNotifier.of(context) to get the User. boom done

  This is the same pattern we've seen in how routing works - `Navigator.of(context)` - and theme - `Theme.of(context)`.
  Now we get to write our own stuff that works like this, accessing context.

  In production code, I would probably only have the .of() method, so I 100% throw an error 
  if there's no UserNotifier I can find above me but my intent is that UserNotifier *must* exist.

*/