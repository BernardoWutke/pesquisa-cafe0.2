import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DoencaProvider extends ChangeNotifier {
  List<String> _pragas_lista = [];
  bool _isLoad = true;

  List<String> get pragas {
    if (_isLoad) {
      readPragas();
    }
    _isLoad = false;
    return _pragas_lista;
  }

  void readPragas() async {
    await FirebaseFirestore.instance
        .collection('pragas')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["nome"]);
        _pragas_lista.add(doc["nome"]);
      });
    });
    notifyListeners();
  }
}
