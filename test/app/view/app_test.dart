import 'package:bespoke_app/app/app.dart';
import 'package:bespoke_app/auth/screens/login_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(LoginScreen), findsOneWidget);
    });
  });
}
