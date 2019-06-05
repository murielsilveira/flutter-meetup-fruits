import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

//main() async {
//  await fetchFruits();
//}

Future<List<Fruit>> fetchFruits() async {
  var url = 'https://saturno-phoenix.herokuapp.com/graphql';
  var body = {
    'query': 'query { foods { id name imageUrl } }'
  };
  var response = await http.post(url, body: body);

  var fruits = parseFruits(response.body);
  print(fruits);
  return fruits;
}

List<Fruit> parseFruits(String body) {
  Map<String, dynamic> bodyParsed = json.decode(body);
  List<dynamic> foods = bodyParsed['data']['foods'];
  return foods.map((fruit) {
    return Fruit(
      id: fruit['id'],
      name: fruit['name'],
      imageUrl: fruit['imageUrl'],
    );
  }).toList();
}

class Fruit {
  String id, name, imageUrl;

  Fruit({
    this.id,
    this.name,
    this.imageUrl,
  });

  String toString() {
    return 'Fruit("$name")';
  }
}
