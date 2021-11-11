import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BuscarPragraProvider extends ChangeNotifier {
  List<String> _pragas_lista = [];
  List<String> _search_lista = [];
  bool _isLoad = true;
  bool _isSearch = false;

  List<String> get pragas {
    if (_isLoad) {
      readPragas();
    }
    _isLoad = false;
    return _pragas_lista;
  }

  List<String> get search_lista {
    return _search_lista;
  }

  set isLoad(bool estado) {
    _pragas_lista.clear();
    _isLoad = estado;
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

  void searchItem(String txt) {
    _search_lista.clear();
    _pragas_lista.forEach((element) {
      if (element.toUpperCase().contains(txt.toUpperCase())) {
        _search_lista.add(element);
      }
    });
    notifyListeners();
  }
}
