/// currentPage : 1
/// countItemsOnPage : 10
/// totalPages : 2
/// count : 13
/// pageSize : 10
/// results : [{"id":14,"title":"O’quvchilarimizning INGLIZ TILI bilimlarini yanada kuchaytirish maqsadida darajalarga bo’lingan qo’shimcha Ingliz tili kurslarini tashkil qildik!","description":"","images":["sd","sdc"]},{"id":13,"title":"Kitobxonlik","description":"","images":[]},{"id":12,"title":"Kitobxonlik","description":"","images":[]},{"id":11,"title":"🥋Taekwondo bo’yicha o’quvchilarimiz katta natijalarni qo’lga kiritishmoqda!","description":"","images":[]},{"id":10,"title":"Barcha ustozlarimiz o’zlarining oila va farzandlariga nisbatan ko’proq vaqtlarini o’quvchilariga ajratishadi!","description":"","images":[]},{"id":9,"title":"🏫5 tashabbusga asoslangan holda Lumos Mind maktabi o’quvchilari o’rtasida “Uchkurash” musobaqasi o’tkazilindi!","description":"","images":[]},{"id":8,"title":"🔥Lumos Mind maktabida “ONAJONLAR MAJLISI”","description":"","images":[]},{"id":7,"title":"📄Bugun Lumos Mind maktabida saylov bo’lib o’tdi","description":"","images":[]},{"id":6,"title":"📄Ertaga 20-yanvar LUMOS MIND prezidentini aniqlash uchun saylov kuni!","description":"","images":[]},{"id":5,"title":"Maktabimizda 2025-yil uchun ko’plab yangiliklar tayyorlaganmiz, ulardan biri MAKTAB PREZIDENTI","description":"","images":[]}]

class NewsStudentModel {
  NewsStudentModel({
    this.currentPage,
    this.countItemsOnPage,
    this.totalPages,
    this.count,
    this.pageSize,
    this.results,
  });

  NewsStudentModel.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    countItemsOnPage = json['countItemsOnPage'];
    totalPages = json['totalPages'];
    count = json['count'];
    pageSize = json['pageSize'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(NewStudentModel.fromJson(v));
      });
    }
  }

  int? currentPage;
  int? countItemsOnPage;
  int? totalPages;
  int? count;
  int? pageSize;
  List<NewStudentModel>? results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['countItemsOnPage'] = countItemsOnPage;
    map['totalPages'] = totalPages;
    map['count'] = count;
    map['pageSize'] = pageSize;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 14
/// title : "O’quvchilarimizning INGLIZ TILI bilimlarini yanada kuchaytirish maqsadida darajalarga bo’lingan qo’shimcha Ingliz tili kurslarini tashkil qildik!"
/// description : ""
/// images : ["sd","sdc"]

class NewStudentModel {
  NewStudentModel({
    this.id,
    this.title,
    this.description,
    this.images,
  });

  NewStudentModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
  }

  int? id;
  String? title;
  String? description;
  List<String>? images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['images'] = images;
    return map;
  }
}
