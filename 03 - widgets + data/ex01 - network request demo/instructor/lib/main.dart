import 'dart:convert'; // for jsonDecode

import 'package:flutter/material.dart';
import 'package:http/http.dart'; // for HTTP requests e.g. get()

///TODO: create a stateful widget, override initState to fetch the initial
/// dog url. NOTE: will need to ensure a callback is used to be certain the
/// widget has been mounted before calling setState().

/* we're hitting the URL: 
      https://dog.ceo/api/breeds/image/random
   and getting back e.g.: 
     {
       "message": "https://images.dog.ceo/breeds/boxer/n02108089_1003.jpg",
       "status": "success"
     }
*/

// in flutter,
//  r - hot reload  - will not re-fire main() function
//  R - hot restart - (shift+r) *will* re-fire main() function


Future<void> main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Placeholder(),
        ),
      ),
    );
  }
}


class RandomDogImage extends StatefulWidget {
  // 'outer wrapper'. all widgets are more or less immutable, and will be redrawn

  const RandomDogImage({super.key});

  // so we pack all our stuff inside a mutable comparment
  @override
  State<RandomDogImage> createState() => _RandomDogImageState();
}


// instead of const [x, setX] = useState('default value') in React, we...
class _RandomDogImageState extends State<RandomDogImage> {
  // this is the mutable container
  // the .build() method exists here, *not* up one level in the StatefulWidget itself,
  // because rendering needs direct access to the stateful variables/data.

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


// class RandomDogImage extends StatelessWidget {

//   const RandomDogImage({super.key});

//   // static method, bc no inputs that change / nothing instance-dependent
//   static Future<String> getRandomDogUrl() async {
//     const dogEndpoint = 'https://dog.ceo/api/breeds/image/random';
//     var response      = await get(Uri.parse(dogEndpoint));

//     return jsonDecode(response.body)['message'];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Image.network(dogImageUrl);
//   }

// }
