import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covaid/Models/userModel.dart';
import 'package:covaid/Utils/utilities.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

const String MESSAGES_COLLECTION = "messages";
const String USERS_COLLECTION = "users";
const String PROJECTS_COLLECTION = "projects";
const String EMAIL_FIELD = "email";
const String noImageAvailable =
    "https://www.esm.rochester.edu/uploads/NoPhotoAvailable.jpg";

// class Authentication {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   String uid;
//   String userEmail;
//   final GoogleSignIn googleSignIn = GoogleSignIn();

//   String name;
//   String imageUrl;

//   Future<User> registerWithEmailPassword(String email, String password) async {
//     // Initialize Firebase
//     await Firebase.initializeApp();
//     User user;
//     try {
//       UserCredential userCredential =
//           await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       user = userCredential.user;
//       if (user != null) {
//         uid = user.uid;
//         userEmail = user.email;
//       }
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('An account already exists for that email.');
//       }
//     } catch (e) {
//       print(e);
//     }
//     return user;
//   }

//   Future<User> signInWithEmailPassword(String email, String password) async {
//     await Firebase.initializeApp();
//     User user;

//     try {
//       UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       user = userCredential.user;
//       if (user != null) {
//         uid = user.uid;
//         userEmail = user.email;
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         await prefs.setBool('auth', true);
//       }
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         print('No user found for that email.');
//       } else if (e.code == 'wrong-password') {
//         print('Wrong password provided.');
//       }
//     }

//     return user;
//   }

//   Future<String> signOut() async {
//     await _auth.signOut();
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setBool('auth', false);
//     uid = null;
//     userEmail = null;
//     return 'User signed out';
//   }

//   Future<User> signInWithGoogle() async {
//     // Initialize Firebase
//     await Firebase.initializeApp();
//     User user;
//     // The `GoogleAuthProvider` can only be used while running on the web
//     GoogleAuthProvider authProvider = GoogleAuthProvider();
//     try {
//       final UserCredential userCredential =
//           await _auth.signInWithPopup(authProvider);
//       user = userCredential.user;
//     } catch (e) {
//       print(e);
//     }
//     if (user != null) {
//       uid = user.uid;
//       name = user.displayName;
//       userEmail = user.email;
//       imageUrl = user.photoURL;
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       prefs.setBool('auth', true);
//     }
//     return user;
//   }

//   void signOutGoogle() async {
//     await googleSignIn.signOut();
//     await _auth.signOut();

//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setBool('auth', false);

//     uid = null;
//     name = null;
//     userEmail = null;
//     imageUrl = null;

//     print("User signed out of Google account");
//   }

//   Future getUser() async {
//     // Initialize Firebase
//     await Firebase.initializeApp();

//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool authSignedIn = prefs.getBool('auth') ?? false;

//     final User user = _auth.currentUser;

//     if (authSignedIn == true) {
//       if (user != null) {
//         uid = user.uid;
//         name = user.displayName;
//         userEmail = user.email;
//         imageUrl = user.photoURL;
//       }
//     }
//   }
// }

class AuthServices {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  static final CollectionReference _userCollection =
      _firestore.collection(USERS_COLLECTION);

  Future<User> getCurrentUser() async {
    User currentUser;
    currentUser = await _auth.currentUser;
    return currentUser;
  }

  Future<UserModel> getUserDetails() async {
    User currentUser = await (getCurrentUser() as Future<User>);

    DocumentSnapshot documentSnapshot =
        await _userCollection.doc(currentUser.uid).get();
    return UserModel.fromMap(documentSnapshot.data());
  }

  Future<UserModel> getUserDetailsById(id) async {
    try {
      DocumentSnapshot documentSnapshot = await _userCollection.doc(id).get();
      return UserModel.fromMap(documentSnapshot.data());
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<User> signIn() async {
    try {
      GoogleSignInAccount _signInAccount =
          await (_googleSignIn.signIn() as Future<GoogleSignInAccount>);
      GoogleSignInAuthentication _signInAuthentication =
          await _signInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: _signInAuthentication.accessToken,
          idToken: _signInAuthentication.idToken);

      User user = (await _auth.signInWithCredential(credential)).user;
      return user;
    } catch (e) {
      print("Auth methods error");
      print(e);
      return null;
    }
  }

  Future<bool> authenticateUser(User user) async {
    QuerySnapshot result = await firestore
        .collection(USERS_COLLECTION)
        .where(EMAIL_FIELD, isEqualTo: user.email)
        .get();

    final List<DocumentSnapshot> docs = result.docs;

    //if user is registered then length of list > 0 or else less than 0
    return docs.length == 0 ? true : false;
  }

  Future<void> addDataToDb(User currentUser) async {
    UserModel user = UserModel(
      uid: currentUser.uid,
      email: currentUser.email,
      name: currentUser.displayName,
      username: Utils.getUsername(currentUser.email),
      profilePhoto: currentUser.photoURL,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      bio: '',
      phoneNumber: '',
      verified: 0,
    );

    firestore
        .collection(USERS_COLLECTION)
        .doc(currentUser.uid)
        .set(user.toMap(user) as Map<String, dynamic>);
  }

  Future<List<UserModel>> fetchAllUsers(User currentUser) async {
    List<UserModel> userList = [UserModel()];

    QuerySnapshot querySnapshot =
        await firestore.collection(USERS_COLLECTION).get();
    for (var i = 0; i < querySnapshot.docs.length; i++) {
      if (querySnapshot.docs[i].id != currentUser.uid) {
        userList.add(UserModel.fromMap(querySnapshot.docs[i].data()));
      }
    }
    return userList;
  }

  Future<bool> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Stream<DocumentSnapshot> getUserStream({String uid}) =>
      _userCollection.doc(uid).snapshots();
}
