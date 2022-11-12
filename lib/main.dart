import 'package:contentbudddy/screen/AddScreen.dart';
import 'package:contentbudddy/screen/EditScreen.dart';
import 'package:contentbudddy/screen/HomeScreen.dart';
import 'package:contentbudddy/screen/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    routes: <String, WidgetBuilder>{
      '/home': (context) => const HomeScreen(),
      '/edit':(context) => const EditScreen(),
      '/add':(context) => const AddScreen(),
      '/splash':(context) => const SplashScreen(),
    },
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var items = List<String>.generate(100, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 70.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white70,
                  minRadius: 60.0,
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage: NetworkImage(
                        'https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e03cfd8ce2855d217d157c93060da490&v=4'),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const <Widget>[
                Text(
                  "Udara San",
                  style: TextStyle(fontSize: 35.0),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const <Widget>[
                Text(
                  "Read and Listen To Sentences Using the Word",
                  style: TextStyle(fontSize: 15.0),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                const SizedBox(
                  height: 70,
                ),
                IconButton(
                  icon: const Icon(Icons.menu),
                  iconSize: 30,
                  onPressed: () {
                    Navigator.of(context).pushNamed('/home');
                  },
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.search),
                  iconSize: 30,
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  iconSize: 30,
                  onPressed: () {},
                ),
              ],
            ),
            Row(
              children: const [
                SizedBox(
                  height: 30,
                  child: (Text("Recently Added")),
                )
              ],
            ),
            Flexible(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: items.length,
                    itemBuilder: (context, index)  {
                     return ListTile(
                       title: Text("Udara San"),
                       subtitle: Text(items[index]),
                     );
                    },
                )),
          ],
        ),
      ),
    );
  }
}
