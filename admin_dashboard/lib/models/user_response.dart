
import 'package:admin_dashboard/models/auth_response.dart';

class UserResponse {
  UserResponse({
    this.usuarios,
    this.total,
  });

  int? total;
  List<Usuario>? usuarios;

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
    usuarios: json["usuarios"] == null ? null :  List<Usuario>.from(json["usuarios"].map((x) => Usuario.fromJson(x))),
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "usuarios": usuarios == null ? null : List<dynamic>.from(usuarios!.map((x) => x.toJson())),
    "total": total,
  };
}