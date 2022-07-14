Future<bool> signUpUser(String birthday, String gender) async {
  try {
    _status = Status.Authenticating;
    notifyListeners(); //changing status

    FirebaseApp secondaryApp = await Firebase.initializeApp(
      name: 'SecondaryApp',
      options: Firebase.app().options,
    );

    try {
      UserCredential credential =
          await FirebaseAuth.instanceFor(app: secondaryApp)
              .createUserWithEmailAndPassword(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim())
              .then((result) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("id", result.user.uid); //userid setzen
        _userServices.createUser(
          uid: result.user.uid,
          username: usernameController.text.trim(),
          email: emailController.text.trim(),
          firstName: firstNameController.text.trim(),
          lastName: lastNameController.text.trim(),
          birthday: birthday,
          gender: gender,
          status: 'aktiv',
          role: 'User',
        );
      });

      if (credential.user == null) throw 'An error occured. Please try again.';
      await credential.user.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    await secondaryApp.delete();

    return true;
  } catch (e) {
    _status = Status.Unauthenticated;
    notifyListeners();
    print(e.toString());
    return false;
  }
}
