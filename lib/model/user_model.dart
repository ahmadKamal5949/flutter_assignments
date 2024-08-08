class UserModel {
  final String uid;
  final String displayName;
  final String creationDate;
  final int avatar;

  const UserModel({
    required this.uid,
    required this.displayName,
    required this.creationDate,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['UID'].toString(),
      displayName: json['DisplayName'].toString(),
      creationDate: json['CreationDate'].toString(),
      avatar: json['Avatar'] as int,
    );
  }
}
