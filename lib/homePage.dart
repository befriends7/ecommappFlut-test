

import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommapp/cat_Dish_model.dart';
import 'package:ecommapp/checkinPage.dart';
import 'package:ecommapp/homeModel.dart';
import 'package:ecommapp/menu_List_model.dart';
import 'package:ecommapp/setupLocate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:user_profile_avatar/user_profile_avatar.dart';

import 'flashScreen.dart';


int finVal;

class homePage extends StatefulWidget
{


  final String name;
  String id;

  homePage({Key key, @required this.name,@required this.id}) : super(key: key);



  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _homePage(name,id);
  }

}

class _homePage extends State<homePage>
{

 List<Tab>  tabName=List();
 String name;
 String id;
 List<String> finTab= List();
 List<menu_List_model> chkList = List();
 List<cat_Dish_model> FinLsts = new List();


 _homePage(this.name,this.id);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(

      home: ScopedModel<homeModel>(

        model:locator<homeModel>(),

        child: ScopedModelDescendant<homeModel>(

          builder: (context,child,model)=> Container(

                width: double.infinity,
                height: double.infinity,

                color: Colors.white,

                child:FutureBuilder<List<menu_List_model>>(

                  future: model.data(),
                  builder: (context,snapshot){

                    if(snapshot.data!=null)
                      {

                        List tabList = snapshot.data;
                        chkList = snapshot.data;
                        String dupEnt= null;
                        tabName.clear();

                        for(var i=0;i<tabList.length;i++)
                        {
                            menu_List_model tabNme =  tabList[i];

                            if(tabNme.menu_Category!=dupEnt) {
                              tabName.add(Tab(text: tabNme.menu_Category));
                              dupEnt = tabNme.menu_Category;
                            }

                        }



                        return DefaultTabController(length: tabName.length,


                            child: Scaffold(
                              
                              
                              drawer: Drawer(



                                child: ListView(
                                  
                                  padding: EdgeInsets.zero,
                                  children: [

                                    DrawerHeader(

                                      child:Column(

                                          children: [

                                            Center(


                                              child: UserProfileAvatar(
                                                avatarUrl: 'https://cdn.pixabay.com/photo/2017/07/18/23/40/group-2517459_960_720.png',
                                                onAvatarTap: () {
                                                  print(name);
                                                },
                                                notificationCount: 10,
                                                notificationBubbleTextStyle: TextStyle(
                                                  fontSize: 30,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                avatarSplashColor: Colors.purple,
                                                radius: 35,
                                                isActivityIndicatorSmall: false,
                                                avatarBorderData: AvatarBorderData(
                                                  borderColor: Colors.white,
                                                  borderWidth: 5.0,
                                                ),
                                              ),

                                            ),

                                            SizedBox(height: 2),

                                            Center(

                                              child: Text(name,style: TextStyle(color: Colors.black,fontSize: 17),),

                                            ),


                                            SizedBox(height: 4),


                                            Center(

                                              child: Text("ID"+" : "+id,style: TextStyle(color: Colors.black,fontSize:12),),

                                            )

                                          ],


                                      ),

                                    decoration: BoxDecoration(

                                    gradient: LinearGradient(

                                    begin: Alignment.centerLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(0xFF16c79a),
                                    Color(0xFF54e346),
                                    ]

                                )

                                ),



                                      ),

                                    ListTile(


                                      title: Text('Log out',style: TextStyle(color: Colors.grey),),
                                      leading: Icon(Icons.add_to_home_screen),

                                      onTap: () async
                                      {


                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => flashScreen()),
                                            );


                                      },

                                    )

                                  ],
                                  
                                ),
                                
                              ),

                              appBar: AppBar(

                                backgroundColor: Colors.white,
                                iconTheme: IconThemeData(color: Colors.black),

                                actions: <Widget>[

                                  IconButton(icon: Icon(Icons.shopping_cart,color: Colors.grey,), onPressed:()


                                  {



                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>checkinPage()));

                                  })


                                ],

                                bottom: TabBar(

                                  indicatorColor: Colors.pink,
                                  labelColor: Colors.pink,
                                  unselectedLabelColor: Colors.grey,
                                  isScrollable: true,

                                  tabs: tabName,


                                ),

                              ),

                            body: TabBarView(


                              children:List<Widget>.generate(tabName.length, (int index){


                                return Container(

                                  width: double.infinity,
                                  height: double.infinity,

                                  child: dataCheck(index,snapshot,model),


                                );



                    }
                    )
                    )
                    )
                        );


                      }
                    else
                      {
                        return Center(

                          child: CircularProgressIndicator(

                            valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),

                          )

                        );

                      }

                  }

                )


              ),
          ),

          ),


    );
  }





  Widget dataCheck(int index,AsyncSnapshot snapshot,homeModel model)
  {

    List<cat_Dish_model> FinLst = new List();

    var i = 0 ;

    for(i=0;i<chkList.length;i++)
    {

      var modl = snapshot.data[i];

      if(modl.menu_Category=="Salads and Soup"&& index==0)
      {

        FinLst.add(modl.category_Dishes);


      }


      if(modl.menu_Category=="From The Barnyard"&& index==1)
      {

        FinLst.add(modl.category_Dishes);

      }

      if(modl.menu_Category=="From the Hen House"&& index==2)
      {

        FinLst.add(modl.category_Dishes);

      }

      if(modl.menu_Category=="Fresh From The Sea"&& index==3)
      {

        FinLst.add(modl.category_Dishes);

      }

      if(modl.menu_Category=="Biryani"&& index==4)
      {

        FinLst.add(modl.category_Dishes);

      }


      if(modl.menu_Category=="Fast Food"&& index==5)
      {


        FinLst.add(modl.category_Dishes);

      }

    }



    return ListView.builder(

        itemCount: FinLst.length,
        itemBuilder: (context,indx){

          var modl = FinLst[indx];

          return Container(

            width: double.infinity,
            height: 300,

            child: Card(

              child: Column(

                children: [

                  Container(

                    width: double.infinity,

                    child: Row(

                      children: [

                        SizedBox(width: 5,),

                        Container(

                          width: 200,

                            child: Text(modl.dish_name,style: TextStyle(color:Colors.black,fontSize: 15),)),

                        SizedBox(width: 50,),

                        Container(

                          width: 90,
                            height: 90,

                            child: CachedNetworkImage(fit: BoxFit.contain,
                              imageUrl: modl.dish_image,
                              placeholder: (context, url) => new CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Image.network('https://cdn.pixabay.com/photo/2015/05/04/10/16/vegetables-752153__340.jpg'),
                            ),



                        )
                      ],

                    ),
                  ),

                  Container(

                    width: double.infinity,

                    alignment: Alignment.topLeft,

                    child: Row(children: [
                      SizedBox(width: 5,),
                      Text('INR',style: TextStyle(color: Colors.black)),
                      SizedBox(width: 5,),
                      Text(modl.dish_price,style: TextStyle(color: Colors.black)),
                      SizedBox(width: 90,),
                      Text(modl.dish_calories+" "+"calories",style: TextStyle(color: Colors.black)),

                    ], ),

                  ),

                  SizedBox(height: 10),

                  Container(
                      width: double.infinity,
                      height: 30,

                      padding: EdgeInsets.only(right: 100),

                      alignment: Alignment.topLeft,

                      child: Text(modl.dish_description,style: TextStyle(fontSize: 14,color: Colors.grey),)),

                SizedBox(height:15,),


                 Container(

                   width:double.infinity,

                   padding: EdgeInsets.only(left: 5),

                   child: Align(

                     alignment: Alignment.topLeft,

                     child: Container(

                       width: 70,
                       height: 70,

                       child: GestureDetector(

                         onLongPress: ()
                         {

                           if(finVal!=0) {
                             model.orderDet(modl.dish_name, modl.dish_price,
                                 finVal.toString(), modl.dish_calories);

                           }
                         },

                         child: NumberInputWithIncrementDecrement(
                           controller: TextEditingController(),
                           min: 0,
                           max: 100,


                           onDecrement: (decVal){

                             finVal = decVal;

                           },


                           onIncrement: ( newlyIncrementedValue) {

                           finVal = newlyIncrementedValue;
                           },
                         ),
                       ),
                     ),
                   ),
                 ),


                  SizedBox(

                    height: 15,

                  ),

                  Container(

                    child: Row(

                      children: [

                        SizedBox(width: 5,),
                        modl.addonCat.isNotEmpty ? Text('Customization Available',style: TextStyle(color: Colors.red)) : Text(' ')

                      ],

                    ),

                  ),


                ],



              ),

            ),
          );



        });
    ;

  }





}


  
  
