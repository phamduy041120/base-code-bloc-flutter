import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../models/api/responses/post/post.dart';
import '../../models/api/responses/story/story.dart';

class SecureStorageManager {
  SecureStorageManager(this._storage);

  final FlutterSecureStorage _storage;

  static const _story = 'story';
  static const _post = 'post';

  Future<String?> _read({
    required String key,
  }) async {
    return _storage.read(key: key);
  }

  Future<void> _delete({
    required String key,
  }) async {
    await _storage.delete(key: key);
  }

  Future<void> _write({
    required String key,
    required String? value,
  }) async {
    await _storage.write(key: key, value: value);
  }

  Future<void> writeStoryList(List<Story>? storyList) async {
    try {
      await _write(
        key: _story,
        value: json.encode(storyList),
      );
    } catch (_) {}
  }

  Future<List<Story>?> readStoryList() async {
    final result = await _read(key: _story);
    if (result == null) {
      return null;
    } else {
      try {
        final story = Story.fromJson(json.decode(result));
        return [story];
      } catch (_) {
        return null;
      }
    }
  }

  Future<void> writePostList(List<Post>? postList) async {
    try {
      await _write(
        key: _post,
        value: json.encode(postList),
      );
    } catch (_) {}
  }

  Future<List<Post>?> readPostList() async {
    final result = await _read(key: _post);
    if (result == null) {
      return null;
    } else {
      try {
        final post = Post.fromJson(json.decode(result));
        return [post];
      } catch (_) {
        return null;
      }
    }
  }
}

final secureStorageManager = SecureStorageManager(const FlutterSecureStorage());
