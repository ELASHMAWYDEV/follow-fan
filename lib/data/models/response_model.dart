class ResponseModel {
  final String message;
  final bool status;
  final dynamic data;

  ResponseModel({
    required this.message,
    required this.status,
    required this.data,
  });

  factory ResponseModel.fromJson(final json) => ResponseModel(
        message: json["message"] ?? "",
        status: json["status"] ?? false,
        data: json["data"],
      );
}
