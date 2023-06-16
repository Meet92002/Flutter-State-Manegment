import 'package:app_exceptions/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/user_view_model.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
   final userPrefernece = Provider.of<UserViewModel>(context);
    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [
            InkWell(
        onTap: (){
        userPrefernece.remove().then((value){
        Navigator.pushNamed(context, RoutesName.login);
    });
    },
        child: Text('Logout'))
          ],
        ),
      ),
    );
  }
}
