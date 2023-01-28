import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:api_crud/models/users.dart';

const String baseUrl = 'https://63d0c62cd5f0fa7fbdbd73c7.mockapi.io/users';

class BaseClient {
  var client = http.Client();

  //GET
  Future<dynamic> get() async {
    var url = Uri.parse(baseUrl);
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var json = response.body;
      return userFromJson(json);
    } else {
      throw Exception('Failed to load data!');
    }
  }

  //POST
  Future<dynamic> post(dynamic object) async {
    var url = Uri.parse(baseUrl);
    var payLoad = json.encode(object);
    var headers = {
      'Content-Type': 'application/json',
    };
    var response = await client.post(url, body: payLoad, headers: headers);
    if (response.statusCode == 201) {
      var json = response.body;
      return userFromJson(json);
    } else {
      throw Exception('Failed to load data!');
    }
  }

  //PUT //UPDATE
  Future<dynamic> put(dynamic object, String id) async {
    var url = Uri.parse(baseUrl + id);
    var payLoad = json.encode(object);
    var headers = {
      'Content-Type': 'application/json',
    };
    var response = await client.put(url, body: payLoad, headers: headers);
    if (response.statusCode == 200) {
      var json = response.body;
      return userFromJson(json);
    } else {
      throw Exception('Failed to load data!');
    }
  }

  //DELETE
  Future<dynamic> delete(id) async {
    var url = Uri.parse(baseUrl + id);
    // var payLoad = json.encode(object);
    var response = await client.delete(url);
    if (response.statusCode == 200) {
      var json = response.body;
      return userFromJson(json);
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
