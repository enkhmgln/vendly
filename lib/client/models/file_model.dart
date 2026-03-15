class FileModel {
  final String id;
  final String createdAt;
  final String updatedAt;
  final String? userId;
  final String originalName;
  final String storedName;
  final String mimeType;
  final int size;
  final String path;
  final String url;

  const FileModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.userId,
    required this.originalName,
    required this.storedName,
    required this.mimeType,
    required this.size,
    required this.path,
    required this.url,
  });

  factory FileModel.fromJson(Map<String, dynamic> json) {
    return FileModel(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      userId: json['user_id'] as String?,
      originalName: json['original_name'],
      storedName: json['stored_name'],
      mimeType: json['mime_type'],
      size: json['size'],
      path: json['path'],
      url: json['url'],
    );
  }
}
