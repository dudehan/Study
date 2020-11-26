
import '../fluro/fluro.dart';



class Application {
  static Router router;
}

class WXNavigate {
  static Router of() {
    return Application.router;
  }
}