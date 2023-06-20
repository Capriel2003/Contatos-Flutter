import 'package:contatos/models/contato.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test("Show build a valid Contact", () {
    Contato contato = 
      const Contato(
        nome: "Manuel Gomes", 
        telefone: "111", 
        email:"a@b.com"
      );

    expect(contato.nome, "Manuel Gomes");
  });
}