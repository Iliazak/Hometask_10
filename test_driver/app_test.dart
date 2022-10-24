// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Login form tests', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    final filedFinderEmail = find.byValueKey('fieldEmail');
    final filedFinderPhone = find.byValueKey('fieldPhone');
    final filedFinderSubmit = find.text('Отправить');

    test('Test Email Field', () async {
      await driver.tap(filedFinderEmail);
      await driver.waitFor(find.text(''));
      await driver.enterText('test@test.com');
      await driver.waitFor(find.text('test@test.com'));
      // await driver.enterText('qwerty');                       //    Проверка на неправильный ввод
      // await driver.waitFor(find.text('qwerty'));              //
    });
    test('Test Phone Field', () async {
      await driver.tap(filedFinderPhone);
      await driver.waitFor(find.text(''));
      // await driver.enterText('qwer8805553535');                 //  Проверка на неправильный ввод
      // await driver.waitFor(find.text('qwer88005553535'));       //
      await driver.enterText('8805553535');
      await driver.waitFor(find.text('88005553535'));
    });

    test('tap on submit button ', () async {
      await driver.tap(filedFinderSubmit);
    });

    test('Success text', () async {
      final success = find.text('Добро пожаловать');
      expect(await driver.getText(success), 'Добро пожаловать');
    });
  });

  group('Rigister form tests', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    final filedFinderSubmitRegistrationPage = find.text('Отправить');
    final filedFinderPhoneRegister = find.byValueKey('fieldPhoneRegister');
    final filedFinderFirstName = find.byValueKey('firstName');
    final filedFinderLastName = find.byValueKey('lastName');

    test('Test Phone Field Register Page', () async {
      await driver.tap(filedFinderPhoneRegister);
      await driver.waitFor(find.text(''));
      // await driver.enterText('qwer8805553535');                 //  Проверка на неправильный ввод
      // await driver.waitFor(find.text('qwer88005553535'));       //
      await driver.enterText('8805553535');
      await driver.waitFor(find.text('88005553535'));
    });

    test('Test First Name ', () async {
      await driver.tap(filedFinderFirstName);
      await driver.waitFor(find.text(''));
      await driver.enterText('Nikita');
      await driver.waitFor(find.text('Nikita'));
      await driver.enterText(''); //   Проверка на неправильный ввод
      await driver.waitFor(find.text(''));
    });

    test('Test Last Name ', () async {
      await driver.tap(filedFinderLastName);
      await driver.waitFor(find.text(''));
      await driver.enterText('Sobolev');
      await driver.waitFor(find.text('Sobolev'));
      await driver.enterText(''); //   Проверка на неправильный ввод
      await driver.waitFor(find.text(''));
    });
    test('tap on submit button ', () async {
      await driver.tap(filedFinderSubmitRegistrationPage);
    });

    test('Success text', () async {
      final success = find.text('Вы успешно зарегистрировались');
      expect(await driver.getText(success), 'Вы успешно зарегистрировались');
    });
  });
}
