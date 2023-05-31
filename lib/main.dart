import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_apicall/provider/user_provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: const MaterialApp(home: MyApp())));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => Provider.of<UserProvider>(context, listen: false).getAllUsers());

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Api Call"),
      ),
      body: Consumer<UserProvider>(
        builder: (context, value, child) {
          final users = value.usersList;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return ListTile(
                  leading: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle),
                      child: Center(child: Text(users[index].id.toString()))),
                  title: Text(users[index].title));
            },
          );
        }
      ),
    );
  }
}
