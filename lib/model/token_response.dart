import "package:json_annotation/json_annotation.dart";

@JsonSerializable()
class TokenResponse {
  String? token;

  TokenResponse({this.token});

  TokenResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }
}
