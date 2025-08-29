abstract class BaseConfig {
  String get imageUrl;
  String get baseUrl;
  String get socketUrl;

}

class DevConfig implements BaseConfig {
  @override
  String get baseUrl => 'http://18.222.137.176:8071/api/';
 
  @override
  String get socketUrl => 'ws://18.222.137.176:8071/safetypoint';

  @override
  String get imageUrl => 'http://18.222.137.176:8071/safety-point/public/';

}

class ProductionConfig implements BaseConfig {

  @override
  // String get baseUrl => 'http://18.117.236.0:8071/api/';
  String get baseUrl => 'https://safety-point.gologonow.tech/api/';

  @override
  // String get socketUrl => 'ws://18.117.236.0:8071/safetypoint';
  String get socketUrl => 'ws://safety-point.gologonow.tech:8071/safetypoint';

  @override
  // String get imageUrl => 'http://18.117.236.0/safety-point/public/';
  String get imageUrl => 'http://gologonow.tech/safety-point/public/';

// String get mapKey => "AIzaSyDLtchj3AddQGK3mlMgqA6HKbLQlEkEa38";
}
//flutter run --dart-define=ENVIRONMENT=dev

class Environment {
  factory Environment() {
    return _singleton;
  }

  Environment._internal();

  static final Environment _singleton = Environment._internal();
  static const String dev = 'dev';
  static const String production = 'production';
  late BaseConfig config;

  initConfig(String environment) {
    config = _getConfig(environment);
  }

  BaseConfig _getConfig(String environment) {
    switch (environment) {
      case Environment.production:
        return ProductionConfig();
      default:
        return DevConfig();
    }
  }
}