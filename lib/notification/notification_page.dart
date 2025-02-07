

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class notePage extends StatefulWidget {

  @override
  State<notePage> createState() => _notePageState();
}

class _notePageState extends State<notePage> {

  static const route ='/note_screen';

  @override
  Widget build(BuildContext context) {

    final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('page view'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(message.notification!.title.toString()),
            Text(message.notification!.body.toString()),
            Text(message.data.toString()),
          ],
        ),
      ),
    );
  }
}
