import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:home_renting/app/app.locator.dart';
import 'package:home_renting/app/app.logger.dart';
import 'package:home_renting/core/models/property.dart';
import 'package:home_renting/core/services/api_service.dart';
import 'package:share_plus/share_plus.dart';

enum Shares {
  facebook,
  messenger,
  twitter,
  whatsapp,
  whatsappPersonal,
  whatsappBusiness,
  shareSystem,
  shareInstagram,
  shareTelegram,
  shareAll,
}

class SocialShareService {
  final log = getLogger("SocialShareService");
  String? response;
  final FlutterShareMe flutterShareMe = FlutterShareMe();
  final _api = locator<ApiService>();

  Future<void> tapShare({
    required Shares share,
    required Property property,
  }) async {
    final String message = """
          ${property.name}
          ${property.description}
          ${property.numberOfBedrooms},Bedrroms
          ${property.price}
          ${property.numberOfBathroom}, Bathrooms
          ${property.address}
         
""";
    final path = await _api.downloadImage(property);

    switch (share) {
      case Shares.facebook:
        response = await flutterShareMe.shareToFacebook(msg: message);
        break;
      case Shares.messenger:
        response = await flutterShareMe.shareToMessenger(msg: message);
        break;
      case Shares.twitter:
        response = await flutterShareMe.shareToTwitter(
          msg: message,
        );
        break;
      case Shares.whatsapp:
        response = await flutterShareMe.shareToWhatsApp(
            msg: message, imagePath: path!, fileType: FileType.image);
        break;
      case Shares.whatsappBusiness:
        response = await flutterShareMe.shareToWhatsApp4Biz(
            msg: message, imagePath: path!);
        break;
      case Shares.shareSystem:
        response = await flutterShareMe.shareToSystem(msg: message);
        break;
      case Shares.whatsappPersonal:
        response = await flutterShareMe.shareWhatsAppPersonalMessage(
            message: message, phoneNumber: '+234$property');
        break;
      case Shares.shareInstagram:
        response = await flutterShareMe.shareToInstagram(
            filePath: path!, fileType: FileType.image);
        break;
      case Shares.shareTelegram:
        response = await flutterShareMe.shareToTelegram(msg: message);
        break;
      case Shares.shareAll:
        await Share.shareXFiles([
          XFile(path!),
        ], text: message, subject: property.name);
    }
    log.v(response);
  }
}
