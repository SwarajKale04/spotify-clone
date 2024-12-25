import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/core/config/constants/app_urls.dart';
import 'package:spotify/domain/entities/song/song.dart';
import 'package:spotify/presentation/home/bloc/news_songs_cubit.dart';
import 'package:spotify/presentation/home/bloc/news_songs_state.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsSongsCubit()..getNewsSongs(),
      child: SizedBox(
        height: 200,
        child: BlocBuilder<NewsSongsCubit,NewsSongsState>(
          builder: (context,state) {
            if (state is NewsSongsLoading) {
              return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator()
              );
            } 

            if (state is NewsSongsLoaded) {
              return _songs(
                state.songs
              );
            }

            return Container();
          },
        )
        
      ),
    );
  } 
   Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return SizedBox(
          width: 160,
          child: Column(
            children: [
              Expanded(
                child: Center(
      child: Image.network(
        "https://firebasestorage.googleapis.com/v0/b/fir-a2f0b.appspot.com/o/covers%2FCalvin%20Harris%20%2CDua%20Lipa%20-%20one%20kisss.jpg?alt=media&token=20f9d22c-1c47-46d1-a7da-31728d7da6c4",
        errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
          return Container(height: 100, width: 100,
          color: Colors.amber,);
        },
      ),
    )
                // Container(
                // decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(30),
                //       image: DecorationImage(
                //         fit: BoxFit.cover,
                //         image: NetworkImage(
                //           '${AppURLs.coverFirestorage}${songs[index].artist} - ${songs[index].title}.jpg?${AppURLs.mediaAlt}'
                //         )
                //       )
                //     ),
                // ),
              )
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(
        width: 14,
      ),
      itemCount: songs.length,
    );
  }
}
