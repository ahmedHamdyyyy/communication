import 'package:cloud_firestore/cloud_firestore.dart';
class HomeRepository {
  final fireStorePostCollection =
      FirebaseFirestore.instance.collection('posts');
/*
  Future<void> putLikeOnThisPost({required String postId, required String userId}) async {
    final postDoc = fireStorePostCollection.doc(postId);
    final postSnapshot = await postDoc.get();

    if (postSnapshot.exists) {
      final postModel = PostModel.fromMap(postSnapshot.data() as Map<String, dynamic>);
      final updatedLikes = [...postModel.likes, userId];

      await postDoc.update({
        'likes': updatedLikes,
      });
    }
  }

  Future<void> removeTheLikeOnThisPost({required String postId, required String userId}) async {
    final postDoc = fireStorePostCollection.doc(postId);
    final postSnapshot = await postDoc.get();

    if (postSnapshot.exists) {
      final postModel = PostModel.fromMap(postSnapshot.data() as Map<String, dynamic>);
      final updatedLikes = List<String>.from(postModel.likes)..remove(userId);

      await postDoc.update({
        'likes': updatedLikes,
      });
    }
  }
*/

 Future<void> putLikeOnThisPost({required String postId, required String userId}) async {
    await fireStorePostCollection.doc(postId).update({
      'likes': FieldValue.arrayUnion([userId])
    });
  }

  removeTheLikeOnThisPost(
      {required String postId, required String userId}) async {
    await fireStorePostCollection.doc(postId).update({
      'likes': FieldValue.arrayRemove([userId])
    });
  }
}
