import 'package:pesquisa_cafe_02/screens/menuDoenca/praga_model.dart';
import 'package:rx_notifier/rx_notifier.dart';

class PragaController {
  String _imagePath = '';
  final _sobre = RxNotifier<String>('');
  final _isLoad = RxNotifier<bool>(true);

  bool get isLoad => _isLoad.value;
  String get imagePath => _imagePath;
  String get sobre => _sobre.value;

  void carregarDados(String title) {
    final model = PragaModel();
    try {
      model.carregarImagem(title).then((value) {
        _imagePath = value;
        print(_imagePath);

        model.carregarSobre(title).then((value) {
          _sobre.value = value;
          print(_sobre);
        });

        _isLoad.value = false;
      });
    } catch (e) {
      print(e);
    }
  }
}
