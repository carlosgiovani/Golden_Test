import 'package:golden_test/main.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testGoldens('Teste Golden Test', (tester) async {
    loadAppFonts();

    final builder = DeviceBuilder()

      // cria testes nos device indicados
      ..overrideDevicesForAllScenarios(devices: [
        Device.phone,
        Device.iphone11,
        Device.tabletPortrait,
        Device.tabletLandscape,
      ])
      ..addScenario(
        name: 'pagina principal',
        widget: const MyApp(),
      );

    await tester.pumpDeviceBuilder(builder);

    // cria as imagens, '/main/my_app2' passa onde será salvo no caso cria uma
    // pasta main e um png com nome my_app2
    await screenMatchesGolden(tester, '/main/my_app2');

    // await screenMatchesGolden(tester, 'my_app3');
  });
}
