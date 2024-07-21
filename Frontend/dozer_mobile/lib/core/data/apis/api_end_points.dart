class ApiEndPoints {
  static const String baseUrl =
      "https://dozer-backend-tech-gem.onrender.com/api/v1";
  static const String sendOtp = "/otp/sendOtp";
  static const String verifyOtp = "/otp/verifyOtp";
  static const String resendOtp = "/otp/resendOtp";
  static const String registerUser = "/userAuth/register-user";
  static const String login = "/userAuth/login-user";
  static const String resetPassword = "/register/reserPassword";
  static const String equipment = "/equipments";
  static const String profile = "/userProfile";
  static const String subscription = "/subscription";
  static const String subscriptionStatus = "subscription/isSubscribed";
  static const String confirmBooking = "/bookings/confirm-or-reject";
  static const String notification = "/notification";
}