import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_lab/firebase_options.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: AuthWidget()
    );
  }
}

class AuthWidget extends StatefulWidget {
  @override
  AuthWidgetState createState() => AuthWidgetState();
}

class AuthWidgetState extends State<AuthWidget> {
  final _formKey = GlobalKey<FormState>();

  late String email;
  late String password;
  bool isInput = true; // false = Result
  bool isSignIn = true; // false = SignUp

  signIn() async {
    try {
      await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
        print(value);
        if (value.user!.emailVerified) {
          // Email Authentication Status
          setState(() {
            isInput = false;
          });
        } else {
          showToast('E-mail Verified Error');
        }
        return value;
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showToast('User not found');
      } else if (e.code == 'wrong-password') {
        showToast('Wrong password');
      } else {
        showToast('Other error');
        print(e.code);
      }
    }
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
    setState(() {
      isInput = true;
    });
  }

  signUp() async {
    try {
      await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
        if (value.user!.email != null) {
          FirebaseAuth.instance.currentUser?.sendEmailVerification();
          setState(() {
            isInput = false;
          });
        }
        return value;
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showToast('Weak password');
      } else if (e.code == 'email-already-in-use') {
        showToast('E-mail already in use');
      } else {
        showToast('Other error');
        print(e.code);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  List<Widget> getInputWidget() {
    return [
      Text(
        isSignIn ? "Sign in" : "Sign up",
        style: TextStyle(
          color: Colors.indigo,
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),
        textAlign: TextAlign.center
      ),
      Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'E-mail'
              ),
              validator: (value) {
                if (value?.isEmpty ?? false) {
                  return 'Please enter E-mail';
                }
                return null;
              },
              onSaved: (String? value) {
                email = value ?? "";
              }
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password'
              ),
              validator: (value) {
                if (value?.isEmpty ?? false) {
                  return 'Please enter Password';
                }
                return null;
              },
              onSaved: (String? value) {
                password = value ?? "";
              }
            )
          ]
        )
      ),
      ElevatedButton(
        onPressed: () {
          if (_formKey.currentState?.validate() ?? false) {
            _formKey.currentState?.save();
            print('E-mail : $email, Password : $password');
            if (isSignIn) {
              signIn();
            } else {
              signUp();
            }
          }
        },
        child: Text(
          isSignIn ? "Sign in" : "Sign up"
        )
      ),
      RichText(
        textAlign: TextAlign.right,
        text: TextSpan(
          text: 'Go ',
          style: Theme.of(context).textTheme.bodySmall,
          children: <TextSpan>[
            TextSpan(
              text: isSignIn ? "Sign up" : "Sign in",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  setState(() {
                    isSignIn = !isSignIn;
                  });
                }
            )
          ]
        )
      )
    ];
  }

  List<Widget> getResultWidget() {
    String resultEmail = FirebaseAuth.instance.currentUser!.email!;
    return [
      Text(
        isSignIn
        ? "$resultEmail로 로그인 하셨습니다!"
        : "$resultEmail로 회원 가입하셨습니다! 이메일 인증을 거쳐야 로그인이 가능합니다.",
        style: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.bold
        )
      ),
      ElevatedButton(
        onPressed: () {
          if (isSignIn) {
            signOut();
          } else {
            setState(() {
              isInput = true;
              isSignIn = true;
            });
          }
        },
        child: Text(
          isSignIn ? "Sign out" : "Sign in"
        )
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Test")
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: isInput ? getInputWidget() : getResultWidget()
      )
    );
  }
}