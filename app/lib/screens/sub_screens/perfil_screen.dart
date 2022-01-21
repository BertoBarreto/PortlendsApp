import 'package:flutter/material.dart';
import 'package:portlends/models/user.dart';
import 'package:portlends/providers/httpService.dart';
import 'package:portlends/widgets/appbar.dart';
import 'package:portlends/widgets/round_button.dart';
import 'package:portlends/widgets/search_bar.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({Key? key}) : super(key: key);

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  String nome = User.nome;
  int contato = User.contato;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final HttpService httpService = HttpService();

    return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            MyAppBar(
              innerBoxIsScrolled: innerBoxIsScrolled,
              height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.20,
              onTap: () {},
              bottom: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Perfil',
                    style: Theme.of(context).textTheme.headline1,
                    textAlign: TextAlign.left,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: (mediaQuery.size.height - mediaQuery.padding.top) * 0.05,
                )
              ],
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nome', style: Theme.of(context).textTheme.headline2),
                Row(
                  children: [
                    Text(nome, style: Theme.of(context).textTheme.bodyText1),
                    const SizedBox(width: 10),
                    RoundButton(
                      size: 40,
                      icon: const Icon(
                        Icons.edit,
                        size: 20,
                      ),
                      onTap: () {
                        showDialog(
                          barrierDismissible: true,
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              actions: [
                                RoundButton(
                                  size: 50,
                                  icon: const Icon(Icons.cancel_outlined),
                                  onTap: () => Navigator.of(context).pop(),
                                ),
                                RoundButton(
                                  size: 50,
                                  icon: const Icon(Icons.done),
                                  onTap: () {
                                    setState(() {
                                      httpService.updateUserName(nome, contato);
                                    });
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              backgroundColor: Colors.white,
                              content: InputTextBox(
                                hint: 'Nome',
                                isSearch: false,
                                onChanged: (text) {
                                  nome = text;
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text('Email', style: Theme.of(context).textTheme.headline2),
                Text(User.email, style: Theme.of(context).textTheme.bodyText1),
                const SizedBox(
                  height: 15,
                ),
                Text('Data de Nascimento', style: Theme.of(context).textTheme.headline2),
                Text('${User.idade} anos', style: Theme.of(context).textTheme.bodyText1),
                const SizedBox(
                  height: 15,
                ),
                Text('Contato Telefónico', style: Theme.of(context).textTheme.headline2),
                Row(
                  children: [
                    Text(contato.toString(), style: Theme.of(context).textTheme.bodyText1),
                    const SizedBox(width: 10),
                    RoundButton(
                      size: 40,
                      icon: const Icon(
                        Icons.edit,
                        size: 20,
                      ),
                      onTap: () {
                        showDialog(
                          barrierDismissible: true,
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              actions: [
                                RoundButton(
                                  size: 50,
                                  icon: const Icon(Icons.cancel_outlined),
                                  onTap: () => Navigator.of(context).pop(),
                                ),
                                RoundButton(
                                  size: 50,
                                  icon: const Icon(Icons.done),
                                  onTap: () {
                                    setState(() {
                                      httpService.updateUserName(nome, contato);
                                    });
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              backgroundColor: Colors.white,
                              content: InputTextBox(
                                textInputType: TextInputType.number,
                                hint: 'Contato',
                                isSearch: false,
                                onChanged: (text) {
                                  contato = int.parse(text);
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text('Morada', style: Theme.of(context).textTheme.headline2),
                Text('${User.street},${User.pc}', style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
          ),
        ));
  }
}
