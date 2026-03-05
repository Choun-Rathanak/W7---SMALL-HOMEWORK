
import 'package:homework/model/songs/song.dart';

abstract class UserHistoryRespository  {

 List<String> fetchSongId(); // get recent song
  void addHistory(Song song); // add song

  

}