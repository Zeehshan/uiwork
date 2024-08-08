import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

import '../data/repositories/repositories.dart';
import '../utils/utils.dart';

class UploadFilesProvider extends ChangeNotifier {
  late BuildContext cxt;
  final LocalRepository localRepository = LocalRepository();
  final AppRepository appRepository = AppRepository();
  Map<String, double> progresses = {};

  Map<String, String> thumbnails = {};

  List<PlatformFile> files = [];

  Map<String, bool> uploaded = {};

  UploadType uploadType = UploadType.images;

  bool uploadStarted = false;

  UploadFilesProvider({
    required UploadType type,
    required BuildContext context,
    List<XFile?>? cameraFiles,
  }) {
    if (cameraFiles != null) {
      files = cameraFiles
          .map((f) => PlatformFile(
                path: f?.path,
                name: f?.name ?? '',
                size: 0,

                ///TODO:
              ))
          .toList();
    } else {
      if (type == UploadType.images) {
        getPhotos();
      } else {
        getVideos();
      }
    }
    uploadType = type;
    cxt = context;
    notifyListeners();
  }

  getPhotos() async {
    try {
      files = await localRepository.photos();
      notifyListeners();
    } catch (e) {
      logger.e(e);
    }
  }

  getVideos() async {
    try {
      files = await localRepository.videos();
      notifyListeners();
    } catch (e) {
      logger.e(e);
    }
  }

  thumbnailGenerated(String key, String thumbnail) {
    thumbnails[key] = thumbnail;
    notifyListeners();
  }

  progressChanged(String id, double progress) {
    logger.i(progress);
    progresses[id] = progress;
    notifyListeners();
  }

  uploadedChanged(String id, bool status) {
    uploaded[id] = status;
    notifyListeners();
    uploadFileCalled();
  }

  uploadFileCalled() async {
    if (!uploadStarted) {
      uploadStarted = true;
      notifyListeners();
    }
    try {
      if (files.length != uploaded.values.length) {
        final file = files[uploaded.values.length];
        final documentId = await appRepository.createFileDocument(
          type: uploadType,
          size: file.size,
          name: file.name,
        );
        if (uploadType == UploadType.videos) {
          appRepository.uploadVideo(
              videoPath: 'videos/$documentId',
              thumbnailPath: 'thumbnails/$documentId',
              videofilePath: file.path!,
              thumbnailFilePath: thumbnails[file.path]!,
              progress: (double? progress) =>
                  progressChanged(file.path!, progress ?? 0),
              remoteVideoPath: (videFile, thumbnail) async {
                await appRepository.updateFileDocument(
                  id: documentId,
                  file: videFile,
                  thubnail: thumbnail,
                );
                uploadedChanged(file.path!, true);
              });
        } else {
          appRepository.uploadImage(
              imagePath: 'images/$documentId',
              imageFilePath: file.path!,
              progress: (double? progress) =>
                  progressChanged(file.path!, progress ?? 0),
              remoteVideoPath: (remoteLink) async {
                await appRepository.updateFileDocument(
                  id: documentId,
                  file: remoteLink,
                );
                uploadedChanged(file.path!, true);
              });
        }
      } else {
        Navigator.pop(cxt);
      }
    } catch (e) {
      logger.e(e);
    }
  }
}
