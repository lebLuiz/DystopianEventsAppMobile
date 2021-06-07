import 'package:dystopianapp/components/button_login_widget.dart';
import 'package:dystopianapp/components/text_field_widget.dart';
import 'package:dystopianapp/core/app_colors.dart';
import 'package:dystopianapp/home/widgets/home_model_widget.dart';
import 'package:dystopianapp/home/widgets/wave_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();

}

void clicandoEmLogin() {
  print('Fazer Login');
}
void clicandoEmCadastro() {
  print('Fazer Cadastro');
}

class _LoginPageState extends State<LoginPage> {
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
                    hintText: 'Email', 
                    prefixIconData: Icons.mail_outline,
                    suffixIconData: 
                      model.isValid ? 
                      Icons.check 
                      : 
                      null,
                    obscureText: false,
                    onChanged: (value) {
                      model.isValidEmail(value);
                    },
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
                    actionProp: clicandoEmLogin,
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