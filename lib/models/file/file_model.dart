import '../../utils/utils.dart';

class FileModel {
  final String file;
  final String name;
  final int size;
  final AttachementType filetype;
  String? thumbnail;

  FileModel(
      {required this.file,
      required this.name,
      required this.size,
      required this.filetype,
      this.thumbnail});
}
