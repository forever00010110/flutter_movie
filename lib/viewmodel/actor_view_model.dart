import 'package:flutter_movie/base/base_view_model.dart';
import 'package:flutter_movie/model/movie_photo.dart';
import 'package:flutter_movie/repository/actor_repository.dart';

/// 演员对应ViewModel
class ActorViewModel extends BaseViewModel<ActorRepository> {
  /// 影片剧照
  Future<dynamic> getMovieAlbum({String movieId, int start, int count}) async {
    var result = await requestData(mRepository.getMovieAlbum(
        movieId: movieId, start: start, count: count));
    var photos = result?.data['photos'];
    return photos;
  }

  /// 演员详细信息
  Future<dynamic> getActorDetail(String actorId) async {
    var result = await requestData(mRepository.getActorDetail(actorId));
    return result?.data;
  }

  /// 获取演员相册
  Future<dynamic> getActorPhotos({String actorId, int start, int count}) async {
    var result = await requestData(mRepository.getActorPhotos(
        actorId: actorId, start: start, count: count));
    var photos = result?.data['photos'];
    return photos;
  }

  Future<List<String>> getImageUrls(List<MoviePhoto> photos) async {
    List<String> imageUrls = [];
    for (MoviePhoto photo in photos) {
      imageUrls.add(photo.cover);
    }
    return imageUrls;
  }

  @override
  ActorRepository createRepository() {
    return new ActorRepository();
  }
}
