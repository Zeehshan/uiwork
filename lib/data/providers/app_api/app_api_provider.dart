import '../../../models/models.dart';
import '../../../utils/enums.dart';
import '../../../utils/utils.dart';

abstract class AppApiProvider {
  Future uploadVideo({
    required String videoPath,
    required String thumbnailPath,
    required String videofilePath,
    required String thumbnailFilePath,
    required void Function(double? progress) progress,
    required void Function(String videoUrl, String thumbnail) remoteVideoPath,
  });

  Future uploadImage({
    required String imagePath,
    required String imageFilePath,
    required void Function(double? progress) progress,
    required void Function(String imageUr) remoteVideoPath,
  });

  /// Create File document to get the id if the document
  Future<String> createFileDocument({
    required UploadType type,
    int? size,
    String? name,
  });

  /// update the created document of file
  /// [id] is the doc id
  /// [file] is the remote file
  /// optional [thubnail] for video
  Future updateFileDocument({
    required String id,
    required String file,
    String? thubnail,
  });

  /// list all meta datas as stream,
  /// we only need metadatas with metadataId
  Stream<List<MetaModel>> metas();
}
