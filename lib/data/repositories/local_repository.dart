import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/models.dart';
import '../providers/providers.dart';

class LocalRepository {
  final LocalApiProvider localApiProvider;
  LocalRepository() : localApiProvider = LocalApiGalleryProvider();

  Future<FileModel?> pickImage({required ImageSource source}) async {
    try {
      return await localApiProvider.pickImage(source: source);
    } catch (e) {
      rethrow;
    }
  }

  Future<FileModel?> pickVideo({required ImageSource source}) async {
    try {
      return await localApiProvider.pickVideo(source: source);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<PlatformFile>> photos() async {
    try {
      return await localApiProvider.photos();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<PlatformFile>> videos() async {
    try {
      return await localApiProvider.videos();
    } catch (e) {
      rethrow;
    }
  }
}
