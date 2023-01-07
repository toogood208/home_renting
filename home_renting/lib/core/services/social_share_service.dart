import 'dart:io';

import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:home_renting/app/app.logger.dart';
import 'package:home_renting/core/models/property.dart';

enum Share {
  facebook,
  messenger,
  twitter,
  whatsapp,
  whatsappPersonal,
  whatsappBusiness,
  shareSystem,
  shareInstagram,
  shareTelegram
}

class SocialShareService {
  final log = getLogger("SocialShareService");
  String? response;
  final FlutterShareMe flutterShareMe = FlutterShareMe();

  Future<void> tapShare(
      {required Share share, required Property property, File? file}) async {
    final String message = """
          ${property.name}
          ${property.description}
          ${property.numberOfBedrooms},Bedrroms
          ${property.price}
          ${property.numberOfBathroom}, Bathrooms
          ${property.address}
""";
    switch (share) {
      case Share.facebook:
        response = await flutterShareMe.shareToFacebook(msg: message);
        break;
      case Share.messenger:
        response = await flutterShareMe.shareToMessenger(msg: message);
        break;
      case Share.twitter:
        response = await flutterShareMe.shareToTwitter(msg: message);
        break;
      case Share.whatsapp:
        if (file != null) {
          response = await flutterShareMe.shareToWhatsApp(
              imagePath: file.path, fileType: FileType.image);
        } else {
          response = await flutterShareMe.shareToWhatsApp(msg:message);
        }
        break;
      case Share.whatsappBusiness:
        response = await flutterShareMe.shareToWhatsApp(msg: message);
        break;
      case Share.shareSystem:
        response = await flutterShareMe.shareToSystem(msg: message);
        break;
      case Share.whatsappPersonal:
        response = await flutterShareMe.shareWhatsAppPersonalMessage(
            message: message, phoneNumber: '+234$property');
        break;
      case Share.shareInstagram:
        response = await flutterShareMe.shareToInstagram(
            filePath: file!.path, fileType: FileType.image);
        break;
      case Share.shareTelegram:
        response = await flutterShareMe.shareToTelegram(msg:message);
        break;
    }
    log.v(response);
  }
}
