class ProductModel
{
  final String id;
  final String pdname;
  final String img;
  final String kcal;
  final  String carbs;
  final String protein;
  final String fat;
  final String desc;
  ProductModel({
    required this.id,
    required this.pdname,
    required this.img,
    required this.kcal,
    required this.carbs,
    required this.protein,
    required this.fat,
    required this.desc,
});
  toJson(){
    return {
      'id': id,
      "pdname": pdname,
      "kcal": kcal,
      "carbs": carbs,
      "protein": protein,
      "fat": fat,
      "desc": desc,
      "img": img,
    };
  }
}