class ApiConstants {
  //If we're running the server locally and using the Android emulator,
  // then our server endpoint should be 10.0.2.2:8000 instead of localhost:8000
  // as AVD uses 10.0.2.2 as an alias to our host loopback interface (i.e) localhost
  // static String baseUrl = 'http://10.0.2.2:8083';

  //AWS EC2 ip 16.171.149.77
  static String baseUrl = 'http://16.171.149.77:8083';

  static Map<String,String> contentTypeHeader ={"Content-type": 'application/json'};

  //device base endpoint
  static String deviceEndpoint = '/device';

  //user base endpoint
  static String userEndpoint = '/user';
}
