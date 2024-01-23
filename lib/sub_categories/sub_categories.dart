class SubCatagories {
  final String id;
  final String pdname;
  final String img;
  final String desc;
  final String kcal;
  final String carbs;
  final String protein;
  final String fat;
  SubCatagories(this.id, this.pdname, this.img, this.desc, this.kcal,
      this.carbs, this.fat, this.protein);
}

class FruitCat {
  final String id;
  final String pdname;
  final String img;
  final String desc;
  final String kcal;
  final String carbs;
  final String protein;
  final String fat;
  FruitCat(this.id, this.pdname, this.img, this.desc, this.kcal, this.carbs,
      this.fat, this.protein);
}

class DrinkCat {
  final String id;
  final String pdname;
  final String img;
  final String desc;
  final String kcal;
  final String carbs;
  final String protein;
  final String fat;
  DrinkCat(this.id, this.pdname, this.img, this.desc, this.kcal, this.carbs,
      this.fat, this.protein);
}

class SnackCat {
  final String id;
  final String pdname;
  final String img;
  final String desc;
  final String kcal;
  final String carbs;
  final String protein;
  final String fat;
  SnackCat(this.id, this.pdname, this.img, this.desc, this.kcal, this.carbs,
      this.fat, this.protein);
}

class VegetableCat {
  final String id;
  final String pdname;
  final String img;
  final String desc;
  final String kcal;
  final String carbs;
  final String protein;
  final String fat;
  VegetableCat(this.id, this.pdname, this.img, this.desc, this.kcal, this.carbs,
      this.fat, this.protein);
}

List<SubCatagories> subcategories = [
  SubCatagories(
      '1',
      'Fruits Oat Bow\l',
      'assets/images/Green_Smoothie.jpeg',
      'Add the spinach, almond milk, chia seeds, banana and avocado to the pitcher  of a blender and blend. Depending on the power of the appliance, you may need to stop it, stir the ingredients and then continue blending. If the consistency is too thin, blend in some ice cubes. Transfer to a bowl, add toppings, and enjoy with a spoon!',
      "119 Kcals",
      "27.7g carbs",
      "12g fats",
      "20g proteins"),
  SubCatagories(
      '2',
      'Strawberry Oat Smoothie ',
      'assets/images/smoothie.jpg',
      'This smoothie is just loaded with vitamins and minerals. You’ll get a whole day’s worth of vitamin C in just one smoothie, plus lots of calcium, magnesium, folate, and vitamin A.2',
      "280 kcals",
      "51g carbs",
      "12g fats",
      "13g proteins"),
  SubCatagories('3', 'Apple Juice', "assets/images/apple_juice.jpg", "desc",
      "114 kcal", "28g carbs", "0.2g fat", "0.3g protein"),
  SubCatagories(
      '4',
      'Banana Smoothie ',
      'assets/images/banana.jpg',
      'This smoothie is just loaded with vitamins and minerals. You’ll get a whole day’s worth of vitamin C in just one smoothie, plus lots of calcium, magnesium, folate, and vitamin A.2',
      "280 kcals",
      "51g carbs",
      "2g fats",
      "13g proteins"),
  SubCatagories('5', 'Walnuts', "assets/images/walnuts.png", "desc", "654 kcal",
      "13.7g carbs", "65.2g fat", "15.2g protein"),
  SubCatagories('6', 'Hemp Seeds', "assets/images/hump_seeds.png", "desc",
      "553 kcal", "15.2g carbs", "49g fat", "30.2g protein"),
  SubCatagories('7', 'Cherry', 'assets/images/cherry.png', 'desc', "50 kcals",
      "12.2g carbs", "0.3g fats", "1g proteins"),
  SubCatagories('8', 'Green Beans', "assets/images/green_beans.png", "desc",
      "31 kcal", "7.1g carbs", "0.2 g fat", "1.8 g protein"),
  SubCatagories('9', 'Cranberry Juice ', "assets/images/cranberry_juice.jpg",
      "desc", "45 kcal", "12g carbs", "0.4g fat", "0.1g protein"),
  SubCatagories('10', 'Chia seeds', "assets/images/chia_seeds.png", "desc",
      "486 kcal", "42.1g carbs", "30.7g fat", "16.5g protein"),
];
List<FruitCat> fruitcat = [
  FruitCat('3', 'Watermelon', 'assets/images/watermelon.png', 'desc',
      "30 kcal ", "8g carbs", "0.2g fats", "0.6g proteins"),
  FruitCat('4', 'Pineapple', "assets/images/pineapple.png", 'desc', "50 kcals",
      "13g carbs", "0.1g fat", "0.6g protein"),
  FruitCat('5', 'Blueberries', 'assets/images/Blueberries.png', 'desc',
      "57 kcals", "14g carbs", "0.3g fats", "0.7g proteins"),
  FruitCat('6', 'Raspberry', 'assets/images/raspberry.png', 'desc', "52 kcals",
      "11.9g carbs", "0.7g fats", "1.2g proteins"),
  FruitCat('7', 'Blackberries', 'assets/images/Blackberries.png', 'desc',
      "43 kcals", "9.7g carbs", "0.5g fats", "1.4g proteins"),
  FruitCat('8', 'Kiwi', 'assets/images/kiwi.png', 'desc', "61 kcals",
      "14.6g carbs", "0.5g fats", "1.1g proteins"),
  FruitCat('9', 'Orange', 'assets/images/orange.png', 'desc', "43 kcals",
      "8.3g carbs", "0.3g fats", "1g proteins"),
  FruitCat('10', 'Cherry', 'assets/images/cherry.png', 'desc', "50 kcals",
      "12.2g carbs", "0.3g fats", "1g proteins"),
];

