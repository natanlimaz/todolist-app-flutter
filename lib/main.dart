import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/add_task/add_task_screen.dart';
import 'package:todoapp/services/shared_preferences_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  final searchBar = TextEditingController();

  SharedPreferencesService? service;
  List<String> listData = [];
  List<String> _list = [];
  String _searchText = '';

  @override
  void initState() {
    super.initState();
    initSharedPreferences();
  }

  // sempre que eu retornar para a tela principal, irei atualizar a tela para garantir que as tarefas que estao sendo mostradas estao atualizadas
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initSharedPreferences();
  }


  initSharedPreferences() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    service = SharedPreferencesService(sharedPreferences);

    // Inicialize a lista de tarefas com todas as tarefas
  _list = await service?.getTasks() ?? [];
  // Atualize a lista filtrada com base no texto de pesquisa atual
  search(_searchText);
  }

  // implementação adicional de um filtro de busca
  void search(String searchText) async {
  setState(() {
    _searchText = searchText;
  });

  // Atualize a lista filtrada apenas se houver um texto de pesquisa
  if (_searchText.isNotEmpty) {
    final lowerSearchText = _searchText.toLowerCase();
    listData = _list.where((data) => data.toLowerCase().contains(lowerSearchText)).toList();
  } else {
    // Se o texto de pesquisa estiver vazio, exiba todas as tarefas
    listData = List.from(_list);
  }
}

// Este método pode ser chamado quando o teclado é fechado
void onKeyboardClosed() {
  // Atualize a lista de dados apenas se houver um texto de pesquisa
  if (_searchText.isNotEmpty) {
    search(_searchText);
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          width: MediaQuery.of(context).size.width,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: Colors.blue),
          ),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.search,
                color: Colors.blue,
                size: 22,
              ),
            ),
            Expanded(
              child: TextField(
                textInputAction: TextInputAction.search,
                maxLines: 1,
                controller: searchBar,
                keyboardType: TextInputType.text,
                textAlignVertical: TextAlignVertical.center,
                onChanged: search,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Buscar pelo nome da tarefa',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                  contentPadding: EdgeInsets.only(left: 0, bottom: 2),
                  focusedBorder: InputBorder.none,
                  filled: true,
                  isDense: true,
                  fillColor: Colors.transparent,
                ),
                style: const TextStyle(
                  fontSize: 18,
                ),
                obscureText: false,
              ),
            ),
          ]),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: listData.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddTaskScreen(title: listData[index], index: index,),),)
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 1,
                    color: Colors.blue,
                  ),
                ),
                margin: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                  bottom: 10,
                ),
                height: 60,
                child:  Row(
                  children: [
                     Expanded(
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.check_circle_outline,
                              color: Colors.blue,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                listData[index],
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            service?.removeTask(index);
                            listData.removeAt(index);
                          });
                        },
                        child: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          
          },
         
                
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddTaskScreen(title: '',),),);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
