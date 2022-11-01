import 'package:flutter/material.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/services/auth/auth_service.dart';

class VerifyEmailView extends StatefulWidget {
  VerifyEmailView({Key? key}) : super(key: key);

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.grey),
          onPressed: () => Navigator.of(context)
              .pushNamedAndRemoveUntil(loginRoute, (route) => false),
        ), //No shadow
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 500.0),
            child: Column(
              children: [
                SizedBox(height: 15),
                const Text(
                    "We've sent you an email verificaiton. Please open it to verify your account. "),
                const Text(
                    "If you haven't recieced the email verificaiton yet , press the button below."),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 75.0),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      child: TextButton(
                        onPressed: () async {
                          await AuthService.firebase().sendEmailVerification();
                        },
                        child: const Text('Send Email Verification'),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 75.0),
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        child: TextButton(
                          onPressed: () async {
                            await AuthService.firebase().logOut();
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                registerRoute, (route) => false);
                          },
                          child: const Text('Restart'),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
