
import '../constants/ExtraConstants.dart';

class GoogleDriveImageConvertService{

  static String editGoogleDriveImageLink(String originalLink){

    String fileId = originalLink.substring(originalLink.indexOf('/d/') + 3, originalLink.indexOf('/view'));
    String newLink = ExtraConstants.editedGoogleDriveBaseUrl+fileId;
    return newLink;
  }
}