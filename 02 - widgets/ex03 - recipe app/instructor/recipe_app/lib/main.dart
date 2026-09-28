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

/* I notice that the Ingredients and Instructions sections' structure are identical,
   which means I can create a reusable component.
*/
class ListWithHeading extends StatelessWidget {
  // What do I need in here? What input requirements, what goals to fulfill?

  // 1. I need a constructor, which takes in a String for heading + a List<String> for list items + super.key
  const ListWithHeading({
    super.key,
    required this.heading,
    required this.listItems,
  });
  
  // 2. I need class attributes for heading + contents to store the inputs
  final String       heading;
  final List<String> listItems;
  
  // 3. I need a build method to create the actual element tree, which I'm just going to yoink from the existing code.
  


}