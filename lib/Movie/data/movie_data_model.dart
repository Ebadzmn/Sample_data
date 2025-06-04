class Movie {
  final int id;
  final String name;
  final String description;
  final String category;

  Movie({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
  });

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      category: map['category'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'category': category,
    };
  }
}
