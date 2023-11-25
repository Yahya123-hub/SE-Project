import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class profileController extends GetxController{
  var profile_path = ''.obs;
  var profileImageLink = '';
  var isLoading = false.obs;

  var nameController = TextEditingController();
  var oldpassController = TextEditingController();
  var newpassController = TextEditingController();

  changeImage(context) async {
    try{
      final img = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 70);
      if(img ==null) return;
      profile_path.value = img.path;
    } on PlatformException catch (e){
      VxToast.show(context, msg: e.toString());
    }
  }

  uploadDP()async{
    var filename = basename(profile_path.value);
    var destination = 'images/${currentUser!.uid}/$filename';
    Reference ref = FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(profile_path.value));
    profileImageLink = await ref.getDownloadURL();
  }

  updateProfile({name,password,imgUrl}) async{
    var store = firestore.collection(usersCollection).doc(currentUser!.uid);
    await store.set({
      'name':name,
      'password':password,
      'imageUrl':imgUrl
    },SetOptions(merge: true)

    );
    isLoading(false);
  }

  changePasswordInAuth({email,pwd,newPwd})async{
    final credentials = EmailAuthProvider.credential(email: email, password: pwd);

    await currentUser!.reauthenticateWithCredential(credentials).then((value) {
      currentUser!.updatePassword(newPwd);
    }).catchError((error){
      print(error.toString());
    });
  }

}