class ProductDiscounts {
  ProductDiscounts({
    this.id,
    this.type,
    this.name,
    this.image,
    this.description,
    this.offer,
  });

  ProductDiscounts.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    offer = json['offer'];
  }
  String? id;
  String? type;
  String? name;
  String? image;
  String? description;
  String? offer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type'] = type;
    map['name'] = name;
    map['image'] = image;
    map['description'] = description;
    map['offer'] = offer;
    return map;
  }
}
