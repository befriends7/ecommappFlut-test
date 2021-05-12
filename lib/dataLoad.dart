


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'cat_Dish_model.dart';
import 'menu_List_model.dart';

class dataLoad
{




  Future<List<menu_List_model>> dataLod() async
  {

    List<menu_List_model> modelLst = new List();
    List itmLst;
    final url = Uri.parse('https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad');
    var response = await http.get(url);

    if(response.statusCode==200)
    {

      var jsonResponse = jsonDecode(response.body);
      List item = jsonResponse[0]['table_menu_list'];


      for(int i=0;i<item.length;i++)
      {

        itmLst = item[i]['category_dishes'];

        for(int j=0;j<itmLst.length;j++)
        {

          var catLst = itmLst[j];

          cat_Dish_model model = new cat_Dish_model(catLst['dish_name'], catLst['dish_price'].toString(), catLst['dish_image'], catLst['dish_currency'], catLst['dish_calories'].toString(), catLst['dish_description'],catLst['addonCat']);
          menu_List_model menuModel = menu_List_model(item[i]['menu_category'],model);
          modelLst.add(menuModel);
        }

      }
    }


    return modelLst;


  }

}