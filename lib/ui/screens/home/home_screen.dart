

import 'package:flutter/material.dart';
import 'package:homework/data/repositories/songs/song_repository.dart';
import 'package:homework/data/repositories/user/user_history_respository.dart';
import 'package:homework/ui/screens/home/view_model/home_view_model.dart';
import 'package:homework/ui/screens/home/widget/home_content.dart';
import 'package:homework/ui/states/player_state.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(create: (context) => HomeViewModel(context.read<SongRepository>(), context.read<UserHistoryRespository>(), context.read<PlayerState>()),
      child: HomeContent(),
    );
  }
}