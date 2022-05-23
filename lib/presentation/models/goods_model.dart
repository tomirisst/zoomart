class Goods {
  final int? id;
  final String? name;
  final String? description;
  final String? price;
  final String? photo;

  const Goods({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.photo,
  });

  factory Goods.fromJson(Map<String, dynamic> json) {
    return Goods(
      id: int.parse(json['id']),
      name: json['name'],
      description: json['description'],
      price: json['price'],
      //!.toDouble()
      photo: json['photo'],
    );
  }
}
