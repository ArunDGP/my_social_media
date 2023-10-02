class UserModel {         //user model
  final String? id;
  final String name;
  final String image;
  final String description;

  UserModel(
      {this.id,
      required this.name,
      required this.image,
      required this.description});

  static UserModel fromMap({required Map map}) => UserModel(        
      id: map['id'],
      name: map['name'],
      image: map['image'],
      description: map['description']);
}
