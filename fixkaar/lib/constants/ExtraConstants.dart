import 'package:shared_preferences/shared_preferences.dart';

class ExtraConstants {
  //for imoji   Alt+Ctrl+;

  //original google drive link....  https://drive.google.com/file/d/<FILE_ID>/view?usp=sharing
  // will not work so we need to convert it in following format
  //https://drive.google.com/uc?export=view&id=<FILE_ID>
  static String editedGoogleDriveBaseUrl =
      'https://drive.google.com/uc?export=view&id=';

  static String modelScreenAppBarTitle = 'Select Model';
  static String brandScreenAppbarTitle = 'Select Brand';

  static String chosenDeviceType1 = '';
  static String chosenDeviceType2 = '';
  static String brandName = '';
  static String modelName = '';

  //temporarily using this variables to store user info
  static String userEmail = '';
  static String userFirstName = '';
  static String userLastName = '';

}
