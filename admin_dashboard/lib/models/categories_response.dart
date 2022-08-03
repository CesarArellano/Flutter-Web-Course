import 'dart:convert';

CategoriesResponse categoriesResponseFromJson(String str) => CategoriesResponse.fromJson(json.decode(str));

String categoriesResponseToJson(CategoriesResponse data) => json.encode(data.toJson());

class CategoriesResponse {
  CategoriesResponse({
    this.total,
    this.categorias,
  });

  int? total;
  List<Categoria>? categorias;

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) => CategoriesResponse(
    total: json["total"],
    categorias: json["categorias"] == null ? null : List<Categoria>.from(json["categorias"].map((x) => Categoria.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "categorias": categorias == null ? null : List<dynamic>.from(categorias!.map((x) => x.toJson())),
  };
}

class Categoria {
  Categoria({
    this.id,
    this.nombre,
    this.usuario,
  });

  String? id;
  String? nombre;
  User? usuario;

  factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
    id: json["_id"],
    nombre: json["nombre"],
    usuario: json["usuario"] == null ? null : User.fromJson(json["usuario"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "nombre": nombre,
    "usuario": usuario?.toJson(),
  };

  Categoria copyWith({String? id, String? nombre, User? usuario}) {
    return Categoria(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      usuario: usuario ?? this.usuario,
    );
  }
}

class User {
  User({
    this.id,
    this.nombre,
  });

  String? id;
  String? nombre;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    nombre: json["nombre"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "nombre": nombre,
  };
}
