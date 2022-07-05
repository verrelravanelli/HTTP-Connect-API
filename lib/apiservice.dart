import 'dart:convert';

import 'package:flutter_application_1/userprofile.dart';
import 'package:http/http.dart' as http;

class Service {
  Future<List<UserProfile>> getAllData() async {
    final response = await http.get(
      Uri.parse(
        'https://62c29218876c4700f527af65.mockapi.io/api/v1/test/testAPI',
      ),
    );
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => UserProfile.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load Data');
    }
  }

  Future postData(
      // String firstname,
      // String lastname,
      // int loyaltypoints,
      // int fitnessgoal,
      // bool isActive,
      UserProfile user) async {
    final response = await http.post(
      Uri.parse(
        'https://62c29218876c4700f527af65.mockapi.io/api/v1/test/testAPI',
      ),
      headers: {
        "Content-Type": "application/json; charset=utf-8",
      },
      // body: jsonEncode(
      //   {
      //     "firstName": firstname,
      //     "lastName": lastname,
      //     "loyaltyPoints": loyaltypoints,
      //     "fitnessGoal": fitnessgoal,
      //     "isActive": isActive,
      //   },
      // ),
      body: user.toJson(),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Failed to push Data');
    }
  }

  Future<bool> deleteData(String id) async {
    final response = await http.delete(
      Uri.parse(
          'https://62c29218876c4700f527af65.mockapi.io/api/v1/test/testAPI/$id'),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to delete data!');
    }
  }
}
