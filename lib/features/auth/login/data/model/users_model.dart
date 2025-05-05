
class UserModels {
  String? usersId;
  String? usersName;
  String? usersPassword;
  String? usersEmail;
  String? usersPhone;
  String? usersVerifycode;
  String? usersApprove;
  String? usersCreate;

  UserModels({this.usersId, this.usersName, this.usersPassword, this.usersEmail, this.usersPhone, this.usersVerifycode, this.usersApprove, this.usersCreate});

  UserModels.fromJson(Map<String, dynamic> json) {
    usersId = json["users_id"];
    usersName = json["users_name"];
    usersPassword = json["users_password"];
    usersEmail = json["users_email"];
    usersPhone = json["users_phone"];
    usersVerifycode = json["users_verifycode"];
    usersApprove = json["users_approve"];
    usersCreate = json["users_create"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["users_id"] = usersId;
    _data["users_name"] = usersName;
    _data["users_password"] = usersPassword;
    _data["users_email"] = usersEmail;
    _data["users_phone"] = usersPhone;
    _data["users_verifycode"] = usersVerifycode;
    _data["users_approve"] = usersApprove;
    _data["users_create"] = usersCreate;
    return _data;
  }
}
