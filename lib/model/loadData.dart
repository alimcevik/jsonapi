class LoadData {
  final String username;
  final String email;

  LoadData({this.email, this.username});

  factory LoadData.fromJson(Map<String, dynamic> json) {
    return LoadData(
      username: json['username'],
      email: json['email'],
    );
  }
}
