import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:portlends/widgets/green_button.dart';
import 'package:portlends/widgets/search_bar.dart';
import 'package:crypto/crypto.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    String _userEmail = '';
    String _userPassword = '';

    void encodePassword() {
      final data = utf8.encode(_userPassword);
      print(sha1.convert(data).toString());
      _userPassword = sha512.convert(data).toString();
    }

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(11, 206, 131, 1),
            Color.fromRGBO(45, 12, 87, 1),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Center(
            child: SizedBox(
              height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.37,
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Color.fromRGBO(0, 0, 0, .3),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Portlends',
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            ?.copyWith(fontSize: 50, color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                      const InputTextBox(hint: 'email'),
                      const SizedBox(height: 15),
                      InputTextBox(
                        hint: 'password',
                        isPassWd: true,
                        onChanged: (text) {
                          _userPassword = text;
                        },
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.05,
                        width: mediaQuery.size.width * 0.25,
                        child: GreenButton(
                            text: 'Login',
                            onTap: () {
                              encodePassword();
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
