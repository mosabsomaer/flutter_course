import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './task_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TaskModel> completedTasks = [];
  List<TaskModel> inProgress = [];

  List<TaskModel> tasks = [
    //TaskModel(title: 'make an app'),
    //TaskModel(title: 'make an account'),
    //TaskModel(title: 'make an icon')
  ];
  TextEditingController titlecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("LIMU TO DO"),
        ),
        body:  DefaultTabController(
          length: 2,
          child: Column(
            children: [
              const TabBar(
                labelColor: Colors.black,
                tabs: [Tab(text: "in Progress"), Tab(text: "Completed")],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Center(child: ListView.builder(
             itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                 title: Text(tasks[index].title),
                  trailing: Checkbox(
                   value: tasks[index].isCompleted,
                    onChanged: (value) {
                      setState(() {
                        tasks[index].isCompleted = !tasks[index].isCompleted;
                     });
                   },
                 ),
               );
              }
           )),
                    Center(child: const Icon(Icons.check))
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}


        





    
      // ,floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     showDialog(
      //         context: context,
      //         builder: (context) {
      //           return  Dialog(
      //             child: Padding(
      //               padding: const EdgeInsets.all(24.0),
      //               child: Column(
      //                 mainAxisSize: MainAxisSize.min,
      //                 children: [
      //                   const Text(
      //                     "Add New Task!",
      //                     style: TextStyle(
      //                         fontSize: 16, fontWeight: FontWeight.bold),
      //                   ),
      //                    TextField(
      //                     decoration: const InputDecoration(
      //                       hintText: 'Enter Task Name',
      //                     ),
      //                     controller: titlecontroller,
      //                   ),Row(
      //                     children: [
      //                       TextButton(onPressed: (){titlecontroller.clear();
      //                         Navigator.pop(context);}, child: const Text("Cancel")),
      //                       ElevatedButton(
      //                         onPressed: (){
      //                           if(titlecontroller.text.isNotEmpty){
      //                             tasks.add(TaskModel(title: titlecontroller.text));
      //                             titlecontroller.clear();
      //                             Navigator.pop(context);
      //                             setState(() {});
      //                           }
      //                         },
      //                         child: const Text("Add Task"),
      //                       ),
      //                     ],
      //                   )
      //                 ],
      //               ),
      //             ),
      //           );
      //         });
      //   },
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), 