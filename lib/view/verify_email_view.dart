import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Text(
            "Email Verified",
            style: GoogleFonts.adventPro(fontSize: 45),
          ),
          Image.network(
            "https://t3.ftcdn.net/jpg/04/58/93/08/360_F_458930842_K4f5VCbR8c0oBCg7shRxcXDWzTtzJ9Ux.jpg",
            alignment: Alignment.topCenter,
            fit: BoxFit.fitWidth,
          ),
          Text(
            "Click on the login button to go to login page",
            style: GoogleFonts.alice(),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('LoginRoutes', (route) => false);
            },
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.black26)),
            child: Text(
              "Login",
              style: GoogleFonts.roboto(),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Otherwise Click on the signuo button to go to signup page",
            style: GoogleFonts.alice(),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('SignupRoutes', (route) => false);
            },
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.black26)),
            child: Text(
              "Signup",
              style: GoogleFonts.roboto(),
            ),
          ),
        ],
      ),
    );
  }
}
