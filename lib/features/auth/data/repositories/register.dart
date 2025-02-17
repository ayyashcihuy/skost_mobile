import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_apps/features/auth/api/register.dart';

abstract class RegisterRepository {
  Future<void> registerCustomer(Map<String, dynamic> body);
}

class RegisterRepo extends RegisterRepository {
  final String url = dotenv.get('DEV_BASE_URL');

  @override
  Future<void> registerCustomer(Map<String, dynamic> body) async {
    await RegisterClient().register(url);

    return;
  }
}