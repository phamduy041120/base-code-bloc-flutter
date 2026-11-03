import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../repositories/api/post/post_repository.dart';
import '../../repositories/api/session/session_repository.dart';
import '../../repositories/api/story/story_respository.dart';
import '../../services/secure_storage/secure_storage_manager.dart';
import '../common/common_state.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeEvent>((event, emit) async {
      if (event is FetchAll) {
        await _onFetchAll(emit, event);
      }
    });
  }

  Future<void> _onFetchAll(Emitter<HomeState> emit, FetchAll event) async {
    await Future.wait([
      _getStory(emit, event),
      _getPost(emit, event),
    ]);
  }

  Future<void> _getStory(Emitter<HomeState> emit, FetchAll event) async {
    final hasCachedStory = await _getCachedStory(emit);
    if (hasCachedStory) {
      unawaited(_getStoryResponse(emit, event));
    } else {
      await _getStoryResponse(emit, event);
    }
  }

  Future<bool> _getCachedStory(Emitter<HomeState> emit) async {
    /// Get info from session
    var storyResponse = sessionRepository.storyList();

    /// If storyResponse == null, get info from secure storage
    storyResponse ??= await secureStorageManager.readStoryList();
    emit(state.copyWith(storyList: storyResponse ?? []));
    return storyResponse != null;
  }

  Future<void> _getStoryResponse(
    Emitter<HomeState> emit,
    FetchAll event,
  ) async {
    Object? error;
    try {
      emit(state.copyWith(isLoading: StateLoading.loading));
      final storyResponse = await storyRepository.getStory((storyList) {
        /// Save info to session
        sessionRepository.saveStoryList;
      }, (storyList) {
        /// Save info to secure storage
        secureStorageManager.writeStoryList;
      });
      emit(state.copyWith(
        isLoading: StateLoading.loader,
        storyList: storyResponse,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: StateLoading.error));
      error = e;
    }
    if (error != null) {
      event.showError(error);
    }
  }

  Future<void> _getPost(Emitter<HomeState> emit, FetchAll event) async {
    final hasCachedPost = await _getCachedPost(emit);
    if (hasCachedPost) {
      unawaited(_getPostResponse(emit, event));
    } else {
      await _getPostResponse(emit, event);
    }
  }

  Future<bool> _getCachedPost(Emitter<HomeState> emit) async {
    /// Get info from session
    var postResponse = sessionRepository.postList();

    /// If postResponse == null, get info from secure storage
    postResponse ??= await secureStorageManager.readPostList();
    emit(state.copyWith(postList: postResponse ?? []));
    return postResponse != null;
  }

  Future<void> _getPostResponse(Emitter<HomeState> emit, FetchAll event) async {
    Object? error;
    try {
      emit(state.copyWith(isLoading: StateLoading.loading));
      final postResponse = await postRepository.getPost((postList) {
        /// Save info to session
        sessionRepository.savePostList;
      }, (postList) {
        /// Save info to secure storage
        secureStorageManager.writePostList;
      });
      emit(state.copyWith(
        isLoading: StateLoading.loader,
        postList: postResponse,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: StateLoading.error));
      error = e;
    }
    if (error != null) {
      event.showError(error);
    }
  }
}
