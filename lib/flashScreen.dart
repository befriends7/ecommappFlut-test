

import 'package:ecommapp/homeModel.dart';
import 'package:ecommapp/menu_List_model.dart';
import 'package:ecommapp/numVerify.dart';
import 'package:ecommapp/setupLocate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'homePage.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

class flashScreen extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _flashScreen();
  }

}

class _flashScreen extends State<flashScreen>
{



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModel<homeModel>(
        model: locator<homeModel>(),

        child: ScopedModelDescendant<homeModel>(

       builder: (contxt,child,model) => MaterialApp(



           home: Builder(
             builder:(contxt)=> Scaffold(

                  body: Column(



                    children: [


                      SizedBox(

                        height: 150,

                      ),

                      Center(

                        child: Container(

                      width: 200,
                      height: 190,
                      child: Image.asset('assets/fireb.png')),


             ),

                      SizedBox(

                        height: 90,

                      ),

                      Container(

                        width: double.infinity,
                        height: 50,

                        padding: EdgeInsets.only(left: 60,right: 60),

                        child: RaisedButton(

                          color: Colors.blue,

                          shape: RoundedRectangleBorder(

                            borderRadius: BorderRadius.circular(28)

                          ),


                            onPressed: () async
                            {

                              User user = await model.authemail();
                              final uid = user.uid;

                              if(user!=null ) {

                                Navigator.of(contxt).push(MaterialPageRoute(builder: (context) => homePage(name: user.displayName,id: uid)));
                              }
                            },

                          child: Row(


                            children: [

                            Container(

                              width: 30,
                              height: 30,

                              decoration: BoxDecoration(

                                shape: BoxShape.circle,
                                image:DecorationImage(image:AssetImage('assets/gogl.jpeg'))

                              ),
                            ),

                              SizedBox(

                                width: 40,

                              ),

                              Text('Google',style: TextStyle(color: Colors.white,fontSize: 22),)

                            ],

                          ),

                        ),

                      ),


                      SizedBox(

                        height: 20,

                      ),

                      Container(

                        width: double.infinity,
                        height: 50,

                        padding: EdgeInsets.only(left: 60,right: 60),



                        child: RaisedButton(



                          shape: RoundedRectangleBorder(

                              borderRadius: BorderRadius.circular(28)

                          ),


                          onPressed: ()
                          {

                            Navigator.of(contxt).push(MaterialPageRoute(builder: (context) => numVerify()));


                          },

                          padding: const EdgeInsets.all(0.0),


                          child: Container(

                            width: double.infinity,
                            height: double.infinity,

                            decoration: BoxDecoration(

                              gradient: LinearGradient(
                                colors: <Color>[

                                  Color(0xFF54e346),

                                  Color(0xFF16c79a)

                                ],
                              ),

                                borderRadius: BorderRadius.all(Radius.circular(28.0))

                            ),



                            child: Row(

                           children: [


                             SizedBox(

                               width: 18,

                             ),

                             Container(

                               width: 30,
                               height: 30,


                               decoration: BoxDecoration(

                                    color: Colors.green,
                                   shape: BoxShape.circle,
                                   image:DecorationImage(image:AssetImage('assets/phone.jpeg'))

                               ),
                             ),

                             SizedBox(

                               width: 40,

                             ),

                             Text('Phone',style: TextStyle(color: Colors.white,fontSize: 22),)


                           ],


                          ),

                        ),

                      ),



),
                    ],

                  ),

         ),
           ),
       ),

        ),
    );
  }


}