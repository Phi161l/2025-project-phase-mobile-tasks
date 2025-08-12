class ApiConstants {
  // Base URL of the API
  static const String baseUrl = 'https://65f85c2cdf151452460f6d1b.mockapi.io/api/v1';

  // Products endpoints
  static const String products = '$baseUrl/products';

  static String productById(String id) => '$products/$id';
}
