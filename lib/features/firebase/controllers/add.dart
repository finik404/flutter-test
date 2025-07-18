import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tproject/features/firebase/controllers/home.dart';
import 'package:tproject/features/firebase/models/post.dart';
import 'package:tproject/util/exports.dart';
import 'package:tproject/util/helpers/external.dart';

class FirebaseAddPostController extends GetxController {
  static FirebaseAddPostController get instance => Get.find();

  // # --------------- Props --------------- #

  FirebaseAddPostController({this.post});

  final PostModel? post;

  // # --------------- onReady --------------- #

  @override
  void onReady() {
    super.onReady();
    if (post != null) {
      nameInput.text = post!.name;
    }
  }

  // # --------------- Variables --------------- #

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameInput = TextEditingController();
  final Rxn<XFile> image = Rxn();

  // # --------------- Methods --------------- #

  // add ---------------
  Future<void> add() async {
    // Validate form
    if (!formKey.currentState!.validate()) return;

    try {
      // Add image
      final fileName = DateTime.now().microsecondsSinceEpoch.toString();
      final ref = FirebaseStorage.instance.ref().child('posts/images/$fileName.jpg');
      await ref.putFile(File(image.value!.path));
      final imageUrl = await ref.getDownloadURL();

      await FirebaseFirestore.instance.collection('posts').add({
        'name': nameInput.text,
        'imageUrl': imageUrl,
        'userId': FirebaseAuth.instance.currentUser!.uid,
      });

      FirebaseHomeController.instance.getPosts();

      Navigator.pop(Get.context!);
    } catch (e) {
      print('Ошибка: $e');
    }
  }

  // edit ---------------
  Future<void> edit() async {
    // Validate form
    if (!formKey.currentState!.validate()) return;

    try {
      await FirebaseFirestore.instance.collection('posts').doc(post!.id).update({
        'name': nameInput.text,
      });

      FirebaseHomeController.instance.getPosts();

      Navigator.pop(Get.context!);
    } catch (e) {
      print('Ошибка: $e');
    }
  }

  // selectImage ---------------
  Future<void> selectImage() async {
    final pickedImage = await TExternal.pickImageFromGallery();
    image.value = pickedImage;
  }
}
