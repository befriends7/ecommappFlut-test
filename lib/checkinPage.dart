

import 'package:ecommapp/homeModel.dart';
import 'package:ecommapp/homePage.dart';
import 'package:ecommapp/setupLocate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:toast/toast.dart';

class checkinPage extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _checkinPage();
  }

}


class _checkinPage extends State<checkinPage>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(


      home: ScopedModel<homeModel>(

        model: locator<homeModel>(),

        child: ScopedModelDescendant<homeModel>(

          builder: (context,child,model)=>Scaffold(


            appBar: AppBar(backgroundColor:Colors.white,title: Text('Order Summary',style: TextStyle(color: Colors.grey),),

            leading: IconButton(icon:Icon(Icons.arrow_back,color: Colors.grey,), onPressed: ()async {


              User user = await model.authemail();
              final uid = user.uid;

              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>homePage(name: user.displayName,id: uid)));


            }),

            ),


            floatingActionButton: (

            FloatingActionButton.extended(
                backgroundColor: Color(0xFF1e6f5c),
                icon:Icon(Icons.shopping_cart,color: Colors.white,),
                onPressed: () async{

                  User user = await model.authemail();
                  final uid = user.uid;

                  model.crtLoad.lst.clear();

                  Toast.show('Order Successfully Placed', context);

                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>homePage(name: user.displayName,id: uid)));



                }, label: Text('Place Order',style: TextStyle(color: Colors.white),))

            ),

            body: Container(

              padding: EdgeInsets.fromLTRB(20, 10, 20, 5),

              width: double.infinity,
              height: double.infinity,

              child: ListView.builder(

                  itemCount: model.crtLoad.lst.length,

                  itemBuilder: (contxt,index){

                    var finVal = model.crtLoad.lst[index];

                    return Card(
                      child: Container(

                       padding: EdgeInsets.fromLTRB(10, 40, 5, 2),

                        width: double.infinity,
                        height: 200,

                        child: Column(

                          children: [

                            Container(

                              width: double.infinity,

                              alignment: Alignment.topLeft,

                              child: Row(

                                children: [

                                  Container(

                                      width: 100,
                                      child: Text(finVal.itemName,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))),


                                  SizedBox(

                                    width: 1,

                                  ),

                                  Container(

                                    width:114,
                                    height: 40,

                                    decoration: BoxDecoration(

                                      color: Color(0xFF1e6f5c),
                                        borderRadius: BorderRadius.all(Radius.circular(20))

                                      ),


                                    child: Row(

                                      children: [


                                        IconButton(icon:Icon(Icons.remove,color: Colors.white,), onPressed: (){


                                          Toast.show("clicked minus", context);

                                        }),

                                        Text(finVal.numItems,style: TextStyle(color: Colors.white),),


                                        IconButton(icon:Icon(Icons.add,color: Colors.white,), onPressed: (){

                                          Toast.show("clicked plus", context);

                                        }),


                                      ],


                                    ),

                                  ),

                                  SizedBox(

                                    width: 10,

                                  ),

                                  Text('INR'+" "+finVal.price,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),

                                ],

                              )


                            ),

                            SizedBox(

                              height: 20,

                            ),

                            Container(

                              width: double.infinity,

                              alignment: Alignment.topLeft,

                              child: Text('INR'+" "+finVal.price,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),

                            ),

                            SizedBox(

                              height: 10,

                            ),

                            Container(

                              width: double.infinity,

                              alignment: Alignment.topLeft,

                              child: Text(finVal.calItems+" "+"calories",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),

                            )



                          ],

                        )

                      ),
                    );


              }),

            ),


          ),

        ),

      ),


    );
  }

}