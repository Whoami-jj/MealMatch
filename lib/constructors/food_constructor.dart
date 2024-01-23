class Food
{
  final String id;
  final String pdname;
  final String img;
  final String desc;
  final String kcal;
  final String carbs;
  final String protein;
  final String fat;
  Food(this.id,this.pdname, this.img, this.desc, this.kcal, this.carbs, this.fat,
      this.protein);
}
List<Food> foodcat = [
  Food(
      '1',
      'Green_Smoothie',
      'assets/images/Green_Smoothie.jpeg',
      'Add the spinach, almond milk, chia seeds, banana and avocado to the pitcher  of a blender and blend. Depending on the power of the appliance, you may need to stop it, stir the ingredients and then continue blending. If the consistency is too thin, blend in some ice cubes. Transfer to a bowl, add toppings, and enjoy with a spoon!',
      "119 Kcals",
      "27.7g carbs",
      "12.3g fats",
      "20.0g proteins"),
  Food('2',
      'Strawberry Oat Smoothie',
      'assets/images/smoothie.jpg',

      'This smoothie is just loaded with vitamins and minerals. You’ll get a whole day’s worth of vitamin C in just one smoothie, plus lots of calcium, magnesium, folate, and vitamin A.2',

      "280 kcal", "51g carbs", "2g fats","13g proteins"),
  Food('3',
      'pdname',
      'assets/images/cocktail.png',

      'desc',

      "kcal", "carbs", "fats", "proteins"),
  Food('4',
      'pdname',
      'assets/images/vegetable.png',

      'desc',

      "kcals", "carbs", "fats", "proteins"),
  Food(
      '5',
      'pdname',
      'assets/images/nuts.png',

      'desc',

      "kcals", "carbs", "fats", "proteins"),
];
