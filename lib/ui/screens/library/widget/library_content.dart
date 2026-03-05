import 'package:flutter/material.dart';
import 'package:homework/ui/screens/library/view_model/library_view_model.dart';
import 'package:homework/ui/states/settings_state.dart';
import 'package:provider/provider.dart'; 

import '../../../../model/songs/song.dart';

import '../../../theme/theme.dart';

class LibraryViewContent extends StatelessWidget {
  const LibraryViewContent({super.key});

  @override
  Widget build(BuildContext context) {
    final vM = context.watch<LibraryViewModel>();
    final color = context.watch<AppSettingsState>();
    
    return Container(
      color: color.theme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Library", style: AppTextStyles.heading),

          SizedBox(height: 50),

          Expanded(
            child: ListView.builder(
              itemCount: vM.songs.length,
              itemBuilder: (context, index) => SongTile(
                song: vM.songs[index],
                isPlaying: vM.currentSong == vM.songs[index] ,
                onTap: () {
                  vM.playSong(vM.songs[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.song,
    required this.isPlaying,
    required this.onTap,
  });

  final Song song;
  final bool isPlaying;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(song.title),
      trailing: Text(
        isPlaying ? "Playing" : "",
        style: TextStyle(color: Colors.amber),
      ),
    );
  }
}
