
import 'enviorment.dart';



class Url {
  static final Url _singleton = Url._internal();

  factory Url() => _singleton;

  Url._internal();

  // /// Live Server URL
  // String baseUrl = 'http://192.168.5.251/safety-point/api/';
  // String socketUrl = 'ws://192.168.5.251:8071/safetypoint';
  // String imageUrl = 'http://192.168.5.251/safety-point/public/';

  // Development Server
  String baseUrl =   Environment().config.baseUrl;
  String socketUrl = Environment().config.socketUrl;
  String imageUrl =  Environment().config.imageUrl;
}
