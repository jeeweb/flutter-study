import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feel_log/features/post/models/post_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addPost(PostModel data) async {
    await _db.collection("posts").add(data.toJson());
  }

  Future<void> deletePost(postId) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection("posts")
          .where("postId", isEqualTo: postId) // ✅ Firestore에서 postId 기반으로 검색
          .get();

      if (querySnapshot.docs.isEmpty) {
        print("❌ Firestore에서 해당 postId를 가진 문서를 찾을 수 없음: $postId");
        return;
      }

      final docId = querySnapshot.docs.first.id;
      await FirebaseFirestore.instance.collection("posts").doc(docId).delete();
    } catch (e) {
      print("❌ Firestore 삭제 실패: $e");
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchPosts() {
    return _db
        .collection("posts")
        .orderBy("createdAt", descending: true)
        .snapshots();
  }
}

final postRepo = Provider((ref) => PostRepository());
