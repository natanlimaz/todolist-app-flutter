import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/services/shared_preferences_service.dart';

class AddTaskScreen extends StatefulWidget {

  const AddTaskScreen({super.key, this.title, this.index});

  final String? title;
  final int? index;

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();

}

class _AddTaskScreenState extends State<AddTaskScreen>{

  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller = TextEditingController(text: widget.title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              filled: true,
              hintStyle: TextStyle(color: Colors.grey[800]),
              hintText: 'Nome da Tarefa',
              fillColor: Colors.white70,
              
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          margin: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: ElevatedButton(
            onPressed: () async {
              if(controller.text.isNotEmpty) {
                final sharedPreferences = await SharedPreferences.getInstance();

                if(widget.title?.isEmpty ?? false) {
                  SharedPreferencesService(sharedPreferences).addTask(controller.text);
                }
                else {
                  SharedPreferencesService(sharedPreferences).updateTask(widget.index ?? 0, controller.text);
                }
                
                Navigator.of(context).pop();
              }
            },
            child: const Text(
              'Adicionar Tarefa',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ],),
    );
  }
}