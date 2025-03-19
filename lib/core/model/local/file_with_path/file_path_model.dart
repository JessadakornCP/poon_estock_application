import 'package:flutter/material.dart';

class FilePathModel {
  int? id;
  String? folderName;
  String? filename;
  String? filePath;
  String? fileNetwork;
  bool isURL;
  GlobalKey? key;

  FilePathModel({
    this.id,
    this.folderName,
    this.filename,
    this.filePath,
    this.fileNetwork,
    this.isURL = false,
    this.key,
  });
}
