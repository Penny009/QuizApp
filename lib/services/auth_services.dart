import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_app/notifiers/auth_notifiers.dart';
import 'package:quiz_app/src/commons/refs.dart';
import 'package:quiz_app/src/model/user.dart';

signup(User user, AuthNotifier authNotifier) async {
  AuthResult authResult = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(
          email: user.email.trim(), password: user.password)
      .catchError((error) => print(error.code));
  if (authResult != null) {
    UserUpdateInfo updateInfo = UserUpdateInfo();
    updateInfo.displayName = user.name;

    FirebaseUser signedInUser = authResult.user;
    if (signedInUser != null) {
      await signedInUser.updateProfile(updateInfo);
      usersRef.document().setData({
        'name': user.name,
        'email': user.email,
        'profileImageUrl': '',
      });
      await signedInUser.reload();
      FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
      authNotifier.setUser(currentUser);
    }
  }
}

login(User user, AuthNotifier authNotifier) async {
  AuthResult authResult = await FirebaseAuth.instance
      .signInWithEmailAndPassword(
          email: user.email.trim(), password: user.password)
      .catchError((error) => print(error.code));

  if (authResult != null) {
    FirebaseUser firebaseUser = authResult.user;

    if (firebaseUser != null) {
      print("Log In: $firebaseUser");
      authNotifier.setUser(firebaseUser);
    }
  }
}

signout(AuthNotifier authNotifier) async {
  await FirebaseAuth.instance
      .signOut()
      .catchError((error) => print(error.code));

  authNotifier.setUser(null);
}

initializeCurrentUser(AuthNotifier authNotifier) async {
  FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();

  if (firebaseUser != null) {
    print(firebaseUser);
    authNotifier.setUser(firebaseUser);
  }
}
