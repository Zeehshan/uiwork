import 'package:cloud_firestore/cloud_firestore.dart';

class BackendApis {
  static final baseUrl = FirebaseFirestore.instance;
  static final metas = baseUrl.collection('metas');

  static final users = baseUrl.collection('users');

  static final ott = baseUrl.collection('ott');

  static final group = baseUrl.collection('group');
}
