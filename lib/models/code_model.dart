import 'package:qrscanner/models/codes_model.dart';

class CodeModel {
  int status;
  String message;
  Code code;
  CodeModel({required this.status, required this.code, required this.message});
  factory CodeModel.fromJson(dynamic data) {
    final status = data['status'];
    final message = data['massage'];
    final code = Code.fromJson(data['data']);
    return CodeModel(status: status, code: code, message: message);
  }
}
