import 'package:contatos/models/contato.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

@visibleForTesting
class HomeState extends State<Home> {
  late List<Contato>contatoList;

  @override
  void initState(){
    super.initState();
    contatoList=[];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contatos"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index){
          return null;
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          showDialog(
          context: context,
          builder: (context){
            return AlertDialog(
              title: const Text("Novo Contato"),
              actions: [
                ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                child: const Text("Cancelar"),),
              ],
            );
          });
        },
      ),
    );
  }
}