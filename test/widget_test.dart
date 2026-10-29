import 'package:flutter_test/flutter_test.dart';
import 'package:latihan_006/main.dart';

void main() {
  testWidgets('Profile smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MainApp());
    expect(find.text('Profil Pengguna'), findsOneWidget);
  });
}
