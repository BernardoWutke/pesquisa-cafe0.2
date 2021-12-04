import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';

class PragaModel {
  String _imagePath = "";

  Future<String> carregarImagem(String pragaTitle) async {
    try {
      print("o nome é $pragaTitle.jgp");
      final ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child("$pragaTitle.jpg");
      _imagePath = await ref.getDownloadURL();
      return _imagePath;
    } catch (e) {
      print(e);
      return 'error';
    }
  }

  Future<String> carregarSobre(String pragraTitle) async {
    String sobreBuff = "null";
    try {
      await FirebaseFirestore.instance
          .collection('pragas')
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          if (doc['nome'] == pragraTitle) {
            sobreBuff = doc['sobre'];
          }
        });
      });
      return sobreBuff;
    } catch (e) {
      print(e);
      return 'error';
    }
  }
}