List<DrinkCat> drinkcat = [
  DrinkCat('1', 'Watermelon Juice', "assets/images/watermelon_juice.jpg",
      "desc", "kcal", "carbs", "fat", "protein"),
  DrinkCat('2', 'Orange Juice', "assets/images/orange_juice.jpg", "desc",
      "kcal", "carbs", "fat", "protein"),
  DrinkCat('3', 'Apple Juice', "assets/images/apple_juice.jpg", "desc",
      "114 kcal", "28g carbs", "0.2g fat", "0.3g protein"),
  DrinkCat('4', 'Carrot Juice', "assets/images/carrot_juice.jpg", "desc",
      "94 kcal", "22g carbs", "0.5g fat", "2.2g protein"),
  DrinkCat('5', 'Pomegranate Juice', "assets/images/pomegranate _juice.jpg",
      "desc", "134 kcal", "32g carbs", "1g fat", "2g protein"),
  DrinkCat('6', 'Grapefruit Juice', "assets/images/grapefruit_juice.jpg",
      "desc", "96 kcal", "23g carbs", "0.4g fat", "1.7g protein"),
  DrinkCat('7', 'Cranberry Juice ', "assets/images/cranberry_juice.jpg", "desc",
      "45 kcal", "12g carbs", "0.4g fat", "0.1g protein"),
  DrinkCat('8', 'Pineapple Juice', "assets/images/pineapple_juice.jpg", "desc",
      "132g kcal", "33g carbs", "0.3g fat", "0.9g protein"),
  DrinkCat(
      '9',
      'Kale and Green Apple Juice ',
      "assets/images/kale_green_apple_juice.jpg",
      "desc",
      "50 kcal",
      "12g carbs",
      "0.5g fat",
      "2g protein"),
  DrinkCat('10', 'Tomato Juice ', "assets/images/tomato_juice.jpg", "desc",
      "41 kcal", "10g carbs", "0.4g fat", "2g protein"),
];
List<SnackCat> snackcat = [
  SnackCat('1', 'Walnuts', "assets/images/walnuts.png", "desc", "654 kcal",
      "13.7g carbs", "65.2g fat", "15.2g protein"),
  SnackCat('2', 'Almonds', "assets/images/almonds.png", "desc", "579 kcal",
      "21.7g carbs", "65.2g fat", "15.2g protein"),
  SnackCat('3', 'Peanuts', "assets/images/Peanuts.png", "desc", "567 kcal",
      "21.7g carbs", "49.2g fat", "25.8g protein"),
  SnackCat('4', 'Cashews', "assets/images/Cashews.png", "desc", "553 kcal",
      "44.6g carbs", "44.6fat", "18.2g protein"),
  SnackCat('5', 'Hazelnuts', "assets/images/Hazelnuts.png", "desc", "628 kcal",
      "16.7g carbs", "60.8g fat", "15g protein"),
  SnackCat('6', 'Sunflower seeds', "assets/images/sunflower_seeds.png", "desc",
      "584 kcal", "20g carbs", "51.5g fat", "20.8g protein"),
  SnackCat('7', 'Chia seeds', "assets/images/chia_seeds.png", "desc",
      "486 kcal", "42.1g carbs", "30.7g fat", "16.5g protein"),
  SnackCat('8', 'Sesame seeds', "assets/images/sesame_seeds.png", "desc",
      "573 kcal", "23.4g carbs", "49.7g fat", "17.7g protein"),
  SnackCat('9', 'Pumpkin Seeds', "assets/images/pumpkin_seeds.png", "desc",
      "574 kcal", "15.2g carbs", "49g fat", "30.2g protein"),
  SnackCat('10', 'Hemp Seeds', "assets/images/hump_seeds.png", "desc",
      "553 kcal", "15.2g carbs", "49g fat", "30.2g protein"),
];
List<VegetableCat> vegetablecat = [
  VegetableCat('1', 'Carrot', "assets/images/carrot.png", "desc", "41 kcal",
      "10g carbs", "0.2g fat", "0.9g protein"),
  VegetableCat('2', 'Broccoli', "assets/images/Broccoli.png", "desc", "55 kcal",
      "11g carbs", "0.6g fat", "3.7g protein"),
  VegetableCat('3', 'Spinach', "assets/images/Spinach.png", "desc", "23 kcal",
      "3.6g carbs", "0.4g fat", "2.9g protein"),
  VegetableCat('4', 'Bell pepper', "assets/images/bell_pepper.png", "desc",
      "31 kcal", "6g carbs", "0.4g fat", "1g protein"),
  VegetableCat('5', 'Cucumber', "assets/images/Cucumber.png", "desc", "16 kcal",
      "3.6g carbs", "0.1g fat", "0.6g protein"),
  VegetableCat('6', 'Tomato', "assets/images/Tomatoes.png", "desc", "18 kcal",
      "3.9g carbs", "0.1g fat", "0.9g protein"),
  VegetableCat('7', 'Green Beans', "assets/images/green_beans.png", "desc",
      "31 kcal", "7.1g carbs", "0.2 g fat", "1.8 g protein"),
  VegetableCat('8', 'Kale', "assets/images/Kale.png", "desc", "49 kcal",
      "8.8g carbs", "0.9g fat", "4.3g protein"),
  VegetableCat('9', 'Eggplant', "assets/images/egg_plant.png", "desc", "25kcal",
      "6g carbs", "0.2g fat", "1g protein"),
  VegetableCat('10', 'Cabbage', "assets/images/Cabbage.png", "desc", "25kcal",
      "5.8g carbs", "0.1g fat", "1.3g protein"),
];
