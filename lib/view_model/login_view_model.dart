import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../respository/auth_repository.dart';
import '../routes/routes_name.dart';

class LoginViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> onLogin(
      BuildContext context, String email, String password) async {
    setLoading(true);

    _myRepo.login(email).then((value) {
      setLoading(false);
      Navigator.pushNamedAndRemoveUntil(
        context,
        RoutesName.home,
        (route) => false,
      );
    }).onError((error, stackTrace) {
      setLoading(false);
    });
  }
}
