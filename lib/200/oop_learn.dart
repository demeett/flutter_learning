import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

import 'custom_exception.dart';

abstract class IFileDownload {
  bool? downloadFile(FileItem? fileItem);
  void toShare(String path) async {
    if (!await launchUrl(Uri.parse(path))) {
      throw 'Could not launch $path';
    }
  }
}

class FileDownload implements IFileDownload {
  @override
  bool? downloadFile(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();
    if (kDebugMode) {
      print('a');
    }
    return true;
  }

  @override
  void toShare(String path) {
    // TODO: implement toShare
  }
}

class FileItem {
  final String name;
  final File file;
  FileItem(this.name, this.file);
}
