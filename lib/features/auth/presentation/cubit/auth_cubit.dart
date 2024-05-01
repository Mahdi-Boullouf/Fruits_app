import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  login(String email , String password) async {
    emit(LoadingAuth());
      String mockedEmail = "mahdi.boullouf@gmail.com";
      String mockedPassword = "123456789";
      await Future.delayed(const Duration(seconds: 1));
      if(email == mockedEmail && password == mockedPassword){
        emit(SignedInSuccesfuly());
      }else{
        emit(const AuthError(message: "Invalid Credentials"));
      }

  }

  signUp(){

  }
}
