import 'package:flutter/material.dart';

import 'api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Budapest Meetup')),
        body: FutureBuilder(
          future: fetchFruits(),
          builder: (context, AsyncSnapshot<List<Fruit>> snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: snapshot.data.map((fruit) {
                  return ListTile(
                    title: Text(fruit.name),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(fruit.imageUrl),
                    ),
                  );
                }).toList(),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
