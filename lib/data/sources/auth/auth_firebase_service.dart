
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart';

abstract class AuthFirebaseService{
  Future<Either> signup( CreateUserReq createUserReq);
  Future<Either> signin( SigninUserReq signinUserReq);
}

class AuthFirebaseServiceImp extends AuthFirebaseService{
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
  try{
      await
      
       FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinUserReq.email,
         password: signinUserReq.password,
         );
          return const Right('Signin was Successful');

    }
    
    
    on FirebaseAuthException catch(e){
String message = '';

if(e.code == 'invalid -email'){
  message = 'Not user found for the email';
} else if (e.code == 'invaild - credential'){
  message = 'Wrong password provided for user ';
}

return Left(message);
    }
   
  }

  @override
  Future<Either> signup( CreateUserReq createUserReq) async{
    try{


      var data = await  FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
         password: createUserReq.password,
         );

         FirebaseFirestore.instance.collection('User').add(
          {
             'name' : createUserReq.fullName,
             'email' : data.user?.email,

          }
         );
          return const Right('Signup was Successful');

    }
    
    
    on FirebaseAuthException catch(e){
String message = '';

if(e.code == 'weak-passwword'){
  message = 'the password provided is too weak ';
} else if (e.code == 'email - already- in -use'){
  message = 'An account already exists with that email.';
}

return Left(message);
    } 
    
  }
}