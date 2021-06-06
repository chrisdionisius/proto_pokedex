import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
String name, email, imageUrl, uid;

Future<String> signInEmail(String emailInput, String password) async {
  await Firebase.initializeApp();
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailInput, password: password);

    final User user = userCredential.user;

    if (user != null) {
      assert(user.email != null);
      name = null;
      email = user.email;
      imageUrl = null;
      uid = user.uid;
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);
      final User currentUser = _auth.currentUser;
      assert(user.uid == currentUser.uid);
      print('signInWithGoogle succeeded: $user');
      return '$user';
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      return null;
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
      return null;
    }
  }
  return null;
}

Future<String> signUpEmail(String emailInput, String password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: emailInput, password: password);
    return 'done';
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
      return 'weak';
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
      return 'exists';
    }
  } catch (e) {
    return null;
  }
  return null;
}

Future<String> signInWithGoogle() async {
  await Firebase.initializeApp();
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );
  final UserCredential authResult =
      await _auth.signInWithCredential(credential);
  final User user = authResult.user;
  if (user != null) {
    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoURL != null);
    name = user.displayName;
    email = user.email;
    imageUrl = user.photoURL;
    uid = user.uid;

    if (name.contains(" ")) {
      name = name.substring(0, name.indexOf(" "));
    }
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);
    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);
    return '$user';
  }
  return null;
}

Future<void> signOutGoogle() async {
  await googleSignIn.signOut();
  print("User Signed Out");
}
