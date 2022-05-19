class SubCategoryModel {
  String? name;
  int? id;

  SubCategoryModel({
    this.name,
    this.id,
  });

  SubCategoryModel.fromJson(Map<dynamic, dynamic> map) {
    id = map['id'];
    name = map['name'];
  }

  toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

List<SubCategoryModel> multimediaSubCategories = [
 SubCategoryModel(
    id: 11,
    name: 'Telephone',
 ),
 SubCategoryModel(
   id:12,
   name: 'Ordinateur',

 ),
  SubCategoryModel(
    id:13,
    name: 'Tablette',
  ),
  SubCategoryModel(
    id:14,
    name: 'Smartphone',
  ),
  SubCategoryModel(
    id:15,
    name: 'Telévision',
  ),
  SubCategoryModel(
    id:16,
    name: 'Autre',
  ),



];

List<SubCategoryModel> vehiculeSubCategories = [ 
  SubCategoryModel(
    id: 21,
    name: 'Voiture',
  ),
  SubCategoryModel(
    id:22,
    name: 'Moto',
  ),
  SubCategoryModel(
    id:23,
    name: 'Vélo',
  ),
  SubCategoryModel(
    id:24,
    name: 'Autre',
  ),

 ];
