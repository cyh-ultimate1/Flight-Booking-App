class LoginResponse{

  final String token;
  final String userID;
  final String userName;
  LoginResponse(this.token, this.userID, this.userName);

  LoginResponse.fromJson(Map<String, dynamic> json)
      : token = json['token'],
        userID = json['userID'],
        userName = json['userName'];

}