class ProdectModal {
  String id;
  String name;
  String description;
  String? imageUrl;
  double price;

  ProdectModal({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "price": price,
      "imageUrl": imageUrl,
    };
  }

  static ProdectModal fromMap(Map<String, dynamic> map) {
    return ProdectModal(
        id: map["id"],
        name: map["name"],
        description: map["description"],
        price: map["price"]
    );
  }
}
