import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';

import '../data/repositories/repositories.dart';
import '../models/file/file_model.dart';
import '../utils/utils.dart';

class TabCProvider extends ChangeNotifier {
  final LocalRepository localRepository = LocalRepository();
  String title = 'sdfsdfsafdsdf';
  String? selectedItem;
  String description = 'asdfasdfsdfsfd';
  bool isLeftSwithcEnable = false;
  int participants = 0;
  Map<int, FileModel> files = {};
  String message = '';
  List<Map<String, dynamic>> menus = [
    {
      'id': '0',
      'label': 'Item 1',
    },
    {
      'id': '1',
      'label': 'Item 2',
    },
    {
      'id': '2',
      'label': 'Item 3',
    },
    {
      'id': '3',
      'label': 'Item 4',
    },
    {
      'id': '4',
      'label': 'Settings',
    },
  ];

  switchChanged() {
    isLeftSwithcEnable = !isLeftSwithcEnable;
    notifyListeners();
  }

  menuItemSelected(String v) {
    selectedItem = v;
    notifyListeners();
  }

  setTitleAndDescription(String titleValue, String decriptionValue) {
    title = titleValue;
    description = decriptionValue;
    notifyListeners();
  }

  changedMessage(String v) {
    message = v;
    notifyListeners();
  }

  getMediaFiles() async {
    try {
      final mediaFiles = await localRepository.galleryPhotos();
      for (var i = 0; i < mediaFiles.length; i++) {
        final file = mediaFiles[i];
        files[file.file.hashCode] = mediaFiles[i];
      }
      notifyListeners();
    } catch (e) {
      logger.e(e);
    }
  }

  thumbnailGenerated(int key, String thumbnail) {
    files[key]!.thumbnail = thumbnail;
    notifyListeners();
  }

  removeFile(int key) {
    files.remove(key);
    notifyListeners();
  }

  getAttachmentType(String name) {
    if (Tools.isVideo(name)) {
      return AttachementType.video;
    } else {
      return AttachementType.image;
    }
  }
}
