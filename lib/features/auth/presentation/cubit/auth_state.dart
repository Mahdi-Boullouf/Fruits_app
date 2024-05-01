part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}
final class LoadingAuth extends AuthState {}
final class SignedInSuccesfuly extends AuthState {}
final class SignedUpSuccesfuly extends AuthState {}
final class AuthError extends AuthState {
  final String message ;

  const AuthError({required this.message}); 
  @override
  List<Object> get props => [message];
}


