class Config {
  static const String appName = "Grocery App";
  static const String apiUrl =
      "localhost:5000"; //ip address of the machine in which node js is api is hosted
  static const String imageURL =
      "$apiUrl/"; //put api url from above in this afte http://
  static const String categoryAPI = "api/category";
  static const String productAPI = "api/product";
  static const String registerAPI = "api/register";
  static const String loginAPI = "api/login";
  static const String sliderAPI = "api/slider";
  static const String cartAPI = "api/cart";
  static const int pageSize = 10;
  static const String currency = "";
}
