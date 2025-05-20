import 'package:filter_listview_cubit/cubit/player_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BlocProvider<PlayerCubit>(
        create: (context) => PlayerCubit(),
        child: MyHomePage(title: 'Filter Listview'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
  
  
    return Scaffold(
      appBar: AppBar(
   
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    
        title: Text(widget.title),
      ),
      body: Padding(padding: EdgeInsets.all(10),
      child: Column(children: [SizedBox(height: 20,   
      
      ),
      TextField(onChanged: (value) {
        context.read<PlayerCubit>().filterPlay(value);
      },
      decoration: InputDecoration(  
        labelText: "Search",
        suffixIcon: Icon(Icons.search),

      ),
      ),

      SizedBox(height: 20),
     Expanded(child: BlocBuilder<PlayerCubit, PlayerState>(
      builder: (context,state){
        if(state is PlayerInitialState){
          return buildPlayerList(state.players);
        }
         else if(state is PlayerFilteredState){
          return buildPlayerList(state.filteredplayers);

      }
        return Container();}
      ))

      ],
      ),
      )
    // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  Widget buildPlayerList(List<Map<String, dynamic>>players )
  {
     return ListView.builder(
      itemCount: players.length,
      itemBuilder: (context, index){
        final player=players[index];
        return ListTile(
            title: Text(player['name'])  ,
            subtitle: Text(player['country']),
         );
      });
  }
}
