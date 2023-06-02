
import 'package:exam03/http/custome_http_request.dart';
import 'package:exam03/model/model.dart';
import 'package:flutter/cupertino.dart';

class UIappProvider with ChangeNotifier {
  List<Uimodel> categoryList = [];

  getUiappData() async {
    categoryList = await CustomHttpRequest().fetchUIappData();
    notifyListeners();
  }
}
