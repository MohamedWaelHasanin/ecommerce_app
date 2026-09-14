import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
abstract class AuthBase{
  User? get currentUser;
  Stream<User?> authStateChanges();
  Future<User?> loginWithEmailAndPassword(String email,String password);
  Future<User?> signUpWithEmailAndPassword(String email,String password);
  Future<void> logOut();
}
class Auth implements AuthBase{

  final _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<User?> loginWithEmailAndPassword(String email, String password) async {
    try{
      final userAuth = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return userAuth.user;
    }catch(e){
      debugPrint("SignIn Error: $e");
      rethrow;
    }
  }
  @override
  Future<User?> signUpWithEmailAndPassword(String email,String password) async{
    try {
      final userAuth = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return userAuth.user;
    }catch(e){
      debugPrint("SignUp Error: $e");
      rethrow;
    }
  }
  @override
  Future<void> logOut() async=>await _firebaseAuth.signOut();
  @override
  Stream<User?> authStateChanges()=>_firebaseAuth.authStateChanges();

  @override
  // TODO: implement currentUser
  User? get currentUser => throw UnimplementedError();

}