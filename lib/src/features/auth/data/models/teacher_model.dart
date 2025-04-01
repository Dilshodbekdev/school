import 'package:school/src/features/auth/data/models/user_model.dart';

/// id : 2
/// first_name : "Ivan"
/// last_name : "Ivanov"
/// mid_name : "Ivanovich"
/// username : "i.ivanov"
/// temp_password : null
/// birth_date : "19-08-2024"
/// gender : "M"
/// living_place : {"value":7,"label":"Навоийская область"}
/// district : {"value":1,"label":"Карманинский район"}
/// address : "навои"
/// photo : null
/// phone : "+998909999999"
/// email : ""
/// status : "ACTIVE"
/// is_active : true
/// role : "TEACHER"
/// subjects : [29,28]
/// subject_names : ["Suzish","Volleybol"]
/// curation_ids : [13]
/// curation_names : ["2-A | 2024-2025"]
/// experience : {"value":1,"label":"2 год"}
/// is_staff_teacher : true

class TeacherModel {
  TeacherModel({
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
    this.photo,
    this.phone,
    this.email,
    this.status,
    this.isActive,
    this.role,
    this.subjects,
    this.subjectNames,
    this.curationIds,
    this.curationNames,
    this.experience,
    this.isStaffTeacher,
  });

  TeacherModel.fromJson(dynamic json) {
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
    photo = json['photo'] != null ? Photo.fromJson(json['photo']) : null;
    phone = json['phone'];
    email = json['email'];
    status = json['status'];
    isActive = json['is_active'];
    role = json['role'];
    subjects = json['subjects'] != null ? json['subjects'].cast<int>() : [];
    subjectNames = json['subject_names'] != null
        ? json['subject_names'].cast<String>()
        : [];
    curationIds =
        json['curation_ids'] != null ? json['curation_ids'].cast<int>() : [];
    curationNames = json['curation_names'] != null
        ? json['curation_names'].cast<String>()
        : [];
    experience = json['experience'] != null
        ? Experience.fromJson(json['experience'])
        : null;
    isStaffTeacher = json['is_staff_teacher'];
  }

  int? id;
  String? firstName;
  String? lastName;
  String? midName;
  String? username;
  dynamic tempPassword;
  String? birthDate;
  String? gender;
  LivingPlace? livingPlace;
  District? district;
  String? address;
  Photo? photo;
  String? phone;
  String? email;
  String? status;
  bool? isActive;
  String? role;
  List<int>? subjects;
  List<String>? subjectNames;
  List<int>? curationIds;
  List<String>? curationNames;
  Experience? experience;
  bool? isStaffTeacher;
}

/// value : 1
/// label : "2 год"

class Experience {
  Experience({
    this.value,
    this.label,
  });

  Experience.fromJson(dynamic json) {
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

/// value : 1
/// label : "Карманинский район"

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

/// value : 7
/// label : "Навоийская область"

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
