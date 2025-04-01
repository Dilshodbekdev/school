/// id : 14
/// images : ["",""]
/// videos : ["",""]
/// created_at : "27-01-2025 15:38"
/// updated_at : "27-01-2025 15:38"
/// title : "O’quvchilarimizning INGLIZ TILI bilimlarini yanada kuchaytirish maqsadida darajalarga bo’lingan qo’shimcha Ingliz tili kurslarini tashkil qildik!"
/// description : ""
/// content : "Dushanba va Payshanba kunlari soat 17:00 da ELEMENTARY darajasi uchun;\n\nSeshanba va Juma kunlari soat 17:00 da Pre-Intermediate darajasi uchun;\n\nO’quvchilarimiz dars vaqtidan keyin  qolib bilimlarini yanada kuchaytirishlari mumkun bo’ladi! \n\nXurmatli ota-onalar ushbu imkoniyatdan foydalangan holda farzandingizni qo’shimcha darslarga qo’shilishiga imkoniyat yaratib bering, zero biz o’quvchilarimiz uchun xarakat qilmoqdamiz va bularni barchasi hech qanday qo’shimcha to’lovlarsiz!\n\nKurslar maktab binosining 5 qavatida 512-513 sinf xonalarida bo’lib o’tadi.\n\nO’qituvchilar: Mr Po’lat va Mr Zair"
/// is_published : true

class NewDetailsStudentModel {
  NewDetailsStudentModel({
      this.id, 
      this.images, 
      this.videos, 
      this.createdAt, 
      this.updatedAt, 
      this.title, 
      this.description, 
      this.content, 
      this.isPublished,});

  NewDetailsStudentModel.fromJson(dynamic json) {
    id = json['id'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    videos = json['videos'] != null ? json['videos'].cast<String>() : [];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    title = json['title'];
    description = json['description'];
    content = json['content'];
    isPublished = json['is_published'];
  }
  int? id;
  List<String>? images;
  List<String>? videos;
  String? createdAt;
  String? updatedAt;
  String? title;
  String? description;
  String? content;
  bool? isPublished;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['images'] = images;
    map['videos'] = videos;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['title'] = title;
    map['description'] = description;
    map['content'] = content;
    map['is_published'] = isPublished;
    return map;
  }

}