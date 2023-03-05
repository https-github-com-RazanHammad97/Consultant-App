

class Inbox {
  final int id;
  final String name;
  final String color;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int mailsCount;

  Inbox({
    required this.id,
    required this.name,
    required this.color,
    required this.createdAt,
    required this.updatedAt,
    required this.mailsCount,
  });

  factory Inbox.fromJson(Map<String, dynamic> json) {
    return Inbox(
      id: json['id'],
      name: json['name'],
      color: json['color'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      mailsCount: int.parse(json['mails_count']),
    );
  }
}














