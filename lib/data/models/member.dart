class Member {
  final String id;        // local UUID (Phase 2 sync ke kaam aayega)
  final String userId;    // gym-issued User ID, e.g. "7"
  final String name;
  final String gymTime;
  final DateTime joinedAt;

  Member({
    required this.id,
    required this.userId,
    required this.name,
    required this.gymTime,
    required this.joinedAt,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      id: json['id'] as String,
      userId: json['userId'] as String,
      name: json['name'] as String,
      gymTime: json['gymTime'] as String,
      joinedAt: DateTime.parse(json['joinedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'name': name,
        'gymTime': gymTime,
        'joinedAt': joinedAt.toIso8601String(),
      };

  Member copyWith({String? name, String? gymTime}) => Member(
        id: id,
        userId: userId,
        name: name ?? this.name,
        gymTime: gymTime ?? this.gymTime,
        joinedAt: joinedAt,
      );
}
