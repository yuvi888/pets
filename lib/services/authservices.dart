

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:io';

import 'package:pets/common/constant.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Sign up with email and password and store additional data
  Future<User?> signUp({
    required BuildContext context,
    required String email,
    required String password,
    required String username,
    required String name,
    required String location,
    required File? image,
  }) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      // Store image in Firebase Storage
      String? imageUrl;
      if (image != null) {
        final ref = _storage.ref().child('user_images').child(user!.uid + '.jpg');
        await ref.putFile(image);
        imageUrl = await ref.getDownloadURL();
      }

      // Store additional data in Firestore
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'username': username,
          'name': name,
          'location': location,
          'imageUrl': imageUrl,
        });
      }

      return user;
    } on FirebaseAuthException catch (e) {
      showCustomAlertDialog(context ,e.toString());
      return null;
      
    } 
    
  }


   Future<User?> signIn({
     required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (e) {
      showCustomAlertDialog(context as BuildContext,e.toString());
      return null;
    }
  }
}