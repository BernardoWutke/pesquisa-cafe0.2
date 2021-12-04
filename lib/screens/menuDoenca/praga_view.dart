import 'package:flutter/material.dart';
import 'package:pesquisa_cafe_02/screens/arguments/pragra_view_arguments.dart';
import 'package:pesquisa_cafe_02/screens/menuDoenca/praga_controller.dart';
import 'package:pesquisa_cafe_02/shareds/colors.dart';
import 'package:pesquisa_cafe_02/shareds/fonts.dart';
import 'package:rx_notifier/rx_notifier.dart';

class PragaView extends StatelessWidget {
  const PragaView({Key? key}) : super(key: key);
  static const routeName = '/praga_view';

  @override
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height;
    double appWidth = MediaQuery.of(context).size.width;

    final controller = PragaController();
    final args =
        ModalRoute.of(context)!.settings.arguments as PragaViewArguments;
    controller.carregarDados(args.title);

    Widget pragaTopBar() {
      return Stack(
        children: [
          Container(
            height: appHeight * 0.3,
            width: appWidth,
            child: Image.network(
              controller.imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: appHeight * 0.28,
            width: appWidth,
            child: Column(
              verticalDirection: VerticalDirection.down,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: AppColors.colorWhite,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: appHeight * 0.15,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: appHeight * 0.01,
                    ),
                    Text(
                      args.title,
                      style: AppFonts.titlePraga,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      );
    }

    Widget separador() {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: Container(
          height: appHeight * 0.005,
          color: AppColors.colorSeparator,
        ),
      );
    }

    Widget pragraSObre() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              controller.sobre,
              style: AppFonts.sobrePraga,
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      );
    }

    Widget titlePragaSobre() {
      return Container(
        color: AppColors.colorWhite,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "Sobre",
            style: AppFonts.titleSobrePraga,
          ),
        ),
      );
    }

    Widget titleMenuProdutosPraga() {
      return Container(
        color: AppColors.colorWhite,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "Produtos Usados",
            style: AppFonts.titleSobrePraga,
          ),
        ),
      );
    }

    Widget pragaHomeVIew() {
      return ListView(
        children: [
          pragaTopBar(),
          titlePragaSobre(),
          pragraSObre(),
          titleMenuProdutosPraga()
        ],
      );
    }

    Widget loadData() {
      if (!controller.isLoad) {
        return pragaHomeVIew();
      } else {
        return Center(child: CircularProgressIndicator());
      }
    }

    return Scaffold(
      backgroundColor: AppColors.colorTitleMenuPrimaryHome,
      body: RxBuilder(
        builder: (_) => loadData(),
      ),
    );
  }
}
