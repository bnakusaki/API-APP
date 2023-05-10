import 'dart:io';

import 'package:apiapp/models/mysql.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SendAnonymous extends StatefulWidget {
  const SendAnonymous({super.key});

  @override
  State<SendAnonymous> createState() => _SendAnonymousState();
}

class _SendAnonymousState extends State<SendAnonymous> {
  var db = Mysql();
  var mail = '';
  final TextEditingController _textEditingController = TextEditingController();

  void _sendMessage() {
    db.getConnection().then((conn) {
      String sql =
          'INSERT INTO anonymous.anonymous_messages  (user_uid, message_id, message_content)  VALUES (${FirebaseAuth.instance.currentUser?.uid}, ${FirebaseAuth.instance.currentUser?.uid}'
          'msg'
          ', ${_textEditingController.text})';
      conn.query(sql);
    });
  }

  Future uploadMessage(String? value) async {
    const path = 'files/msg1';
    final ref = FirebaseStorage.instance.ref().child(path);
    await ref.putFile(value as File);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Send Anonymous Messages 😜😏',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: TextFormField(
            controller: _textEditingController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter message';
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        _sendMessage();
      }),
    );
  }
}
