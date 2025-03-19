import 'file_path_model.dart';

class FilesWithPathsListModel {
  String mainPath;
  String subPath;
  String folderName;
  List<FilePathModel> filePathList;
  List<FilePathModel> fileLinkList = [];

  FilesWithPathsListModel({
    required this.mainPath,
    required this.subPath,
    required this.folderName,
    required this.filePathList,
    this.fileLinkList = const [],
  });
}
