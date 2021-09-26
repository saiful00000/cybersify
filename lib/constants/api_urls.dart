class ApiUrls {
  static final baseUrl = 'http://re.hellohasib.com';

  //------------------------------------URLS----------------------------------//
  static String loginUrl(String email, String password) =>
      '$baseUrl/api/login?email=$email&password=$password';
}
