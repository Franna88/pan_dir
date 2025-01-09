import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;

Future<Uint8List?> getImageData(String imagePath) async {
  try {
    final storageRef = FirebaseStorage.instance.ref();
    return await storageRef.child(imagePath).getData(1000000);
  } catch (e) {
    return null;
  }
}

Future<String?> getImageUrl(String imagePath) async {
  try {
    final storageRef = FirebaseStorage.instance.ref();
    return await storageRef.child(imagePath).getDownloadURL();
  } catch (e) {
    return null;
  }
}
