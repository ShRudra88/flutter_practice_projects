import 'dart:convert';
import 'user_model.dart';
import 'package:http/http.dart' as http;

class ApiService{
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com/users';


  static Future<List<User>> getUsers() async{
    final response = await http.get(Uri.parse(_baseUrl));

    if(response.statusCode == 200)
      {
        final List<dynamic> data = json.decode(response.body);
        return data.map((user) => User.fromJson(user)).toList();
      }else {
      throw Exception('Failed to load users');
    }
  }
}