import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../../../models/models.dart';
import '../../../utils/utils.dart';
import '../providers.dart';

class LocalApiGalleryProvider implements LocalApiProvider {
  @override
  Future<FileModel?> pickImage({required ImageSource source}) async {
    try {
      final XFile? pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile == null) {
        return null;
      }
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: const CropAspectRatio(
          ratioX: 1.0,
          ratioY: 1.0,
        ),
        compressQuality: 100,
        maxWidth: 1000,
        maxHeight: 1000,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Crop photo',
              // lockAspectRatio: f,
              // hideBottomControls: true,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(title: 'Crop photo', aspectRatioLockEnabled: true)
        ],
      );
      if (croppedFile == null) {
        return null;
      }
      return FileModel(
          file: croppedFile.path,
          name: pickedFile.name,
          size: (await pickedFile.length()),
          filetype: AttachementType.image);
      // return croppedFile?.path;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<FileModel?> pickVideo({required ImageSource source}) async {
    try {
      final XFile? pickedFile = await ImagePicker().pickVideo(source: source);
      logger.i(pickedFile?.path);
      if (pickedFile == null) {
        return null;
      } else {
        return FileModel(
            file: pickedFile.path,
            name: pickedFile.name,
            size: (await pickedFile.length()),
            filetype: AttachementType.video);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<PlatformFile>> photos() async {
    try {
      FilePickerResult? response = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.image,
        allowCompression: true,
        withData: true,
      );
      return response?.files ?? [];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<PlatformFile>> videos() async {
    try {
      FilePickerResult? response = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.video,
        allowCompression: true,
        withData: true,
      );
      return response?.files ?? [];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<FileModel>> galleryPhotos() async {
    try {
      List<FileModel> files = [];
      FilePickerResult? response = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.media,
        allowCompression: true,
      );
      if (response == null) {
        return [];
      } else {
        for (final item in response.files) {
          if (item.path != null) {
            if (File(item.path!).existsSync()) {
              final isVideo = Tools.isVideo(item.path!);
              files.add(FileModel(
                file: item.path!,
                name: item.name,
                size: item.size,
                filetype:
                    isVideo ? AttachementType.video : AttachementType.image,
              ));
            }
          }
        }
      }

      return files;
    } catch (e) {
      rethrow;
    }
  }
}
