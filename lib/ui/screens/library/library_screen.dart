import 'package:flutter/material.dart';
import 'package:homework/ui/screens/library/view_model/library_view_model.dart';
import 'package:homework/ui/screens/library/widget/library_content.dart';
import 'package:homework/ui/states/player_state.dart';
import 'package:provider/provider.dart';
 
import '../../../data/repositories/songs/song_repository.dart';


class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => LibraryViewModel(context.read<SongRepository>(), context.read<PlayerState>()),
      child: const LibraryViewContent(),
    );

              
    
  }
}


