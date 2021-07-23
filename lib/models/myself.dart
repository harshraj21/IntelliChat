class MyselfModel {
  String primaryid;
  String secondaryid;
  String name;
  String picuri;
  // final bool isOnline; TODO: privacy settings manual overwrite
  String bio;
  bool isLoggedin;
  String authToken;
  MyselfModel({
    required this.primaryid,
    required this.secondaryid,
    required this.name,
    this.picuri = 'null',
    // required this.isOnline,
    required this.bio,
    required this.isLoggedin,
    required this.authToken,
  });
}
