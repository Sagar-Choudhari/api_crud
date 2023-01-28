import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:api_crud/services/remote.dart';
import 'package:api_crud/models/users.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {

  Future<User>? user;

  @override
  void initState() {
    super.initState();
    user = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("home"),
      ),
      body: Center(
        child: FutureBuilder<User>(
          future: user,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.firstname);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, it show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

Future<User> fetchPost() async {
  final response = await http.get(Uri.parse(baseUrl));

  if (response.statusCode == 200) {
    // If the server returns an OK response, then parse the JSON.
    return User.fromJson(json.decode(response.body));
  } else {
    // If the response was unexpected, throw an error.
    throw Exception('Failed to load post');
  }
}
