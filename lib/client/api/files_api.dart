import '/client/api_client.dart';
import '/client/api_result.dart';
import '/client/form_data_request.dart';
import '/client/models/file_model.dart';
import '/client/response_sender.dart';

class FilesApi {
  FilesApi._();

  static final _sender = ResponseSender(ApiClient());

  static Future<ApiResult<FileModel>> upload({
    required String filePath,
    String? filename,
  }) async {
    final request = FormDataRequest(
      files: [
        FormDataFilePart(
          filePath: filePath,
          fieldName: 'file',
          filename: filename,
        ),
      ],
    );
    return _sender.postFormData<FileModel>(
      '/api/files/upload',
      request: request,
      fromJson: (d) => FileModel.fromJson(d as Map<String, dynamic>),
    );
  }

  static Future<ApiResult<FileModel>> get(String fileId) async {
    return _sender.get<FileModel>(
      '/api/files/$fileId',
      fromJson: (d) => FileModel.fromJson(d as Map<String, dynamic>),
    );
  }
}
