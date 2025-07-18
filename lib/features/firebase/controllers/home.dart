import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tproject/features/firebase/models/post.dart';
import 'package:tproject/util/exports.dart';

class FirebaseHomeController extends GetxController {
  static FirebaseHomeController get instance => Get.find();

  // # --------------- Variables --------------- #

  final Rxn<User> user = Rxn();
  final RxList<PostModel> posts = RxList([]);

  // # --------------- Methods --------------- #

  // # --------------- onReady --------------- #

  @override
  void onReady() {
    super.onReady();
    getUser();
    getPosts();
  }

  // register ---------------
  Future<void> getUser() async {
    user.value = FirebaseAuth.instance.currentUser;
  }

  // loginWithGoogle ---------------
  Future<void> loginWithGoogle() async {}

  // getPosts ---------------
  Future<void> getPosts() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    final response = await FirebaseFirestore.instance.collection('posts').where('userId', isEqualTo: userId).get();
    posts.value = response.docs
        .map((doc) => PostModel.fromJson(doc.data(), doc.id))
        .toList();
  }

  // removePost ---------------
  Future<void> removePost(String id) async {
    await FirebaseFirestore.instance.collection('posts').doc(id).delete();
    getPosts();
  }
}
