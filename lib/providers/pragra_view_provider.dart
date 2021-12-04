import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/widgets.dart';

class PragaMenuProvider extends ChangeNotifier {
  String _namePraga = " ";
  String _sobre = "";
  String _imagePath = "";
  bool _fistLoad = true;
  bool _isLoad = true;

  bool get isLoad => _isLoad;
  bool get fistLoad => _fistLoad;
  String get image => _imagePath;
  String get praga => _namePraga;
  String get sobre => _sobre;

  void reset() {
    _fistLoad = true;
  }

  void loadData(String pragaTitle) async {
    {
      if (_fistLoad) {
        _isLoad = true;
        _namePraga = pragaTitle;

        try {
          print("o nome é $pragaTitle");
          final ref = firebase_storage.FirebaseStorage.instance
              .ref()
              .child("$pragaTitle.png");
          _imagePath = await ref.getDownloadURL();
        } catch (e) {
          print(e);
        }

        print(_imagePath);
        _isLoad = false;
        _fistLoad = false;
        notifyListeners();
      }
    }
  }
}
