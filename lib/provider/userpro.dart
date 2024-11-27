import 'package:flutter/foundation.dart';

import '../model/user_info.dart';

class UserProvider with ChangeNotifier {
  UserInfo _userInfo = UserInfo(email: '', password: '', username: '');

  UserInfo get userInfo => _userInfo;

  void setUserInfo(UserInfo info) {
    _userInfo = info;
    notifyListeners();
  }
}
