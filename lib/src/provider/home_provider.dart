import 'package:dezynex_test/src/models/user_model.dart';
import 'package:dezynex_test/src/services/home_services.dart';
import 'package:flutter/material.dart';

import '../../constants/api_constants.dart';

class HomeProvider extends ChangeNotifier {
  final _service = HomeService();
  bool isLoading = false;
  List<UserModel> _list = [];
  List<UserModel> get list => _list;

  Future<void> getAllList() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getAll(ApiConstatnts.baseUrl);
    _list = response;
    isLoading = false;
    notifyListeners();
  }
}
