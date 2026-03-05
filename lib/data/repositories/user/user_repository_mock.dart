

import 'package:homework/data/repositories/user/user_history_respository.dart';
import 'package:homework/model/songs/song.dart';

class UserRepositoryMock extends UserHistoryRespository{

   final List<String> _songId = ["101", '104', '105'];
  
    @override
    List<String> fetchSongId(){  // get song with specific id for recently 
       return _songId;
    }
  @override
  void addHistory(Song song){   // add song to history 
    if(!_songId.contains(song.id)){
      _songId.add(song.id);
    }
  }

}