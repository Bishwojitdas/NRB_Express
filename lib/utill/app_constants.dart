

import 'package:nrb_express/data/model/language_model.dart';

import 'images.dart';

class AppConstants {

  //API list
  //String BASE_URL=Provider.of<AuthProvider>(, listen: false).getBASEURL();
  static const String BASE_URL='https://apirider.nrbxpress.com/api/v1';
  //static const String BASE_URL='http://192.168.1.12:8080/api';
  static const String login='/login';
  static const String logout='/logout';
  static const String dashboard='/dashboard/get';
  static const String change_password='/riders/change-password';
  static const String ridersDetails='/riders/details';
  static const String accounts='/orders/accounts';
  static const String handOver='/orders/accounts/hand-over-request';
  static const String ordersStatus='/orders/get-status';
  static const String ordersAssigned='/orders/assigned-orders';
  static const String ordersAccounts='/orders/accounts';
  static const String ordersDetails='/orders/details';

  // Admin Dashboard
  static const String accountSummery='/';

  // Shared Key
  static const String TOKEN = 'token';
  static const String USER_ID = 'user_id';
  static const String PHONE = 'phone';
  static const String THEME = 'theme';
  static const String COUNTRY_CODE = 'country_code';
  static const String LANGUAGE_CODE = 'language_code';
  static const String USER_PASSWORD = 'user_password';
  static const String USER_NUMBER = 'user_number';
  static const String IS_LOGIN = 'is_login';
  static const String IS_Merchant = 'is_merchant';


  static List<LanguageModel>? languages = [
    LanguageModel(imageUrl: Images.united_kindom, languageName: 'English', countryCode: 'US', languageCode: 'en'),
    LanguageModel(imageUrl: Images.bangladesh, languageName: 'Bangla', countryCode: 'BD', languageCode: 'bn'),
  ];

}
