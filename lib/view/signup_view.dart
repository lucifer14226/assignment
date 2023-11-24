import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/dialog/errordialog.dart';
import 'package:newsapp/firebase_options.dart';
import 'package:newsapp/services/auth/auth_exception.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroler = TextEditingController();
  final white = Colors.white;
  final _passwordFocusNode = FocusNode();
  bool hidepassword = true;
  final _formkey = GlobalKey();

  final outlineInputBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(color: Colors.white),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://bloomidea.com/sites/default/files/styles/og_image/public/blog/lisboa_cool_resumo_projeto.jpg?itok=Xqo72jsi"),
                  fit: BoxFit.cover),
            ),
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const SizedBox(
                          height: 150,
                        ),
                        Text(
                          "KHABAR",
                          style: GoogleFonts.abel(fontSize: 36),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: _emailcontroller,
                          autofocus: true,
                          onSaved: (newValue) {
                            debugPrint("UserName: $newValue");
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter the Email";
                            }
                            return null;
                          },
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(_passwordFocusNode);
                          },
                          textInputAction: TextInputAction.next,
                          style: TextStyle(color: white),
                          maxLines: 1,
                          decoration: InputDecoration(
                            hintText: "Email id",
                            focusedBorder: outlineInputBorder,
                            border: outlineInputBorder,
                            hintStyle: const TextStyle(color: Colors.black),
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.blueGrey[900],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _passwordcontroler,
                          maxLines: 1,
                          obscureText: hidepassword,
                          focusNode: _passwordFocusNode,
                          onSaved: (newValue) {
                            debugPrint("Password:$newValue");
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter the password";
                            }
                            if (value.length < 4) {
                              return "Password should be geater than 4 characters";
                            }
                            return null;
                          },
                          style: TextStyle(
                            color: white,
                          ),
                          decoration: InputDecoration(
                            hintText: "Password",
                            focusedBorder: outlineInputBorder,
                            border: outlineInputBorder,
                            hintStyle: TextStyle(color: white),
                            prefix: Icon(
                              Icons.lock_open_outlined,
                              color: Colors.blueGrey[900],
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(
                                  () {
                                    hidepassword = !hidepassword;
                                  },
                                );
                              },
                              icon: Icon(
                                hidepassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              await Firebase.initializeApp(
                                  options:
                                      DefaultFirebaseOptions.currentPlatform);

                              final email = _emailcontroller.text;
                              final password = _passwordcontroler.text;
                              try {
                                await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                  email: email,
                                  password: password,
                                );
                                await FirebaseAuth.instance.currentUser!
                                    .sendEmailVerification();
                                // ignore: use_build_context_synchronously
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    'VerifyEmailRoutes', (route) => false);
                              } on WeakPasswordAuthException {
                                // ignore: use_build_context_synchronously
                                await showErrorDialog(context, 'Weak Password');
                              } on EmailAlreadyInAuthUseException {
                                // ignore: use_build_context_synchronously
                                await showErrorDialog(
                                    context, 'Email Already in use');
                              } on InvalidEmailAuthException {
                                // ignore: use_build_context_synchronously
                                await showErrorDialog(
                                  context,
                                  'Invalid Email',
                                );
                              } on GenericAuthException {
                                // ignore: use_build_context_synchronously
                                await showErrorDialog(
                                    context, 'Authentication Error');
                              }
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.grey[900])),
                            child: Text(
                              "Register",
                              style: GoogleFonts.actor(),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Have an Account?"),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      "LoginRoutes", (route) => false);
                                },
                                child: const Text("Login "))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
