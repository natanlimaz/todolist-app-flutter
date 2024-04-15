import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SharedPreferencesService {
  final SharedPreferences sharedPreferences;

  // Construtor
  SharedPreferencesService(this.sharedPreferences);

  // Função para mostrar Toast ao executar uma acao
  void showNotification(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
  
  // Eu poderia ter utilizado um objeto personalizado User(), porem, como a ideia eh ser simples e implementar o CRUD e tals, 
  // optei por fazer a tarefa como uma String simples mesmo.

  Future<void> addTask(String value) async {
    final result = sharedPreferences.getStringList('items');
    result?.add(value);
    await sharedPreferences.setStringList('items', result ?? []);
    
    showNotification('Tarefa adicionada!');
  }

  Future<List<String>> getTasks() async {
    return sharedPreferences.getStringList('items') ?? [];
  }

  Future<void> removeTask(int index) async {
    final result = sharedPreferences.getStringList('items');
    result?.removeAt(index);
    await sharedPreferences.setStringList('items', result ?? []);
    showNotification('Tarefa removida!');
  }

  Future<void> updateTask(int index, String value) async {
    final result = sharedPreferences.getStringList('items');
    result?.removeAt(index);
    result?.insert(index, value);
    await sharedPreferences.setStringList('items', result ?? []);
    showNotification('Tarefa atualizada!');
  }
}