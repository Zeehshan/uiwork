import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../../configs/apis/apis.dart';
import '../../../models/meta/meta_model.dart';
import '../../../utils/utils.dart';
import '../providers.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AppApiHttpProvider implements AppApiProvider {
  @override
  Future uploadImage(
      {required String imagePath,
      required String imageFilePath,
      required void Function(double? progress) progress,
      required void Function(String imageUr) remoteVideoPath}) async {
    try {
      firebase_storage.UploadTask task =
          firebase_storage.FirebaseStorage.instance.ref(imagePath).putFile(
                File(imageFilePath),
              );
      bool isCalled = false;
      task.snapshotEvents.listen(
          (firebase_storage.TaskSnapshot snapshot) async {
        try {
          final double _progress =
              (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
          if (!isCalled) {
            progress(_progress);
          }
          if (_progress == 100.0 && !isCalled) {
            isCalled = true;
            progress(null);
            task.whenComplete(() async {
              final videoRemoteUrl = await snapshot.ref.getDownloadURL();
              remoteVideoPath(
                videoRemoteUrl,
              );
            });
          }
        } catch (e) {
          logger.e(e);
        }
      }, onError: (e) {
        throw e;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future uploadVideo(
      {required String videoPath,
      required String thumbnailPath,
      required String videofilePath,
      required String thumbnailFilePath,
      required void Function(double? progress) progress,
      required void Function(String videoUrl, String thumbnail)
          remoteVideoPath}) async {
    try {
      firebase_storage.UploadTask task =
          firebase_storage.FirebaseStorage.instance.ref(videoPath).putFile(
              File(videofilePath), SettableMetadata(contentType: 'video/mp4'));
      bool isCalled = false;
      task.snapshotEvents.listen(
          (firebase_storage.TaskSnapshot snapshot) async {
        try {
          final double _progress =
              (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
          if (!isCalled) {
            progress(_progress);
          }
          if (_progress == 100.0 && !isCalled) {
            isCalled = true;
            progress(null);
            task.whenComplete(() async {
              final videoRemoteUrl = await snapshot.ref.getDownloadURL();
              firebase_storage.UploadTask newTask = firebase_storage
                  .FirebaseStorage.instance
                  .ref(thumbnailPath)
                  .putFile(File(thumbnailFilePath));
              newTask.whenComplete(() async {
                final imageRemoteUrl =
                    await newTask.snapshot.ref.getDownloadURL();
                remoteVideoPath(videoRemoteUrl, imageRemoteUrl);
              });
            });
          }
        } catch (e) {
          logger.e(e);
        }
      }, onError: (e) {
        throw e;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> createFileDocument(
      {required UploadType type, int? size, String? name}) async {
    try {
      final data = {
        'metaid': null,
        'metasize': size,
        'metatext': name,
        'metatype': type == UploadType.videos ? 'V' : 'P',
        'metatime': FieldValue.serverTimestamp(),
      };
      final DocumentReference documentReference =
          await BackendApis.metas.add(data);
      return documentReference.id;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future updateFileDocument({
    required String id,
    required String file,
    String? thubnail,
  }) async {
    try {
      final data = {
        'metaid': id,
        'file': {
          'remote': file,
          if (thubnail != null) 'thubnail': thubnail,
        }
      };
      await BackendApis.metas.doc(id).update(data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<List<MetaModel>> metas() {
    try {
      Stream<QuerySnapshot> querySnapshots = BackendApis.metas
          .where('metaid', isNotEqualTo: null)
          .orderBy('metatime', descending: false)
          .snapshots();
      return querySnapshots.map((list) {
        return list.docs
            .where((d) => (d.data() as Map<String, dynamic>)['metaid'] != null)
            .map((doc) {
          return MetaModel.fromJson(doc.data() as Map<String, dynamic>);
        }).toList();
      });
    } catch (e) {
      rethrow;
    }
  }
}
