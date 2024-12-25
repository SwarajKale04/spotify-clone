import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart';
import 'package:spotify/domain/repository/auth/auth.dart';

import '../../../service_locator.dart';

class SigninUseCase implements UseCase<Either,SigninUserReq>{                   
  //either have two parts right and left 
  // if successfuk will return right side  /
  @override
  Future<Either> call({SigninUserReq ? params}) {
   return sl<AuthRepository>().signin(params!);
  }   
}