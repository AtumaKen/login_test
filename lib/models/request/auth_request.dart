class SignUpRequestModel {
  String firstName;
  String lastName;
  String phone;
  String email;
  String password;
  String confirmPassword;

  SignUpRequestModel(
      {this.firstName,
      this.lastName,
      this.phone,
      this.email,
      this.password,
      this.confirmPassword});

  @override
  String toString() {
    return this.firstName +
        " " +
        this.lastName +
        " " +
        this.phone +
        " " +
        this.email +
        " " +
        this.password +
        " " +
        this.confirmPassword;
  }
}
