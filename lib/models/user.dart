class User {
  String id;
  String name;
  String picture;
  String accessToken;
  String email;
  bool isLoggedIn;

  User(
      {
      required this.id,
      required this.name,
      required this.picture,
      required this.accessToken,
      required this.isLoggedIn,
      required this.email
      });
}
