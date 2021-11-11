import 'package:flutter/material.dart';
import 'package:pesquisa_cafe_02/providers/buscar_praga_provider.dart';
import 'package:pesquisa_cafe_02/shareds/colors.dart';
import 'package:pesquisa_cafe_02/shareds/fonts.dart';
import 'package:provider/provider.dart';

class BuscarProduto extends StatelessWidget {
  const BuscarProduto({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorTitleMenuPrimaryHome,
      body: Center(
        child: MenuBuscarProduto(),
      ),
    );
  }
}

class MenuBuscarProduto extends StatefulWidget {
  MenuBuscarProduto({Key? key}) : super(key: key);

  @override
  _MenuBuscarProdutoState createState() => _MenuBuscarProdutoState();
}

class _MenuBuscarProdutoState extends State<MenuBuscarProduto> {
  @override
  Widget build(BuildContext context) {
    var pragas_list = Provider.of<BuscarPragraProvider>(context);
    var pragas = pragas_list.pragas;
    double _heigth = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Widget itemList(String txt) {
      return GestureDetector(
        onTap: () => print(txt),
        child: ListTile(
          leading: Icon(
            Icons.search,
            color: AppColors.colorWhite,
            size: 40,
          ),
          title: Text(
            txt,
            style: AppFonts.titleTileBusca,
          ),
        ),
      );
    }

    return ListView(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Row(
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.colorWhite,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextFormField(
                onChanged: (txt) => pragas_list.searchItem(txt),
              ),
            ),
            SizedBox(height: _heigth * 0.05),
          ],
        ),
        for (var item in pragas_list.search_lista) itemList(item)
      ],
    );
  }
}
