import '../../models/models.dart';
import '../../utils/utils.dart';
import '../providers/providers.dart';

class AppRepository {
  final AppApiProvider appApiProvider;

  AppRepository() : appApiProvider = AppApiHttpProvider();

  Future uploadVideo({
    required String videoPath,
    required String thumbnailPath,
    required String videofilePath,
    required String thumbnailFilePath,
    required void Function(double? progress) progress,
    required void Function(String videoUrl, String thumbnail) remoteVideoPath,
  }) async {
    try {
      return await appApiProvider.uploadVideo(
          videoPath: videoPath,
          thumbnailPath: thumbnailPath,
          videofilePath: videofilePath,
          thumbnailFilePath: thumbnailFilePath,
          progress: progress,
          remoteVideoPath: remoteVideoPath);
    } catch (e) {
      rethrow;
    }
  }

  Future uploadImage({
    required String imagePath,
    required String imageFilePath,
    required void Function(double? progress) progress,
    required void Function(String imageUr) remoteVideoPath,
  }) async {
    try {
      return await appApiProvider.uploadImage(
          imagePath: imagePath,
          imageFilePath: imageFilePath,
          progress: progress,
          remoteVideoPath: remoteVideoPath);
    } catch (e) {
      rethrow;
    }
  }

  /// Create File document to get the id if the document
  Future<String> createFileDocument({
    required UploadType type,
    int? size,
    String? name,
  }) async {
    try {
      return await appApiProvider.createFileDocument(
        type: type,
        size: size,
        name: name,
      );
    } catch (e) {
      rethrow;
    }
  }

  /// update the created document of file
  /// [id] is the doc id
  /// [file] is the remote file
  /// optional [thubnail] for video
  Future updateFileDocument({
    required String id,
    required String file,
    String? thubnail,
  }) async {
    try {
      await appApiProvider.updateFileDocument(
        id: id,
        file: file,
        thubnail: thubnail,
      );
    } catch (e) {
      rethrow;
    }
  }

  /// list all meta datas as stream,
  /// we only need metadatas with metadataId
  Stream<List<MetaModel>> metas() {
    try {
      return appApiProvider.metas();
    } catch (e) {
      rethrow;
    }
  }
}
