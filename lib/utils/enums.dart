import 'package:flutter/material.dart';

enum StreamTabType { first, second }

enum AttachementType { image, video, file }

enum UploadType { images, videos }

enum ChatAddOptions {
  photos,
  files,
  dialog;

  IconData get icon {
    switch (this) {
      case ChatAddOptions.photos:
        return Icons.photo;
      case ChatAddOptions.files:
        return Icons.attach_file;
      case ChatAddOptions.dialog:
        return Icons.message;
    }
  }

  String get label {
    switch (this) {
      case ChatAddOptions.photos:
        return 'Photos';
      case ChatAddOptions.files:
        return 'Files';
      case ChatAddOptions.dialog:
        return 'Dialog';
    }
  }
}
