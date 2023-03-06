class Role {
   Role({
    required this.id,
    required this.name,
     this.createdAt="",
     this.updatedAt="",
  });
    int? id;
    String? name;
    String? createdAt;
    String? updatedAt;

  Role.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}