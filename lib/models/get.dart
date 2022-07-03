import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
    User({
        this.id,
        this.image,
        this.pImg,
        this.name,
        this.age,
        this.phoneNum,
        this.geneticHistory,
        this.identity,
        this.bloodType,
        this.medicines,
        this.allergies,
        this.testResult,
        this.createdAt,
    });

    int? id;
    String ?image;
    String ?pImg;
    String? name;
    int ?age;
    String ?phoneNum;
    String ?geneticHistory;
    String ?identity;
    String? bloodType;
    String? medicines;
    String ?allergies;
    dynamic ?testResult;
    DateTime? createdAt;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        image: json["image"],
        pImg: json["p_img"],
        name: json["name"],
        age: json["age"],
        phoneNum: json["phone_num"],
        geneticHistory: json["genetic_history"],
        identity: json["identity"],
        bloodType: json["blood_type"],
        medicines: json["medicines"],
        allergies: json["allergies"],
        testResult: json["test_result"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "p_img": pImg,
        "name": name,
        "age": age,
        "phone_num": phoneNum,
        "genetic_history": geneticHistory,
        "identity": identity,
        "blood_type": bloodType,
        "medicines": medicines,
        "allergies": allergies,
        "test_result": testResult,
        "created_at": createdAt!.toIso8601String(),
    };
}




