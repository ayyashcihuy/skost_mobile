import 'package:flutter/foundation.dart';

class RegistrationState with ChangeNotifier {
  String _email = '';
  String _otp = '';

  String get email => _email;
  String get otp => _otp;

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setOtp(String otp) {
    _otp = otp;
    notifyListeners();
  }
}