class Product {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  Rating rating;
  int? quantity = 0;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
    this.quantity,
    this.isFavorite = false,
  });


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': rating.toJson(),
      'quantity': quantity,
      'isFavorite': isFavorite,
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: Rating.fromJson(json['rating']),
      quantity: (json["quantity"] == null)? 1 : json['quantity'],
      isFavorite: (json["isFavorite"] == null)? false : json['isFavorite'],

    );
  }
}

class Rating {
  double rate;
  int count;

  Rating({required this.rate, required this.count});

  Map<String, dynamic> toJson() {
    return {
      'rate': rate,
      'count': count,
    };
  }

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate'].toDouble(),
      count: json['count'],
    );
  }
}
