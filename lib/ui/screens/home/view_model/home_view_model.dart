

import 'package:flutter/foundation.dart';
import 'package:homework/data/repositories/songs/song_repository.dart';
import 'package:homework/data/repositories/user/user_history_respository.dart';
import 'package:homework/model/songs/song.dart';
import 'package:homework/ui/states/player_state.dart';

class HomeViewModel extends ChangeNotifier{
  final SongRepository repository;
  final PlayerState _playerState;
  final UserHistoryRespository user;
  List<Song> songs = [];
  
  
  HomeViewModel(this.repository,this.user, this._playerState){
    init();
  }
   
  Song? get currentSong => _playerState.currentSong;  

   List<Song> get recent {
    return user.fetchSongId().map((id) =>
     repository.fetchSongById(id)).whereType<Song>().toList();  // convert the list string into object song
    }
  
  List<Song> get likeSong => repository.fetchSongs();

  void init() {
   _playerState.addListener((){
    notifyListeners();
   });
    }

  void playSong(Song song){
    _playerState.start(song);
    user.addHistory(song);
    notifyListeners();

  }
  void stopSong(){
    _playerState.stop();
  }
  
}
