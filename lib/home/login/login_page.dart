import 'dart:convert';

import 'package:dystopianapp/components/button_login_widget.dart';
import 'package:dystopianapp/components/text_field_widget.dart';
import 'package:dystopianapp/core/app_colors.dart';
import 'package:dystopianapp/home/widgets/home_model_widget.dart';
import 'package:dystopianapp/home/widgets/wave_widget.dart';
import 'package:dystopianapp/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();

}

void clicandoEmLogin() {
  print('Fazer Login - editando');
}
void clicandoEmCadastro() {
  print('Fazer Cadastro - editando');
}

Future<UserModel> loginUser(String email, String pass) async {

  try {
    // SE EU USAR A URL COM "http://localhost:3030..." PROVAVELMENTE PODE DAR B.O:
    final String apiUrl = "http://192.168.0.108:3030/loginUser";
    final header = {"Content-Type":"application/json"};
    final body = {"email": email, "pass": pass};

    final res = await http.post(Uri.parse(apiUrl),
    headers: header,
    body: jsonEncode(body));

    if (res.statusCode == 201) {
      final String responseStringt = res.body;

      return userModelFromJson(responseStringt);
    } else {
      return null;
    }
  } catch (e) {
    throw (e.message);
  }
  
}

class _LoginPageState extends State<LoginPage> {

  // final _formKey = GlobalKey<FormState>();

  // Future<http.Response> logUser() async {
  //   // return print('cahmandooo');
  //   try {
      
  //   } catch (e) {
  //     throw (e.message);
  //   }
  //   var res = await http.post(Uri.parse('http://localhost:3030/loginUser'), headers: <String, String> {
  //     'Content-Type':'application/json; charset=UTF-8'
  //   },
  //   body: <String, String> {
  //     'email': user.email,
  //     'pass': user.pass
  //   });

  //   print(res.body);
  // }

  UserModel _user = UserModel();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final model = Provider.of<HomeModelWidget>(context);
    final size = MediaQuery.of(context).size;
    final bool keyBoardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return GestureDetector(
      onTap: () {
        FocusNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: Stack(
          children: <Widget> [

            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeOutQuad,
              top: keyBoardOpen ? -size.height / 3.7 : 0.0,
              child: WaveWidget(
                size: size,
                yOffset: size.height / 3.0,
                // color: AppColors.black,
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: keyBoardOpen ? null : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  Column(
                    children: [
                      SvgPicture.asset('assets/images/dj-marshmallow.svg',width: 150,),
                      Text(
                        'Login',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 40.0,
                          fontWeight: FontWeight.w900
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget> [
                  TextFieldWidget(
                    typeKeyBoard: TextInputType.emailAddress,
                    hintText: 'Email',
                    prefixIconData: Icons.mail_outline,
                    suffixIconData: model.isValid ? Icons.check : null,
                    obscureText: false,
                    onChanged: (value) {
                      // model.isValidEmail(value);
                      this._user.email = value;
                      
                      print('Olha o valor do email: ' + this._user.email);
                    },
                    myController: emailController,
                  ),

                  SizedBox(height: 10.0,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget> [
                      TextFieldWidget(
                        hintText: 'Senha', 
                        prefixIconData: Icons.lock_outline,
                        suffixIconData: model.isVisible ? Icons.visibility : Icons.visibility_off,
                        obscureText: model.isVisible ? false: true,
                        onChanged: (value) {
                          this._user.pass = value;

                          print('Olha o valor da senha: ' + this._user.pass);
                        },
                        myController: passController,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Esqueceu a senha?',
                        style: TextStyle(
                          color: AppColors.lightGrey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),

                  ButtonLoginWidget(
                    title: 'Login',
                    hasBorder: false,
                    actionProp: () async {

                      final String emailControl = emailController.text;
                      final String passControl = passController.text;

                      final UserModel userParam = await loginUser(emailControl, passControl);

                      setState(() {
                        _user = userParam;

                        print(this._user);
                      });

                      // if (_formKey.currentState.validate()) {
                      //   loginUser(this.user.email, this.user.pass);
                      // }
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  ButtonLoginWidget(
                    title: 'Cadastrar',
                    hasBorder: true,
                    actionProp: clicandoEmCadastro,
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}