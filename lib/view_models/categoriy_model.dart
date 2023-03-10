





class Category {
  final int id;
  final String name;
  final  String createdAt;
  final  String updatedAt;
  final  String sendersCount;
  final List<dynamic> senders;

  Category({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.sendersCount,
    required this.senders,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as int,
      name: json['name'] as String,
      createdAt:  json['created_at'],
      updatedAt: json['updated_at'] ,
      sendersCount: json['senders_count'],
      senders: json['senders'] as List<dynamic>,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'senders_count': sendersCount,
      'senders': senders,
    };
  }
}
