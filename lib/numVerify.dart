

import 'package:ecommapp/homeModel.dart';
import 'package:ecommapp/homePage.dart';
import 'package:ecommapp/setupLocate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

final myController = TextEditingController();
final myControllersms = TextEditingController();

class numVerify extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _numVerify();
  }

}

class _numVerify extends State<numVerify>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(


      home: ScopedModel<homeModel>(

        model:locator<homeModel>(),

          child:ScopedModelDescendant<homeModel>(
              builder:(contxt,child,model)=>Scaffold(

                appBar: AppBar(backgroundColor: Colors.white,title: Text('Verify Number',style: TextStyle(color:Colors.black),),),

                body: Container(

                  width: double.infinity,
                  height: double.infinity,

                  child: Column(


                    children: [


                      SizedBox(

                        height: 40,

                      ),

                      Container(

                        padding: EdgeInsets.only(left: 14,right: 14),

                        width: double.infinity,

                        child: TextField(

                          controller: myController,

                          decoration: InputDecoration(

                            hintText: 'Enter Phone Number'

                          ),

                        ),

                      ),


                      SizedBox(height: 15,),

                      Container(


                        padding: EdgeInsets.only(left: 14,right: 14),

                        width: double.infinity,


                        child: RaisedButton(

                          color: Colors.pink,
                          onPressed: () async
                          {

                            User user = await model.gogleAuth.phoneAuth(myController.text);

                            if(user!=null)
                            {
                              Navigator.of(contxt).push(MaterialPageRoute(builder: (context) => homePage(name: user.phoneNumber,id: user.uid)));
                            }

                          },

                          child: Text('Verify Number',style: TextStyle(color: Colors.white),),

                        ),

                      ),


                      SizedBox(height: 20,),

                      Container(


                        padding: EdgeInsets.only(left: 14,right: 14),



                        width: double.infinity,

                        child: TextField(

                          decoration: InputDecoration(

                            hintText: 'SMS Code'

                          ),

                          controller: myControllersms,

                        ),

                      ),


                      SizedBox(

                        height: 15,

                      ),

                      Container(

                        decoration: BoxDecoration(),

                        padding: EdgeInsets.only(left: 14,right: 14),


                        width: double.infinity,


                        child: RaisedButton(

                          color: Colors.pink,

                          onPressed: () async
                          {


                            User user =  await model.gogleAuth.signInWithPhoneNumber(myControllersms.text);

                            if(user!=null)
                              {
                                Navigator.of(contxt).push(MaterialPageRoute(builder: (context) => homePage(name: user.phoneNumber,id: user.uid)));
                              }


                          },

                          child: Text('Sign In',style: TextStyle(color: Colors.white),),

                        ),

                      )

                    ],

                  ),


                )

              )


          )

      ),

    );
  }




}