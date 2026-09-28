import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    const mainHeadingStyle    = TextStyle(fontSize: 32, fontWeight: FontWeight.bold);
    const sectionHeadingStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade200,
        body: Column(
          spacing: 10.0,
          crossAxisAlignment: CrossAxisAlignment.stretch, // stretch basically givesd you flexbox logic
                                                          // .stretch alignment means children fill entire width
          children: [

            Padding(
              padding: EdgeInsets.all(16.0),
              child: const Text(
                "my cool recipe app",
                textAlign: TextAlign.center,
                style: mainHeadingStyle,
              ),
            ),

            Image.asset(
              'assets/images/cool.jpg',
              height: 400,
            ),

            Padding(
              padding: EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  Text(
                    'Ingredients',
                    textAlign: TextAlign.center,
                    style: sectionHeadingStyle,
                  ),

                  Text("- 500g eye of newt"),
                  Text("- 150g fang of bat"),
                  Text("- 1/4 cup salted butter"),
                  Text("- 5lbs whey protein isolate"),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  Text(
                    'Instructions',
                    textAlign: TextAlign.center,
                    style: sectionHeadingStyle,
                  ),

                  Text("1. click heels three times"),
                  Text("2. mix all ingredients"),
                  Text("3. dunk face in mixture"),
                  Text("4. serve (chilled)"),
                ],
              ),
            ),

          ],  
        ),
      ),
    );
  }
}
