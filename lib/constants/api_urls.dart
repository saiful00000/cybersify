class ApiUrls {
  static final baseUrl = 'http://re.hellohasib.com';

  //------------------------------------URLS----------------------------------//
  static String loginUrl(String email, String password) =>
      '$baseUrl/api/login?email=$email&password=$password';

  static String registerUrl(String fullName, String phoneNum,String email,String pass,String idCard) =>
      '$baseUrl/api/register?name=$fullName&email=$email&password=$pass&c_password=$pass&phone=$phoneNum';

  static String profileUrl = '$baseUrl/api/profile';


  static String vendorListUrl = '$baseUrl/api/vendor-list';
  static String activityListUrl = '$baseUrl/api/activity';
  static String getProfileUrl = '$baseUrl/api/profile';

}
