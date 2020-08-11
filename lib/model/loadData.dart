class LoadData {
  final String username;
  final String email;

  LoadData({this.username,this.email});

  factory LoadData.fromJson(Map<String, dynamic> json) {
    return LoadData(
      username: json['username'],
      email: json['email'],
    );
  }
}
