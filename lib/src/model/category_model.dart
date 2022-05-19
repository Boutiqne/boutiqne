class CategoryModel {
  String? name, image;
  int? id;

  CategoryModel({
    this.name,
    this.image,
    this.id,
  });

  CategoryModel.fromJson(Map<dynamic, dynamic> map) {
    id = map['id'];
    name = map['name'];
    image = map['image'];
  }

  toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }
}

List<CategoryModel> categories = [
  CategoryModel(
    id: 1,
    name: 'Multimedia',
    image: 'assets/icons/Icon material-phonelink.svg',
  ),
  CategoryModel(
    id: 2,
    name: 'Vehicules',
    image: 'assets/icons/Icon map-car-dealer.svg',
  ),
  CategoryModel(
    id: 3,
    name: 'Maisons',
    image: 'assets/icons/Icon metro-home.svg',
  ),
  CategoryModel(
    id: 4,
    name: 'Jeux',
    image: 'assets/icons/Icon ionic-logo-game-controller-b.svg',
  ),
  CategoryModel(
    id: 5,
    name: 'Vêtements',
    image: 'assets/icons/Gift Icon.svg',
  ),
  CategoryModel(
    id: 6,
    name: 'Animaux',
    image: 'assets/icons/Icon map-veterinary-care.svg',
  ),
];
  
    // List<Map<String, dynamic>> categories = [
    //   {"icon": "assets/icons/Flash Icon.svg", "text": "Flash"},
    //   {"icon": "assets/icons/Bill Icon.svg", "text": "Bill"},
    //   {"icon": "assets/icons/Game Icon.svg", "text": "Game"},
    //   {"icon": "assets/icons/Gift Icon.svg", "text": "Daily Gift"},
    //   {"icon": "assets/icons/Discover.svg", "text": "More"},
    // ];
