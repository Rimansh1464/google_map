// To parse this JSON data, do
//
//     final usearDataModel = usearDataModelFromJson(jsonString);

import 'dart:convert';

UsearDataModel usearDataModelFromJson(String str) => UsearDataModel.fromJson(json.decode(str));

String usearDataModelToJson(UsearDataModel data) => json.encode(data.toJson());

class UsearDataModel {
  UsearDataModel({
    this.status,
    this.refreshToken,
    this.data,
  });

  int? status;
  String? refreshToken;
  Data ?data;

  factory UsearDataModel.fromJson(Map<String, dynamic> json) => UsearDataModel(
    status: json["status"],
    refreshToken: json["refresh_token"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "refresh_token": refreshToken,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.userid,
    this.firstname,
    this.username,
    this.companyname,
    this.mobilenumber,
    this.email,
    this.roleid,
    this.clientId,
    this.dealerId,
    this.subdealerId,
  });

  String? userid;
  String ?firstname;
  String ?username;
  String ?companyname;
  String ?mobilenumber;
  String ?email;
  String ?roleid;
  String ?clientId;
  dynamic dealerId;
  dynamic subdealerId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userid: json["userid"],
    firstname: json["firstname"],
    username: json["username"],
    companyname: json["companyname"],
    mobilenumber: json["mobilenumber"],
    email: json["email"],
    roleid: json["roleid"],
    clientId: json["client_id"],
    dealerId: json["dealer_id"],
    subdealerId: json["subdealer_id"],
  );

  Map<String, dynamic> toJson() => {
    "userid": userid,
    "firstname": firstname,
    "username": username,
    "companyname": companyname,
    "mobilenumber": mobilenumber,
    "email": email,
    "roleid": roleid,
    "client_id": clientId,
    "dealer_id": dealerId,
    "subdealer_id": subdealerId,
  };
}
