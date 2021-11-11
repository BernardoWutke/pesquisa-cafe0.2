import 'package:flutter/material.dart';

class DoencaView extends StatelessWidget {
  const DoencaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MenuDoenca(),
    );
  }
}

class MenuDoenca extends StatefulWidget {
  MenuDoenca({Key? key}) : super(key: key);

  @override
  _MenuDoencaState createState() => _MenuDoencaState();
}

class _MenuDoencaState extends State<MenuDoenca> {
  @override
  Widget build(BuildContext context) {
    return Column();
  }
}
