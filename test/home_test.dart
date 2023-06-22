
import 'package:contatos/models/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:contatos/main.dart';

void main() {
  testWidgets('Should render Home screen', (WidgetTester tester) async {
    await tester.pumpWidget(const Contatos());
    final HomeState state = tester.state(find.byType(Home));
    final fab = find.byType(FloatingActionButton);

    //Deve ter um Scaffold
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.text("Contatos"), findsOneWidget);
    expect(fab, findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);

    expect(state.contatoList.isEmpty, true);

    await tester.tap(fab);
    await tester.pumpAndSettle();

    expect(find.text("Novo Contato"), findsOneWidget);

    final nomeTF = find.widgetWithText(TextField, "Nome");
    final telefoneTF = find.widgetWithText(TextField, "Telefone");
    final emailTF = find.widgetWithText(TextField, "E-mail");

    expect(nomeTF, findsOneWidget);
    expect(telefoneTF, findsOneWidget);
    expect(emailTF, findsOneWidget);

    expect(find.widgetWithText(ElevatedButton, "Cancelar"), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, "Adicionar"), findsOneWidget);
  }); 


}