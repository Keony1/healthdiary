import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'chat_controller.dart';

class ChatPage extends StatefulWidget {
  final String title;
  final String mealId;
  const ChatPage({Key key, this.title = "Mensagens", this.mealId})
      : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends ModularState<ChatPage, ChatController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    // TODO: implement initState

    final dispose =
        autorun((_) => controller.getCommentsSnapshots(widget.mealId));
    dispose();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _body(),
    );
  }

  _body() {
    var teste = controller.commentsSnapshots;

    return Container();
  }
}
