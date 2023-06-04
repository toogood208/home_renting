import 'dart:io';

import 'package:home_renting/app/app.locator.dart';
import 'package:home_renting/core/models/property.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:stacked_services/stacked_services.dart';

class ApiService{
  final _snackBar = locator<SnackbarService>();

 Future<String?> downloadImage(Property property)async{
    try{
      final imageUrl = property.imageUrl;
      final imageResponse = await http.get(Uri.parse(imageUrl));
      final bytes = imageResponse.bodyBytes;
      final temp = await getTemporaryDirectory();
      final path = '${temp.path}/property.jpg';
      File(path).writeAsBytesSync(bytes);
      return path;
    } on SocketException{
      _snackBar.showSnackbar(message: "request failed, please check your internet connection");
     return null;
    } catch(e){
      _snackBar.showSnackbar(message: "request failed, $e");
     return null;
    }
  }


}