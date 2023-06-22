import 'package:contatos/main.dart';
import 'package:contatos/models/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  group("Home screen function test", () { 
    testWidgets("Should add itens to the list", (WidgetTester tester) async{
      await tester.pumpWidget(const Contatos());
      final HomeState state = tester.state(find.byType(Home));

      expect(state.contatoList.isEmpty, true);

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();
      await tester.enterText(find.widgetWithText(TextField, "Nome"), "Manuel Gomes");
      await tester.enterText(find.widgetWithText(TextField, "Telefone"), "111");
      await tester.enterText(find.widgetWithText(TextField, "E-mail"), "manuel@teste.com");

      await tester.tap(find.widgetWithText(ElevatedButton, "Adicionar"));
      await tester.pumpAndSettle();
      expect(state.contatoList.isEmpty, false);

    });
  });

  testWidgets("Should render new contact", (WidgetTester tester) async{
      await tester.pumpWidget(const Contatos());
      final HomeState state = tester.state(find.byType(Home));

      expect(state.contatoList.isEmpty, true);

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();
      await tester.enterText(find.widgetWithText(TextField, "Nome"), "Manuel Gomes");
      await tester.enterText(find.widgetWithText(TextField, "Telefone"), "111");
      await tester.enterText(find.widgetWithText(TextField, "E-mail"), "manuel@teste.com");

      await tester.tap(find.widgetWithText(ElevatedButton, "Adicionar"));
      await tester.pumpAndSettle();
      expect(state.contatoList.isEmpty, false);
      
      expect(find.byType(Card), findsOneWidget);
      expect(find.textContaining("Manuel Gomes"), findsOneWidget);
      expect(find.textContaining("111"), findsOneWidget);
      expect(find.textContaining("manuel@teste.com"), findsOneWidget);
  
  });
 

}