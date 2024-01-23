import 'package:flutter/material.dart';
class Categories{
  final String img;
  final String productsimg;
  final String desc;
  final String descri;
  Categories(this.img,this.productsimg,this.desc,this.descri);
}
List <Categories> categorieslist = [
  // Categories('assets/images/category.png','Category'),
  Categories('assets/images/food.png','assets/images/food.png','Foods','8g Carbs'),
  Categories('assets/images/cocktail.png','assets/images/cocktail.png','Drinks','10g Carbs'),
  Categories('assets/images/fruits.png','assets/images/fruits.png','Fruits','28g Carbs'),
  Categories('assets/images/vegetable.png','assets/images/vegetable.png','Vegetables','18g Carbs'),
  Categories('assets/images/nuts.png','assets/images/nuts.png','Snacks','14g Carbs'),

];