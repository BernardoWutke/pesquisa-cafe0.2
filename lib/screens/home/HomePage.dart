import 'package:flutter/material.dart';
import 'package:pesquisa_cafe_02/shareds/colors.dart';
import 'package:pesquisa_cafe_02/shareds/fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorPrimary,
      body: MenuHome(),
    );
  }
}

class MenuHome extends StatelessWidget {
  const MenuHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () => print("Icon logoff"),
                    icon: Icon(
                      Icons.logout,
                      color: AppColors.colorIconLogout,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Text(
                    "Seja bem vindo ;)",
                    style: AppFonts.titleHome,
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/findProduto'),
            child: Card(
                color: AppColors.colorPrimary,
                child: Column(
                  children: [
                    Container(
                        width: double.infinity,
                        color: AppColors.colorTitleMenuPrimaryHome,
                        child: Row(
                          children: [
                            Icon(
                              Icons.find_in_page,
                              color: AppColors.colorWhite,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "Procurar por uma doença",
                              style: AppFonts.titleMenusHome,
                            ),
                          ],
                        )),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: double.infinity,
                      child: Image.asset(
                        "lib/src/cafeLupa.jpg",
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                )),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Card(
              color: AppColors.colorPrimary,
              child: Column(
                children: [
                  Container(
                      width: double.infinity,
                      color: AppColors.colorTitleMenuSecundaryHome,
                      child: Row(
                        children: [
                          Icon(
                            Icons.find_in_page,
                            color: AppColors.colorWhite,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Procurar por um Produto",
                            style: AppFonts.titleMenusHome,
                          ),
                        ],
                      )),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: double.infinity,
                    child: Image.asset(
                      "lib/src/aplicandoProduto.png",
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              )),
        )
      ],
    );
  }
}
