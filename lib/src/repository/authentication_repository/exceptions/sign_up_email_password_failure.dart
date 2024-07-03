class SignUpWithEmailPasswordFailure {
  final String message;

  const SignUpWithEmailPasswordFailure(
      [this.message = "An unknown exception occurred."]);

  factory SignUpWithEmailPasswordFailure.code(String code) {
    switch (code) {
      case 'email-already-in-use':
        return const SignUpWithEmailPasswordFailure(
            'The account already exists for that email.');
      case 'invalid-email':
        return const SignUpWithEmailPasswordFailure(
            'The email is badly formatted.');
      case 'operation-not-allowed':
        return const SignUpWithEmailPasswordFailure(
            'Operation is not allowed. Please contact support.');
      case 'weak-password':
        return const SignUpWithEmailPasswordFailure(
            'The password must be 6 characters long or more.');
      default:
        return const SignUpWithEmailPasswordFailure();
    }
  }
}
