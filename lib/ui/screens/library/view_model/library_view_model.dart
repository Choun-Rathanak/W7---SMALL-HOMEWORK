

import 'package:flutter/material.dart';
import 'package:homework/data/repositories/songs/song_repository.dart';
import 'package:homework/model/settings/app_settings.dart';
import 'package:homework/model/songs/song.dart';
import 'package:homework/ui/states/player_state.dart';

class LibraryViewModel extends ChangeNotifier {
  final SongRepository repository;
 
  List<Song> songs = [];
  final PlayerState _playerState;
  LibraryViewModel(this.repository, this._playerState){
    init();
  } 

 
 Song? get currentSong => _playerState.currentSong;  

 
  
  void playSong(Song song){
    _playerState.start(song);
  }

  void stopSong(){
    _playerState.stop();
  }
  void init() {
  
   songs = repository.fetchSongs();
   notifyListeners();

   _playerState.addListener((){
    notifyListeners();
   });

   
 }
}