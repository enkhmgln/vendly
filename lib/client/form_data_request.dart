class FormDataFilePart {
  const FormDataFilePart({
    required this.filePath,
    this.fieldName = 'file',
    this.filename,
  });

  /// Local path to the file.
  final String filePath;

  /// Form field name (e.g. 'file' for API that expects `file`).
  final String fieldName;

  /// Optional filename sent to the server. If null, derived from [filePath].
  final String? filename;

  String get effectiveFilename =>
      filename ?? filePath.split(RegExp(r'[/\\]')).last;
}

/// Request body for multipart/form-data (e.g. file upload).
/// Converted to the underlying HTTP client format inside [ApiClient].
class FormDataRequest {
  const FormDataRequest({this.files = const [], this.fields = const {}});

  /// File parts to send.
  final List<FormDataFilePart> files;

  /// Optional form fields (string key-value).
  final Map<String, String> fields;

  FormDataRequest copyWith({
    List<FormDataFilePart>? files,
    Map<String, String>? fields,
  }) {
    return FormDataRequest(
      files: files ?? this.files,
      fields: fields ?? this.fields,
    );
  }
}
