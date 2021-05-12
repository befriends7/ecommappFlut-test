

import 'package:ecommapp/cat_Dish_model.dart';

class menu_List_model
{
   String _menu_Category;
   cat_Dish_model _category_Dishes;

   menu_List_model(this._menu_Category, this._category_Dishes);

   cat_Dish_model get category_Dishes => _category_Dishes;

  set category_Dishes(cat_Dish_model value) {
    _category_Dishes = value;
  }

  String get menu_Category => _menu_Category;

  set menu_Category(String value) {
    _menu_Category = value;
  }
}