import 'package:flutter_test/flutter_test.dart';
import 'package:pesquisa_cafe_02/screens/menuDoenca/praga_model.dart';

void main() {
  testWidgets('praga model ...', (tester) async {
    final praga = PragaModel();
    praga.carregarImagem('Ferrugem do Cafeeiro.jpg');
  });
}
