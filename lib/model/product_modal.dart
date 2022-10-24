class ProductModal {
  int? id; //co the mang gia tri null
  String? title;
  num? price;
  String? description;
  String? category;
  String? image;
  ProductModal(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image}); //khoi tao
  factory ProductModal.fromJson(Map<String, dynamic> json) {
    var p = ProductModal(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        category: json["category"],
        image: json["image"]);
    return p;
  }
}
