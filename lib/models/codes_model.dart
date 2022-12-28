class CodesModel {
  int status;
  String message;
  List<Code> codes;

  CodesModel(
      {required this.status, required this.message, required this.codes});

  factory CodesModel.fromJson(dynamic data) {
    final status = data['status'];
    final message = data['massage'];
    final codes = (data['data'] as List).map((e) => Code.fromJson(e)).toList();
    return CodesModel(status: status, message: message, codes: codes);
  }
}

class Code {
  int id;
  String code;
  String createdAt;
  String updatedAt;
  dynamic scannerId;
  Code(
      {required this.id,
      required this.updatedAt,
      required this.createdAt,
      required this.code,
      required this.scannerId});

  factory Code.fromJson(dynamic data) {
    final id = data['id'];
    final code = data['code'];
    final updatedAt = data['updated_at'];
    final createdAt = data['created_at'];
    final scannerId = data['scanner_id'];
    return Code(
        id: id,
        updatedAt: updatedAt,
        createdAt: createdAt,
        code: code,
        scannerId: scannerId);
  }
}
