class UserProfile {
  final String uid;
  final String name;
  final String email;

  static const UserProfile empty = UserProfile(
    uid: '',
    name: '',
    email: '',
  );

  const UserProfile({
    required this.uid,
    required this.name,
    required this.email,
  });
}
