abstract class UseCase<Type , Params > { // params is the value which we will pass like user_request 
  Future<Type> call ({Params params});
}