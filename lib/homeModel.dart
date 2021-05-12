
import 'package:ecommapp/cartLoad.dart';
import 'package:ecommapp/dataLoad.dart';
import 'package:ecommapp/flashScreen.dart';
import 'package:ecommapp/goglAuth.dart';
import 'package:ecommapp/homePage.dart';
import 'package:ecommapp/menu_List_model.dart';
import 'package:ecommapp/orderDetails.dart';
import 'package:ecommapp/setupLocate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class homeModel extends Model
{
  List<orderDetails> lstFin = new List();

  goglAuth gogleAuth = locator<goglAuth>();
  dataLoad datalod = locator<dataLoad>();
  cartLoad crtLoad = locator<cartLoad>();


  Future<User> authemail() async {
    User user = await gogleAuth.emailAuth();
    return user;

  }

  Future<List<menu_List_model>> data() async{

    List<menu_List_model> lstModel = await datalod.dataLod();
    return lstModel;

  }

 void orderDet(String itemName, String price,String numItem, String calItem )
  {


    orderDetails ordDetail = new orderDetails(itemName, price, numItem, calItem);
    lstFin.add(ordDetail);
    crtLoad.cartload(lstFin);


  }



}