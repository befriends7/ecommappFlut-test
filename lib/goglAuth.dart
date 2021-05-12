

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

String _verificationId;

class goglAuth
{

  FirebaseAuth auth;
  User user;
  bool  isUserSignedIn;
  BuildContext context;





  Future<User> emailAuth() async
  {


    GoogleSignIn _googleSignIn = GoogleSignIn();
    FirebaseAuth _auth;

    FirebaseApp defaultApp = await Firebase.initializeApp();
    _auth = FirebaseAuth.instanceFor(app: defaultApp);




    bool isSignedIn = await _googleSignIn.isSignedIn();

    if (isSignedIn) {
      // if so, return the current user
      user = await _auth.currentUser;



    }


    else {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser
          .authentication;
      final AuthCredential credential =
      GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken
      );

      user = (await _auth.signInWithCredential(credential)).user;
      var userSignedIn = await _googleSignIn.isSignedIn();

      if (userSignedIn != null) {
        isUserSignedIn = userSignedIn;
      }
    }
    return user;

  }

  Future<bool> logOut() async
  {

    bool status = false;
    await FirebaseAuth.instance.signOut();
    status = true;

    return status;
  }


  Future<User> phoneAuth(String num)  async {


    FirebaseAuth _auth;
    FirebaseApp defaultApp = await Firebase.initializeApp();
    _auth = FirebaseAuth.instanceFor(app: defaultApp);


    try {

      await _auth.verifyPhoneNumber(
          phoneNumber: num,
          timeout: const Duration(seconds: 5),
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);


    } catch (e) {

      print('Error');

    }

    user = _auth.currentUser;

    return user;

  }



  PhoneVerificationCompleted verificationCompleted =
      (PhoneAuthCredential phoneAuthCredential) async {
    await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);

  };




  PhoneVerificationFailed verificationFailed =
      (FirebaseAuthException authException) {
    print('Verification failed');
  };


  PhoneCodeSent codeSent =
      (String verificationId, [int forceResendingToken]) async {
    print('Check sms');

    _verificationId = verificationId;


  };


    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      verificationId = verificationId;
    };




  Future<User> signInWithPhoneNumber(String smstext) async {

    FirebaseAuth _auth;
    FirebaseApp defaultApp = await Firebase.initializeApp();
    _auth = FirebaseAuth.instanceFor(app: defaultApp);


    User user;

    try {
      final AuthCredential credential = PhoneAuthProvider.credential(

          verificationId: _verificationId,

         smsCode: smstext,
      );

       user = (await  _auth.signInWithCredential(credential)).user;

    } catch (e) {

      print('Error in sms code');

    }

    return user;

  }


}