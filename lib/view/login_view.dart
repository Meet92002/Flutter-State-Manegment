import 'package:app_exceptions/res/components/round_button.dart';
import 'package:app_exceptions/utils/utils.dart';
import 'package:app_exceptions/view/home_screen.dart';
import 'package:app_exceptions/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/routes/routes_name.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ValueNotifier<bool> _obsecurePassword =ValueNotifier<bool>(true);
  TextEditingController _emailContoller = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _emailContoller.dispose();
    _passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height*1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailContoller,
                keyboardType: TextInputType.emailAddress,
                focusNode: emailFocusNode,
                decoration: InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.alternate_email)

                ),
              onFieldSubmitted: (value){
                Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
              },
            ),
            ValueListenableBuilder(valueListenable: _obsecurePassword, builder: (context,value,child)
            {
              return TextFormField(
                obscureText: _obsecurePassword.value,
                controller: _passwordController,
                focusNode: passwordFocusNode,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  hintText: 'Password',
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock_open_outlined ),
                  suffixIcon: InkWell(
                      onTap: (){
                        _obsecurePassword.value = !_obsecurePassword.value;
                      },
                      child: Icon(_obsecurePassword.value ? Icons.visibility_off_outlined:Icons.visibility_outlined)),

                ),
              );
            }
            ),

            SizedBox(
              height: height * .1
            ),
            RoundButton(title: 'Login',
                loading: authViewModel.loading,
                onPress: (){
                if(_emailContoller.text.isEmpty){
                    Utils.flushBArErrorMessage('Please Enter email', context);
                }else if(_passwordController.text.isEmpty){
                    Utils.flushBArErrorMessage('Please Enter Password', context);
                }else if(_passwordController.text.length<6){
                  Utils.flushBArErrorMessage('Please Enyer 6 digits password', context);
                }else{
                  // Map data ={
                  //   'email': _emailContoller.text.toString(),
                  //   'password':_passwordController.text.toString()
                  // };
                  Map data ={
                    'email': "eve.holt@reqres.in",
                    'password':"cityslicka",
                  };
                  authViewModel.loginApi(data, context);
                  print('Api Hit');
                }
            }),
            SizedBox(height: height * .02,),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, RoutesName.signUp);
              },
                child: Text("Don't have an accont ? Sign Up "))
          ],


          // child: InkWell(
          //   onTap: (){
          //     Utils.snakBar('No Internet Connnection', context);
          //     Utils.flushBArErrorMessage('No Internet Connnection', context);
          //     Utils.toastMessage('No Internet Connection');
          //     // Navigator.pushNamed(context,RoutesName.home);
          //     // Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen()));
          //   },
          //   child: Text('click'),
          // ),

        ),
      ),
    );
  }
}