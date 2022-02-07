class InsuredModel {
  int? id;
  int? forWhom;
  String? fullname;
  String? birthDate;
  String? nationalCode;
  int? geoDivisionId;
  int? gender;
  String? geoDivision;
  String? uploadFiles;

  InsuredModel({
    this.id,
    this.forWhom,
    this.fullname,
    this.birthDate,
    this.nationalCode,
    this.geoDivisionId,
    this.gender,
    this.geoDivision,
    this.uploadFiles,
  });

  InsuredModel.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? 0;
    forWhom = json["forWhom"] ?? 0;
    fullname = json["fullname"] ?? "";
    birthDate = json["birthDate"] ?? "";
    nationalCode = json["nationalCode"] ?? "";
    geoDivisionId = json["geoDivisionId"] ?? 0;
    gender = json["gender"] ?? 0;
    geoDivision = json["geoDivision"] ?? "";
    uploadFiles = json["uploadFiles"] ?? "";
  }
}
