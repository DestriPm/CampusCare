import 'package:flutter_test/flutter_test.dart';
import 'package:project_utama/main.dart';

void main() {
  testWidgets('CampusCare Login UI Test', (WidgetTester tester) async {
    // Jalankan aplikasi CampusCare
    await tester.pumpWidget(const CampusCareApp());

    // Pastikan judul CampusCare muncul di layar
    expect(find.text('CampusCare'), findsOneWidget);

    // Pastikan kolom input email dan kata sandi ada
    expect(find.text('Email Kampus / Mahasiswa'), findsOneWidget);
    expect(find.text('Kata Sandi'), findsOneWidget);

    // Pastikan tombol Masuk ada
    expect(find.text('Masuk'), findsOneWidget);
  });
}