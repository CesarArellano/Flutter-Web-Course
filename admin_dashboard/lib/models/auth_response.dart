import 'dart:convert';

AuthResponse authResponseFromJson(String str) => AuthResponse.fromJson(json.decode(str));

String authResponseToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
  AuthResponse({
    this.usuario,
    this.token,
  });

  Usuario? usuario;
  String? token;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
    usuario: json["usuario"] == null ? null : Usuario.fromJson(json["usuario"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "usuario": usuario?.toJson(),
    "token": token,
  };
}

class Usuario {
  Usuario({
    this.rol,
    this.estado,
    this.google,
    this.nombre,
    this.correo,
    this.uid,
    this.img,
  });

  String? rol;
  bool? estado;
  bool? google;
  String? nombre;
  String? correo;
  String? uid;
  String? img;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
    rol: json["rol"],
    estado: json["estado"],
    google: json["google"],
    nombre: json["nombre"],
    correo: json["correo"],
    uid: json["uid"],
    img: json["img"],
  );

  Map<String, dynamic> toJson() => {
    "rol": rol,
    "estado": estado,
    "google": google,
    "nombre": nombre,
    "correo": correo,
    "uid": uid,
    "img": img,
  };
}
