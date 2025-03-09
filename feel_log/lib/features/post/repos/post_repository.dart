import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feel_log/features/post/models/post_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addPost(PostModel data) async {
    await _db.collection("posts").add(data.toJson());
  }

  Future<void> deleteCard(String postId) async {
    await _db.collection("posts").doc(postId).delete();
  }
}

final postRepo = Provider((ref) => PostRepository());
