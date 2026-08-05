/// The signed-in user's profile (from GET /users/me).
class Profile {
  final String id;
  final String? phone;
  final String? name;
  final String? avatarUrl;

  const Profile({required this.id, this.phone, this.name, this.avatarUrl});

  factory Profile.fromJson(Map<String, dynamic> j) => Profile(
        id: j['id'] as String,
        phone: j['phone'] as String?,
        name: j['name'] as String?,
        avatarUrl: j['avatarUrl'] as String?,
      );
}
