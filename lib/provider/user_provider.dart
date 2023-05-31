import 'package:flutter/cupertino.dart';
import '../model/user_model.dart';
import '../services/api_service.dart';

class UserProvider extends ChangeNotifier{
  List<Users> _usersList = [];
  List<Users> get  usersList => _usersList;
  final _service = ApiService();
  bool loading = false;
  Future getAllUsers()async{
    loading = true;
    notifyListeners();
    _usersList = await _service.getApi();
    loading = false;
    notifyListeners();
  }
}