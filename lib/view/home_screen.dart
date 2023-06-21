import 'package:app_exceptions/model/movies_model.dart';
import 'package:app_exceptions/utils/routes/routes_name.dart';
import 'package:app_exceptions/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/response/status.dart';
import '../view_model/home_view_model.dart';
import '../view_model/user_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();

  @override
  void initState() {
    // TODO: implement initState
    homeViewViewModel.fetchMoviesListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPrefernece = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: () {
                userPrefernece.remove().then((value) {
                  Navigator.pushNamed(context, RoutesName.login);
                });
              },
              child: Center(
                  child: Text(
                'Logout',
                style: TextStyle(fontSize: 20),
              ))),
          SizedBox(
            width: 20,
          )
        ],
      ),

      body: ChangeNotifierProvider<HomeViewViewModel>(
        create: (BuildContext context) => homeViewViewModel,
        child: Consumer<HomeViewViewModel>(builder: (context, value, _)
        {
          switch (value.movieList.status)
          {
            case Status.LOADING:
              return Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Center(child: Text(value.movieList.message.toString()));
            case Status.COMPLETED:
              return ListView.builder(
                  itemCount: value.movieList.data!.movies!.length,
                  itemBuilder: (context,index){
                return Card(
                  child: ListTile(
                    leading: Image.network(value.movieList.data!.movies![index].posterurl.toString(),
                    errorBuilder:(context,error,stack){
                      return Icon(Icons.error,color: Colors.red,);
                    },
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    ),
                    title: Text(value.movieList.data!.movies![index].title.toString()),
                    subtitle: Text(value.movieList.data!.movies![index].year.toString()),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(Utils.averageRating(value.movieList.data!.movies![index].ratings!).toString()),
                        Icon(Icons.star,color: Colors.yellow,)
                      ],
                    ),
                  )
                );
              });
            default:

              return Container(
                child: Text('hey'),
              );
          }

        }),
      ),
    );

  }
}
