import 'package:flutter/material.dart';
import 'package:portlends/providers/httpService.dart';
import 'package:portlends/widgets/auth/input_white_field.dart';
import 'package:portlends/widgets/green_button.dart';
import 'package:portlends/widgets/round_button.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:portlends/widgets/white_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLogin = true;
  String _userName = '';
  String _userEmail = 'robertofmbarreto@gmail.com';
  String _userPassword = 'teste123';
  String _userBirthDate = '';
  String _userStreet = '';
  int _userPC = -1;
  int _userContact = -1;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final httpService = HttpService();

    void callDialog(String text) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            backgroundColor: Colors.white,
            content: SizedBox(
              height: 70,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                    child: LoadingIndicator(
                        indicatorType: Indicator.circleStrokeSpin,
                        colors: [
                          Color.fromRGBO(11, 206, 131, 1),
                        ],
                        strokeWidth: 2,
                        backgroundColor: Colors.transparent,
                        pathBackgroundColor: Colors.transparent),
                  ),
                  Text(text)
                ],
              ),
            ),
          );
        },
      );
    }

    Future<void> registerUser() async {
      callDialog('A realizar o registo...');
      try {
        final res = await httpService.registerUser(
          userName: _userName,
          userEmail: _userEmail,
          userPassword: _userPassword,
          userStreet: _userStreet,
          userPC: _userPC,
          userContact: _userContact,
          userBirthDate: _userBirthDate,
        );

        if (res['auth']) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(res['msg']),
          ));
          Navigator.of(context).popAndPushNamed('/');
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.toString()),
        ));
        Navigator.of(context).pop();
      }
    }

    Future<void> getUserData(int userID) async {
      Navigator.of(context).pop();
      callDialog('A obter dados do utilizador...');
      try {
        await httpService.getUserData(userID);
        Navigator.of(context).popAndPushNamed('/');
      } catch (e) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.toString()),
        ));
      }
    }

    Future<void> checkLogin() async {
      callDialog('A realizar a autenticação...');
      final res = await httpService.login(_userPassword, _userEmail);

      if (res['auth']) {
        getUserData(res['UID']);
      } else {
        Navigator.of(context).pop();
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(res['msg']),
      ));
    }

    Future<void> selectDate() async {
      final DateTime? selected = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1922),
        lastDate: DateTime.now(),
        builder: (context, Widget? child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: const ColorScheme.light(
                primary: Colors.deepPurple,
                onPrimary: Colors.white,
                surface: Colors.white,
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: child ?? const Text(''),
          );
        },
      );

      if (selected != null && selected.toString() != _userBirthDate) {
        setState(() {
          _userBirthDate = selected.toString();
        });
      }
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
              height: _isLogin
                  ? (mediaQuery.size.height - mediaQuery.padding.top) * 0.37
                  : (mediaQuery.size.height - mediaQuery.padding.top) * 0.75,
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: const Color.fromRGBO(0, 0, 0, .3),
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
                      if (!_isLogin) ...[
                        InputWhiteField(
                            key: const ValueKey('nome'),
                            hint: 'nome',
                            onChanged: (text) {
                              _userName = text;
                            }),
                        const SizedBox(height: 15),
                      ],
                      InputWhiteField(
                          key: const ValueKey('email'),
                          keyboardType: TextInputType.emailAddress,
                          hint: 'email',
                          onChanged: (text) {
                            _userEmail = text;
                          }),
                      const SizedBox(height: 15),
                      InputWhiteField(
                        key: const ValueKey('password'),
                        hint: 'password',
                        isPassWd: true,
                        onChanged: (text) {
                          _userPassword = text;
                        },
                      ),
                      if (!_isLogin) ...[
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            RoundButton(
                              icon: const Icon(Icons.edit),
                              size: 50,
                              onTap: () {
                                selectDate();
                              },
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(color: Colors.white),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      _userBirthDate == ''
                                          ? 'Data de nascimento'
                                          : _userBirthDate.split(' ')[0],
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                        InputWhiteField(
                            key: const ValueKey('rua'),
                            keyboardType: TextInputType.streetAddress,
                            hint: 'rua',
                            onChanged: (text) {
                              _userStreet = text;
                            }),
                        const SizedBox(height: 15),
                        InputWhiteField(
                            key: const ValueKey('cp'),
                            keyboardType: TextInputType.number,
                            hint: 'codigo postal',
                            onChanged: (text) {
                              _userPC = int.parse(text);
                            }),
                        const SizedBox(height: 15),
                        InputWhiteField(
                            key: const ValueKey('ctt'),
                            keyboardType: TextInputType.number,
                            hint: 'contato telefónico',
                            onChanged: (text) {
                              _userContact = int.parse(text);
                            }),
                      ],
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.05,
                            width: mediaQuery.size.width * 0.25,
                            child: GreenButton(
                              text: _isLogin ? 'Login' : 'Concluir',
                              onTap: _isLogin ? checkLogin : registerUser,
                            ),
                          ),
                          SizedBox(
                            height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.05,
                            width: mediaQuery.size.width * 0.25,
                            child: WhiteButton(
                                text: Text(
                                  _isLogin ? 'Registo' : 'Login',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.copyWith(color: Colors.grey),
                                ),
                                onTap: () {
                                  setState(() {
                                    _isLogin = !_isLogin;
                                    setState(() {
                                      _userBirthDate = '';
                                    });
                                  });
                                }),
                          ),
                        ],
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
