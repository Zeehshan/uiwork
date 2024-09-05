import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../configs/apis/apis.dart';
import '../models/models.dart';
import '../utils/utils.dart';

class ChatMessagesProvider extends ChangeNotifier {
  ///TODO:
  String? _documentId;

  String? lastMessage;

  late String userB;

  List<MessageModel> messages = [];

  ManageUI messageManageUI = ManageUI.loading;

  chatCreated({required String documentId}) {
    _documentId = documentId;
    BackendApis.chats
        .doc(documentId)
        .collection('messages')
        .orderBy('time_stamp', descending: true)
        .snapshots()
        .listen((snapshot) {
      final listMessage = snapshot.docs;
      _chatMessagesLoaded(listMessage);
    }, onDone: () {}, onError: (err) {});
  }

  void _chatMessagesLoaded(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) async {
    try {
      messages = docs.map((e) => MessageModel.fromJson(e.data())).toList();
      logger.d(messages.length);
      messageManageUI = ManageUI.loaded;
      notifyListeners();
    } catch (e) {
      messageManageUI = ManageUI.failure;
      logger.e(runtimeType, error: '${e.runtimeType}::${e.toString()}');
    }
  }

  messageSent({
    required String message,
    required String currentUser,
  }) async {
    try {
      lastMessage = message;
      notifyListeners();
      final ref =
          BackendApis.chats.doc(_documentId).collection('messages').doc();
      BackendApis.baseUrl.runTransaction((transaction) async {
        transaction.set(ref, {
          'content': message,
          'id_from': currentUser,
          'id_to': _documentId,
          'time_stamp': FieldValue.serverTimestamp(),
        });
      });
    } catch (e) {
      logger.e(e);
    }
  }
}
