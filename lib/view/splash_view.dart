import 'package:app_exceptions/view/services/splash_services.dart';
import 'package:flutter/material.dart';
class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.checkAuthentication(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(
      child: Text('Splash Screen',style: Theme.of(context).textTheme.headline4,),
     ),
    );
  }
}
