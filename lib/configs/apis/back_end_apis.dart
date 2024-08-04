import 'package:cloud_firestore/cloud_firestore.dart';

class BackendApis {
  static final baseUrl = FirebaseFirestore.instance;
  static final metas = baseUrl.collection('metas');
}
