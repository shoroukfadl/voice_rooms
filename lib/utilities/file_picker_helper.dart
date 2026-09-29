import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:mime/mime.dart';
import 'package:roomly/utilities/constants/enums.dart';

enum FileCategory { image, video, audio, document, any }

class PickedFile {
  final String path;
  final String name;
  final String extension;
  final FileCategory type;
  final String? mimeType;

  PickedFile({
    required this.path,
    required this.name,
    required this.extension,
    required this.type,
    this.mimeType,
  });

  factory PickedFile.fromPlatformFile(PlatformFile file) {
    final ext = file.extension?.toLowerCase() ?? '';
    final type = _getFileTypeFromExtension(ext);
    final mimeType = lookupMimeType(file.path ?? "");

    return PickedFile(
      path: file.path ?? '',
      name: file.name,
      extension: ext,
      type: type,
      mimeType: mimeType,
    );
  }

  static FileCategory _getFileTypeFromExtension(String extension) {
    final imageExtensions = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp', 'svg'];
    final videoExtensions = ['mp4', 'mov', 'avi', 'mkv', 'wmv', 'flv', 'webm'];
    final audioExtensions = ['mp3', 'wav', 'aac', 'ogg', 'flac', 'm4a'];
    final documentExtensions = [
      'pdf',
      'doc',
      'docx',
      'xls',
      'xlsx',
      'ppt',
      'pptx',
      'txt',
      'csv',
      'rtf'
    ];

    if (imageExtensions.contains(extension)) return FileCategory.image;
    if (videoExtensions.contains(extension)) return FileCategory.video;
    if (audioExtensions.contains(extension)) return FileCategory.audio;
    if (documentExtensions.contains(extension)) return FileCategory.document;
    return FileCategory.any;
  }

  bool get isImage => type == FileCategory.image;
  bool get isVideo => type == FileCategory.video;
  bool get isAudio => type == FileCategory.audio;
  bool get isDocument => type == FileCategory.document;
}

class FilePickerHelper {
  /// Pick multiple images
  static Future<List<PickedFile>> pickImages({
    bool allowMultiple = true,
    List<String>? allowedExtensions,
  }) async {
    return pickFiles(
      type: FileCategory.image,
      allowMultiple: allowMultiple,
      allowedExtensions: allowedExtensions,
    );
  }

  /// Pick multiple videos
  static Future<List<PickedFile>> pickVideos({
    bool allowMultiple = true,
    List<String>? allowedExtensions,
  }) async {
    return pickFiles(
      type: FileCategory.video,
      allowMultiple: allowMultiple,
      allowedExtensions: allowedExtensions,
    );
  }

  /// Pick multiple audio files
  static Future<List<PickedFile>> pickAudio({
    bool allowMultiple = true,
    List<String>? allowedExtensions,
  }) async {
    return pickFiles(
      type: FileCategory.audio,
      allowMultiple: allowMultiple,
      allowedExtensions: allowedExtensions,
    );
  }

  /// Pick multiple documents
  static Future<List<PickedFile>> pickDocuments({
    bool allowMultiple = true,
    List<String>? allowedExtensions,
  }) async {
    return pickFiles(
      type: FileCategory.document,
      allowMultiple: allowMultiple,
      allowedExtensions: allowedExtensions,
    );
  }

  /// Pick any files
  static Future<List<PickedFile>> pickFiles({
    FileCategory type = FileCategory.any,
    bool allowMultiple = true,
    List<String>? allowedExtensions,
  }) async {
    final result = await FilePicker.pickFiles(
      type: FileType.values
          .firstWhere((item) => _getFileTypeGroup(type).name == item.name),
      allowedExtensions: allowedExtensions,
    );

    if (result == null || result.isEmpty) {
      return [];
    }
    return result.map((file) => PickedFile.fromPlatformFile(file)).toList();
  }

  /// Pick a single file
  static Future<PickedFile?> pickSingleFile({
    FileCategory type = FileCategory.any,
    List<String>? allowedExtensions,
  }) async {
    final files = await pickFiles(
      type: type,
      allowMultiple: false,
      allowedExtensions: allowedExtensions,
    );
    return files.isNotEmpty ? files.first : null;
  }

  /// Pick a single image
  static Future<PickedFile?> pickSingleImage({
    List<String>? allowedExtensions,
  }) async {
    final files = await pickImages(
      allowMultiple: false,
      allowedExtensions: allowedExtensions,
    );
    return files.isNotEmpty ? files.first : null;
  }

  /// Pick a single video
  static Future<PickedFile?> pickSingleVideo({
    List<String>? allowedExtensions,
  }) async {
    final files = await pickVideos(
      allowMultiple: false,
      allowedExtensions: allowedExtensions,
    );
    return files.isNotEmpty ? files.first : null;
  }

  static FileTypeGroup _getFileTypeGroup(FileCategory type) {
    switch (type) {
      case FileCategory.image:
        return FileTypeGroup.image;
      case FileCategory.video:
        return FileTypeGroup.video;
      case FileCategory.audio:
        return FileTypeGroup.audio;
      case FileCategory.document:
        return FileTypeGroup.custom;
      case FileCategory.any:
        return FileTypeGroup.any;
    }
  }

  /// Get file extension from path
  static String getFileExtension(String path) {
    return path.split('.').last.toLowerCase();
  }

  /// Get file name from path
  static String getFileName(String path) {
    return path.split(Platform.pathSeparator).last;
  }

  /// Get file size in human readable format
  static String formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(2)} KB';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
    }
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
  }

  /// Check if file is of a specific type
  static bool isFileType(String path, FileCategory type) {
    final ext = getFileExtension(path);
    return PickedFile._getFileTypeFromExtension(ext) == type;
  }
}
