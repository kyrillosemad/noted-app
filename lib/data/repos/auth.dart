import 'package:todo/data/services/auth/login_fun.dart';
import 'package:todo/data/services/auth/signup_fun.dart';

class AuthRepo {
  login(email, password) {
    return login_fun(email, password);
  }

  signup(username, email, password) {
    return signup_fun(username, email, password);
  }
}
