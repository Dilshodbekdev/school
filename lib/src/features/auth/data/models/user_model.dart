import 'package:school/src/features/auth/data/models/hobby_model.dart';

/// id : 349
/// first_name : "Абдуссамихон"
/// last_name : "Абдукаюмов"
/// mid_name : "Абдуфоихович"
/// username : "а.абдукаюмов"
/// temp_password : null
/// birth_date : "05-05-2016"
/// gender : "M"
/// living_place : {"value":5,"label":"Namangan viloyati"}
/// district : {"value":30,"label":"Chortoq tumani"}
/// address : "Street"
/// hobby : {"value":5,"label":"Sayohat qilish"}
/// photo : {"id":76,"file":"/media/files/adult-attractive-blue-casual-thumbnail_X7Fuiac.jpg","name":"adult-attractive-blue-casual-thumbnail_X7Fuiac.jpg","file_url":"3610320c6d91/media/files/adult-attractive-blue-casual-thumbnail_X7Fuiac.jpg"}
/// phone : "+998996565656"
/// achievements : [{"id":16,"category":{"value":6,"label":"Sport yutuqlari"},"direction":{"value":2,"label":"Sportdagi yutuqlar"},"location":{"value":3,"label":"Osiyo chempionati"},"description":"Description","given_date":"20-11-2024","file":{"id":95,"file":"/media/files/fashion-men-portraits-shopify-thumbnail_AHc1yA6.jpg","name":"fashion-men-portraits-shopify-thumbnail_AHc1yA6.jpg","file_url":"3610320c6d91/media/files/fashion-men-portraits-shopify-thumbnail_AHc1yA6.jpg"}}]
/// email : ""
/// status : "ACTIVE"
/// is_active : true
/// created_at : "05-09-2024 10:48"
/// role : "STUDENT"
/// birth_place : {"value":6,"label":"Buxoro viloyati"}
/// relation : []
/// grade : {"value":13,"label":"2-\"A\" sinf"}

class UserModel {
  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.midName,
    this.username,
    this.tempPassword,
    this.birthDate,
    this.gender,
    this.livingPlace,
    this.district,
    this.address,
    this.hobby,
    this.photo,
    this.phone,
    this.achievements,
    this.email,
    this.status,
    this.isActive,
    this.createdAt,
    this.role,
    this.birthPlace,
    this.grade,
  });

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    midName = json['mid_name'];
    username = json['username'];
    tempPassword = json['temp_password'];
    birthDate = json['birth_date'];
    gender = json['gender'];
    livingPlace = json['living_place'] != null
        ? LivingPlace.fromJson(json['living_place'])
        : null;
    district =
        json['district'] != null ? District.fromJson(json['district']) : null;
    address = json['address'];
    if(json['hobby']!=null){
      hobby = [];
      json['hobby'].forEach((v) {
        hobby?.add(HobbyModel.fromJson(v));
      });
    }
    photo = json['photo'] != null ? Photo.fromJson(json['photo']) : null;
    phone = json['phone'];
    if (json['achievements'] != null) {
      achievements = [];
      json['achievements'].forEach((v) {
        achievements?.add(Achievements.fromJson(v));
      });
    }
    email = json['email'];
    status = json['status'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    role = json['role'];
    birthPlace = json['birth_place'] != null
        ? BirthPlace.fromJson(json['birth_place'])
        : null;
    grade = json['grade'] != null ? Grade.fromJson(json['grade']) : null;
  }

  int? id;
  String? firstName;
  String? lastName;
  String? midName;
  String? username;
  String? tempPassword;
  String? birthDate;
  String? gender;
  LivingPlace? livingPlace;
  District? district;
  String? address;
  List<HobbyModel>? hobby;
  Photo? photo;
  String? phone;
  List<Achievements>? achievements;
  String? email;
  String? status;
  bool? isActive;
  String? createdAt;
  String? role;
  BirthPlace? birthPlace;
  Grade? grade;
}

/// value : 13
/// label : "2-\"A\" sinf"

class Grade {
  Grade({
    this.value,
    this.label,
  });

  Grade.fromJson(dynamic json) {
    value = json['value'];
    label = json['label'];
  }

  int? value;
  String? label;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = value;
    map['label'] = label;
    return map;
  }
}

/// value : 6
/// label : "Buxoro viloyati"

class BirthPlace {
  BirthPlace({
    this.value,
    this.label,
  });

  BirthPlace.fromJson(dynamic json) {
    value = json['value'];
    label = json['label'];
  }

  int? value;
  String? label;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = value;
    map['label'] = label;
    return map;
  }
}

