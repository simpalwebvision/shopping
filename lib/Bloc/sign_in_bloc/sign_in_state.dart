abstract class SignInState {}

class SignInInitialState extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInValidState extends SignInState {}

class SignInErrorState extends SignInState {
  final String errorMessage;
  SignInErrorState(this.errorMessage);
}

class SignFirebaseErrorState extends SignInState {
  final String errorMessage;
  SignFirebaseErrorState(this.errorMessage);
}

class SignInNoUserFoundState extends SignInState {}

class SignInLogginSuccessState extends SignInState {}

class SignInLoggedOutState extends SignInState {}

class SignInLoggedInState extends SignInState {}
