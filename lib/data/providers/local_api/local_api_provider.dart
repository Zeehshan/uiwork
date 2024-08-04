import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/models.dart';

abstract class LocalApiProvider {
  Future<FileModel?> pickImage({required ImageSource source});
  Future<FileModel?> pickVideo({required ImageSource source});

  Future<List<PlatformFile>> photos();
  Future<List<PlatformFile>> videos();
}
