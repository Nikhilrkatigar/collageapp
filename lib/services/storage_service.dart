import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadFile(String path, String fileName) async {
    try {
      TaskSnapshot snapshot = await _storage.ref(path).child(fileName).putFile(File(path));
      String downloadURL = await snapshot.ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      return 'Error: $e';
    }
  }
}
