abstract class SignInEvent {}

class SignInTextChangeEvent extends SignInEvent {
  final String mobileNum;

  SignInTextChangeEvent(this.mobileNum);
}

class SignInSubmittedEvent extends SignInEvent {
  final String mobileNum;
  final String designation;
  final String password;

  SignInSubmittedEvent(this.mobileNum, this.designation, this.password);
}

class SignInLogginSuccessEvent extends SignInEvent {}

class SignInLoggedOutEvent extends SignInEvent {}

class SignInLoggedinEvent extends SignInEvent {}
