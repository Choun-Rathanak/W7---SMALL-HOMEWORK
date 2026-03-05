
import 'package:flutter/material.dart';
import 'package:homework/ui/screens/home/view_model/home_view_model.dart';
import 'package:homework/ui/screens/library/widget/library_content.dart';
import 'package:homework/ui/states/settings_state.dart';
import 'package:provider/provider.dart'; 

import '../../../theme/theme.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
     final vM = context.watch<HomeViewModel>();
    final color = context.watch<AppSettingsState>();
    return Container(
      color: color.theme.backgroundColor,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Home", style: AppTextStyles.heading),

          SizedBox(height: 50),
          Text("Your recent songs", style: AppTextStyles.label),
          Expanded(
            child: ListView.builder(
              itemCount: vM.recent.length,
              itemBuilder: (context, index) => SongTile(
                song: vM.recent[index],
                isPlaying: vM.currentSong == vM.recent[index] ,
                onTap: () {
                  if(vM.currentSong == vM.recent[index]){
                  vM.stopSong();
                  }else{
                    vM.playSong(vM.recent[index]);
                  }
          
                },
              ),
            ),
          ),
          SizedBox(height: 50),
          Text("You might also like" ,style: AppTextStyles.label),
          Expanded(
            child: ListView.builder(
              itemCount: vM.likeSong.length,
              itemBuilder: (context, index) => SongTile(
                song: vM.likeSong[index],
                isPlaying: vM.currentSong == vM.likeSong[index] ,
                onTap: () {
                  if(vM.currentSong == vM.likeSong[index]){
                  vM.stopSong();
                  }else{
                    vM.playSong(vM.likeSong[index]);
                  }                
                },
              ),
            ),
          ),
    ],
    
    ),
     
    );
  }
}