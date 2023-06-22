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
        itemCount: contatoList.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
      
              title: Text(contatoList[index].nome),
              subtitle: Text(
                "Tel: ${contatoList[index].telefone}\nEmail: ${contatoList[index].email}"
              ),
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          TextEditingController nomeController = TextEditingController();
          TextEditingController telefoneController = TextEditingController();
          TextEditingController emailController = TextEditingController();
          showDialog(
          context: context,
          builder: (context){
            return AlertDialog(
              title: const Text("Novo Contato"),
              content: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: "Nome",
                    ),
                    controller: nomeController,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: "Telefone",
                    ),
                    controller: telefoneController,
                    
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: "E-mail",
                    ),
                    controller: emailController,
                    
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cancelar"),
                ),
                ElevatedButton(
                  onPressed: (){
                    if(nomeController.text.isNotEmpty && telefoneController.text.isNotEmpty && emailController.text.isNotEmpty){
                      setState(() {
                        final contato = Contato(nome: nomeController.text.toString(), telefone: telefoneController.text.toString(), email: emailController.text.toString());
                        contatoList.add(contato);
                      });
                    }
                    Navigator.of(context).pop();
                  }, 
                  child: const Text("Adicionar"),
                ),
              ],
            );
          });
        },
      ),
    );
  }
}