/// id : 16
/// category : {"value":6,"label":"Sport yutuqlari"}
/// direction : {"value":2,"label":"Sportdagi yutuqlar"}
/// location : {"value":3,"label":"Osiyo chempionati"}
/// description : "Description"
/// given_date : "20-11-2024"
/// file : {"id":95,"file":"/media/files/fashion-men-portraits-shopify-thumbnail_AHc1yA6.jpg","name":"fashion-men-portraits-shopify-thumbnail_AHc1yA6.jpg","file_url":"3610320c6d91/media/files/fashion-men-portraits-shopify-thumbnail_AHc1yA6.jpg"}

class Achievements {
  Achievements({
    this.id,
    this.category,
    this.direction,
    this.location,
    this.description,
    this.givenDate,
    this.file,
  });

  Achievements.fromJson(dynamic json) {
    id = json['id'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    direction = json['direction'] != null
        ? Direction.fromJson(json['direction'])
        : null;
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    description = json['description'];
    givenDate = json['given_date'];
    file = json['file'] != null ? File.fromJson(json['file']) : null;
  }

  int? id;
  Category? category;
  Direction? direction;
  Location? location;
  String? description;
  String? givenDate;
  File? file;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    if (direction != null) {
      map['direction'] = direction?.toJson();
    }
    if (location != null) {
      map['location'] = location?.toJson();
    }
    map['description'] = description;
    map['given_date'] = givenDate;
    if (file != null) {
      map['file'] = file?.toJson();
    }
    return map;
  }
}

/// id : 95
/// file : "/media/files/fashion-men-portraits-shopify-thumbnail_AHc1yA6.jpg"
/// name : "fashion-men-portraits-shopify-thumbnail_AHc1yA6.jpg"
/// file_url : "3610320c6d91/media/files/fashion-men-portraits-shopify-thumbnail_AHc1yA6.jpg"

class File {
  File({
    this.id,
    this.file,
    this.name,
    this.fileUrl,
  });

  File.fromJson(dynamic json) {
    id = json['id'];
    file = json['file'];
    name = json['name'];
    fileUrl = json['file_url'];
  }

  int? id;
  String? file;
  String? name;
  String? fileUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['file'] = file;
    map['name'] = name;
    map['file_url'] = fileUrl;
    return map;
  }
}

/// value : 3
/// label : "Osiyo chempionati"

class Location {
  Location({
    this.value,
    this.label,
  });

  Location.fromJson(dynamic json) {
    value = json['value'];
    label = json['label'];
  }

  int? value;
  String? label;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = value;
    map['label'] = label;
    return map;
  }
}

/// value : 2
/// label : "Sportdagi yutuqlar"

class Direction {
  Direction({
    this.value,
    this.label,
  });

  Direction.fromJson(dynamic json) {
    value = json['value'];
    label = json['label'];
  }

  int? value;
  String? label;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = value;
    map['label'] = label;
    return map;
  }
}

/// value : 6
/// label : "Sport yutuqlari"

class Category {
  Category({
    this.value,
    this.label,
  });

  Category.fromJson(dynamic json) {
    value = json['value'];
    label = json['label'];
  }

  int? value;
  String? label;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = value;
    map['label'] = label;
    return map;
  }
}

/// id : 76
/// file : "/media/files/adult-attractive-blue-casual-thumbnail_X7Fuiac.jpg"
/// name : "adult-attractive-blue-casual-thumbnail_X7Fuiac.jpg"
/// file_url : "3610320c6d91/media/files/adult-attractive-blue-casual-thumbnail_X7Fuiac.jpg"

class Photo {
  Photo({
    this.id,
    this.file,
    this.name,
    this.fileUrl,
  });

  Photo.fromJson(dynamic json) {
    id = json['id'];
    file = json['file'];
    name = json['name'];
    fileUrl = json['file_url'];
  }

  int? id;
  String? file;
  String? name;
  String? fileUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['file'] = file;
    map['name'] = name;
    map['file_url'] = fileUrl;
    return map;
  }
}

/// value : 5
/// label : "Sayohat qilish"

/// value : 30
/// label : "Chortoq tumani"

class District {
  District({
    this.value,
    this.label,
  });

  District.fromJson(dynamic json) {
    value = json['value'];
    label = json['label'];
  }

  int? value;
  String? label;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = value;
    map['label'] = label;
    return map;
  }
}

/// value : 5
/// label : "Namangan viloyati"

class LivingPlace {
  LivingPlace({
    this.value,
    this.label,
  });

  LivingPlace.fromJson(dynamic json) {
    value = json['value'];
    label = json['label'];
  }

  int? value;
  String? label;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = value;
    map['label'] = label;
    return map;
  }
}
