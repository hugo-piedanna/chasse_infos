import 'package:chasse_infos/models/userModel.dart';
import 'package:chasse_infos/pages/login.dart';
import 'package:chasse_infos/pages/profil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class registration extends StatefulWidget {
  const registration({Key? key}) : super(key: key);

  @override
  _registrationState createState() => _registrationState();
}

class _registrationState extends State<registration> {
  final _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  final nameEditingController = new TextEditingController();
  final lastnameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final ageEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final nameField = TextFormField(
      autofocus: false,
      controller: nameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regExp = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Vous devez entrer votre prénom !");
        }

        if (!regExp.hasMatch(value)) {
          return ("Prénom invalide ! (3 caractères minimum)");
        }

        return null;
      },
      onSaved: (value) {
        nameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.person),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Prénom",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final lastnameField = TextFormField(
      autofocus: false,
      controller: lastnameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Vous devez entrer votre nom !");
        }

        return null;
      },
      onSaved: (value) {
        lastnameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.person),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Nom",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Vous devez entrer votre email !");
        }

        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Vous devez entrer un email valide !");
        }
        return null;
      },
      onSaved: (value) {
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.mail),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final ageField = TextFormField(
      autofocus: false,
      controller: ageEditingController,
      keyboardType: TextInputType.datetime,
      //validator: () {},
      onSaved: (value) {
        ageEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.cake),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Date de naissance",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
      validator: (value) {
        RegExp regExp = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Vous devez entrer votre mot de passe !");
        }

        if (!regExp.hasMatch(value)) {
          return ("Mot de passe invalide ! (6 caractères minimum)");
        }
      },
      onSaved: (value) {
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Mot de passe",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final confirmpasswordField = TextFormField(
      autofocus: false,
      controller: confirmPasswordEditingController,
      obscureText: true,
      validator: (value) {
        if (confirmPasswordEditingController.text.length > 6 &&
            passwordEditingController.text != value) {
          return "Le mot de passe ne correspond pas";
        }
        return null;
      },
      onSaved: (value) {
        confirmPasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirmer le mot de passe",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final signUpBtn = Material(
      elevation: 5,
      color: const Color(0xff8fc0a9),
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signUp(emailEditingController.text, passwordEditingController.text);
        },
        child: const Text(
          "S'enregistrer",
          style: TextStyle(
            color: Color(0xfffaf3dd),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff4a7c59), Color(0xff52896e)])),
      child: SafeArea(
        child: ClipRRect(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff4a7c59), Color(0xff52896e)])),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.miniStartTop,
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    this.context,
                    MaterialPageRoute(builder: (context) => const profil()),
                  );
                },
                backgroundColor: const Color(0xff8fc0a9),
                foregroundColor: const Color(0xfffaf3dd),
                child: const Icon(Icons.arrow_back),
              ),
              body: Center(
                child: SingleChildScrollView(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(36.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 150,
                              child: Image.asset(
                                'images/icon-foret.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(height: 45),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(child: nameField),
                                Container(width: 10, color: Colors.transparent),
                                Expanded(child: lastnameField),
                              ],
                            ),
                            const SizedBox(height: 20),
                            emailField,
                            const SizedBox(height: 20),
                            ageField,
                            const SizedBox(height: 20),
                            passwordField,
                            const SizedBox(height: 20),
                            confirmpasswordField,
                            const SizedBox(height: 20),
                            signUpBtn,
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Vous avez déjà un compte? "),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                const login())));
                                  },
                                  child: const Text(
                                    "Connectez-vous",
                                    style: TextStyle(
                                      color: Color(0xfffaf3dd),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message, toastLength: Toast.LENGTH_LONG);
      });
    }
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    User? user = _auth.currentUser;

    userModel userMod = userModel();
    userMod.email = user!.email;
    userMod.uid = user.uid;
    userMod.name = nameEditingController.text;
    userMod.lastName = lastnameEditingController.text;
    userMod.birthday = ageEditingController.text;
    userMod.huntPoints = <int>[];

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userMod.toMap());

    Fluttertoast.showToast(
        msg: "Compte créé avec succès !", toastLength: Toast.LENGTH_LONG);

    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => profil()), (route) => false);
  }
}
