import 'package:desafio_bluehealth/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Teste da Tela de Login', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.pumpAndSettle();

    expect(find.text('Login'), findsWidgets);
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.text('Esqueceu a Senha?'), findsOneWidget);

    await tester.enterText(find.byType(TextField).at(0), 'blue@exemplo.com');
    await tester.enterText(find.byType(TextField).at(1), '12345678');

    await tester.tap(find.byKey(const Key('login_button')));
    await tester.pump();
  });
}
