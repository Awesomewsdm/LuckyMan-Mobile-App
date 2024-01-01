class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure(
      [this.message = 'An Unknown An Error Occurred']);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case "weak-password":
        return const SignUpWithEmailAndPasswordFailure(
            "Please enter a strong password");
      case 'invalid-password':
        return const SignUpWithEmailAndPasswordFailure(
            "E-mail is not valid or badly formatted");
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
            "An account already exist for that email");
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
            "Operation not allowed. Please contact support");
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
            "User has been disabled. Please contact support for assistance");
      default:
      return const  SignUpWithEmailAndPasswordFailure();
    }
  }
}
