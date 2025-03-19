import 'file_path_model.dart';

class FileWithPathModel {
  String mainPath;
  String folderName;
  FilePathModel? filePath;
  FilePathModel? fileNetwork;

  FileWithPathModel({
    required this.mainPath,
    required this.folderName,
    required this.filePath,
    this.fileNetwork,
  });
}
