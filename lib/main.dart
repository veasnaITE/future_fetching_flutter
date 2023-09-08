import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:futerfech/user.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<String> getLatestNews() {
    return Future.delayed(
      const Duration(seconds: 4),
      () => 'latest News',
    );
  }

  Future<List<User>> getAllUsers() async {
    var response =
        await http.get(Uri.https('jsonplaceholder.typicode.com', 'users'));
    if (response.statusCode == 200) {
      var users = (jsonDecode(response.body) as List)
          .map((user) => User.fromJSON(user))
          .toList();
      return users;
    } else {
      throw Exception('Could not load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder(
          future: getAllUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var data = snapshot.data;
              return ListView.builder(
                  itemCount: data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        data[index].name!,
                        style: const TextStyle(color: Colors.blue),
                      ),
                      subtitle: Text(data[index].email!),
                    );
                  });
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
