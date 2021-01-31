import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:provider_shopper/main.dart';

void main() {
  testWidgets("Testing our catalog app", (widgetTester) async {
    // Step 1 Build & pump the app
    await widgetTester.pumpWidget(MyApp());

    final welcomeText = find.text("Welcome");

    expect(welcomeText, findsOneWidget);

    // Step 2 Finding username and writing test

    final usernameField = find.byKey(Key("userKey"));

    await widgetTester.enterText(usernameField, "Pawan");

    final pawanText = find.text("Pawan");

    expect(pawanText, findsOneWidget);

    // Step 3 Click enter and go to next screen

    // final enterButton = find.byElementType(ElevatedButton);
    final enterButton = find.text("ENTER");

    await widgetTester.tap(enterButton);
    await widgetTester.pumpAndSettle();

    final catalogText = find.text("Catalog");
    expect(catalogText, findsOneWidget);

    // Step 4 Cart should be empty
    final cartButton = find.byIcon(Icons.shopping_cart);

    await widgetTester.tap(cartButton);
    await widgetTester.pumpAndSettle();

    expect(find.text("\$0"), findsOneWidget);

    // Step 5 Buy an item and test it

    await widgetTester.pageBack();
    await widgetTester.pumpAndSettle();

    final addButton = find.text("ADD").first;

    await widgetTester.tap(addButton);

    await widgetTester.tap(cartButton);
    await widgetTester.pumpAndSettle();

    expect(find.text("\$0"), findsNothing);
  });
}
