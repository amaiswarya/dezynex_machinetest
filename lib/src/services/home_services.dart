import 'dart:convert';

import 'package:dezynex_test/utils/app_toast.dart';

import '../models/user_model.dart';
import 'package:http/http.dart' as http;

class HomeService {
  Future<List<UserModel>> getAll(url) async {
    try {
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List;
        final userList = json.map((e) {
          return UserModel(
            userId: e['userId'],
            id: e['id'],
            title: e['title'],
            body: e['body'],
          );
        }).toList();
        return userList;
      } else {
        AppToast.showToast("Something went wrong");
      }
    } catch (e) {
      AppToast.showToast("Something went wrong");
    }

    return [];
  }
}
