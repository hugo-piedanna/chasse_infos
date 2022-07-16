import 'package:chasse_infos/pages/login.dart';
import 'package:chasse_infos/pages/profil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class changePassword extends StatefulWidget {
  const changePassword({Key? key}) : super(key: key);

  @override
  _changePasswordState createState() => _changePasswordState();
}

class _changePasswordState extends State<changePassword> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = new TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
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
        emailController.text = value!;
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

    final sendBtn = Material(
      elevation: 5,
      color: const Color(0xff8fc0a9),
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          changePassword(emailController.text);
        },
        child: const Text(
          "Envoyer la demande",
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
                  child: Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 200,
                            child: Image.asset(
                              'images/icon-foret.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Vous recevrez un email pour changer votre mot de passe. Il vous suffit de suivre le lien dans l'email. Si vous n'avez pas reçu d'email, vérifiez vos spam !",
                            style: TextStyle(
                                fontSize: 17, color: Color(0xfffaf3dd)),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 40),
                          emailField,
                          const SizedBox(height: 30),
                          sendBtn,
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
    );
  }

  void changePassword(String email) async {
    if (_formKey.currentState!.validate()) {
      print(email);
      await _auth
          .sendPasswordResetEmail(email: email)
          .then((uid) => {
                Fluttertoast.showToast(
                    msg: "Un mail vous a été envoyer. Vérifier vos spam !",
                    toastLength: Toast.LENGTH_LONG),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: ((context) => const profil())))
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message, toastLength: Toast.LENGTH_LONG);
      });
    }
  }
}
