import 'package:flutter/material.dart';
import 'package:portlends/widgets/green_button.dart';
import 'package:portlends/widgets/search_bar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              height: 300,
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
                      const InputTextBox(
                        hint: 'password',
                        isPassWd: true,
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        height: 50,
                        width: 100,
                        child: Expanded(
                          child: GreenButton(text: 'Login', onTap: () {}),
                        ),
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
