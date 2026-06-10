class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String imageURL;

  const Product({required this.id, required this.title, required this.price, required this.description, required this.imageURL});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'], 
      title: json['title'], 
      price: json['price'], 
      description: json['description'], 
      imageURL: json['image']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'image': imageURL,
    };
  }
}