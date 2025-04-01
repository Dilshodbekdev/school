/// id : 15
/// weekday : 3
/// items : [{"id":35,"subject":{"value":21,"label":"Tushlik"},"dishes":[{"id":4,"name":"test","calorie":null},{"id":5,"name":"Osh","calorie":500},{"id":6,"name":"Sho'rva","calorie":300}],"image":{"id":88,"file":"http://school2.technocorp.uz/media/files/Happy-programmers-day_Happy-programmers-day_Happy-programmers-day.jpeg","name":"Happy-programmers-day_Happy-programmers-day_Happy-programmers-day.jpeg","file_url":"d996aa4fe62e/media/files/Happy-programmers-day_Happy-programmers-day_Happy-programmers-day.jpeg"}},{"id":36,"subject":{"value":20,"label":"Tushdan keyingi ovqatlanish"},"dishes":[{"id":2,"name":"soup","calorie":100},{"id":3,"name":"kasha","calorie":null},{"id":6,"name":"Sho'rva","calorie":300}],"image":{"id":89,"file":"http://school2.technocorp.uz/media/files/photo_2024-08-02_12-53-58_Nvbu1es.jpg","name":"photo_2024-08-02_12-53-58_Nvbu1es.jpg","file_url":"d996aa4fe62e/media/files/photo_2024-08-02_12-53-58_Nvbu1es.jpg"}}]
/// order : 1

class MenuModel {
  MenuModel({
    this.id,
    this.weekday,
    this.order,
    this.items,
  });

  MenuModel.fromJson(dynamic json) {
    id = json['id'];
    weekday = json['weekday'];
    order = json['order'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(MenuItems.fromJson(v));
      });
    }
  }

  int? id;
  int? weekday;
  int? order;
  List<MenuItems>? items;
}

/// id : 35
/// subject : {"value":21,"label":"Tushlik"}
/// dishes : [{"id":4,"name":"test","calorie":null},{"id":5,"name":"Osh","calorie":500},{"id":6,"name":"Sho'rva","calorie":300}]
/// image : {"id":88,"file":"http://school2.technocorp.uz/media/files/Happy-programmers-day_Happy-programmers-day_Happy-programmers-day.jpeg","name":"Happy-programmers-day_Happy-programmers-day_Happy-programmers-day.jpeg","file_url":"d996aa4fe62e/media/files/Happy-programmers-day_Happy-programmers-day_Happy-programmers-day.jpeg"}

class MenuItems {
  MenuItems({
    this.id,
    this.subject,
    this.dishes,
    this.image,
  });

  MenuItems.fromJson(dynamic json) {
    id = json['id'];
    subject =
        json['subject'] != null ? Subject.fromJson(json['subject']) : null;
    if (json['dishes'] != null) {
      dishes = [];
      json['dishes'].forEach((v) {
        dishes?.add(Dishes.fromJson(v));
      });
    }
    image = json['image'] != null ? Image1.fromJson(json['image']) : null;
  }

  int? id;
  Subject? subject;
  List<Dishes>? dishes;
  Image1? image;
}

/// id : 88
/// file : "http://school2.technocorp.uz/media/files/Happy-programmers-day_Happy-programmers-day_Happy-programmers-day.jpeg"
/// name : "Happy-programmers-day_Happy-programmers-day_Happy-programmers-day.jpeg"
/// file_url : "d996aa4fe62e/media/files/Happy-programmers-day_Happy-programmers-day_Happy-programmers-day.jpeg"

class Image1 {
  Image1({
    this.id,
    this.file,
    this.name,
    this.fileUrl,
  });

  Image1.fromJson(dynamic json) {
    id = json['id'];
    file = json['file'];
    name = json['name'];
    fileUrl = json['file_url'];
  }

  int? id;
  String? file;
  String? name;
  String? fileUrl;
}

/// id : 4
/// name : "test"
/// calorie : null

class Dishes {
  Dishes({
    this.id,
    this.name,
    this.calorie,
  });

  Dishes.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    calorie = json['calorie'];
  }

  int? id;
  String? name;
  dynamic calorie;
}

/// value : 21
/// label : "Tushlik"

class Subject {
  Subject({
    this.value,
    this.label,
  });

  Subject.fromJson(dynamic json) {
    value = json['value'];
    label = json['label'];
  }

  int? value;
  String? label;
}
