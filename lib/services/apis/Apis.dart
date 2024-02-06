class APIs {
  static const String baseUrl = "https://foodiesapp.onrender.com/";

  static const String placeApi = "AIzaSyBnf5OBc0yJCdSElge0Iv5EEntlZJCwfN0";

  static var authEndPoints = _AuthEndPoints();
}

class _AuthEndPoints {
  // final String register = "user/register";
  final String login = "user/applogin";
  final String userUpdate = "user/editUser";
  final String getProfileData = "user/getSingleUser";
  final String verifyOtp = "user/verifyLogin";
  final String getCategory = "category/allproducts";
  final String getOfferList = "offer/allproducts";
  final String forgotPass = "user/forgot";
  final String forgotVerify = "user/verifyForgot";
}
