import 'package:get_it/get_it.dart';
import 'package:spotify/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify/data/repository/song/song_repository_impl.dart';
import 'package:spotify/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify/data/sources/song/song_firebase_service.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/domain/repository/song/song.dart';
import 'package:spotify/domain/usecases/auth/signin.dart';
import 'package:spotify/domain/usecases/auth/signup.dart';
import 'package:spotify/domain/usecases/song/get_news_songs.dart';

final sl = GetIt.instance;

Future<void> initilizeDependences() async{

  // registre only one thing 
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImp()

  );
   sl.registerSingleton<SongFirebaseService>(
    SongFirebaseServiceImp()

  );
 sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl()
  );
  
  
 sl.registerSingleton<SongsRepository>(
    SongsRepositoryImpl()
  );
  sl.registerSingleton<SignupUseCase>(
    SignupUseCase()
  );
 sl.registerSingleton<SigninUseCase>(
    SigninUseCase()
  );

 sl.registerSingleton<GetNewsSongsUseCase>(
    GetNewsSongsUseCase()
  );

}
