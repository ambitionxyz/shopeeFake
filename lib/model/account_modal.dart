class AccountModal {
  int? id;
  String? email;
  String? username;
  String? password;
  AccountModal({this.id, this.email, this.username, this.password});
  factory AccountModal.fromJson(Map<String, dynamic> json) {
    var a = AccountModal(
        id: json["id"],
        email: json["email"],
        username: json["username"],
        password: json["password"]);
    return a;
  }
}
