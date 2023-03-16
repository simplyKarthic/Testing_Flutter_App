import 'package:flutter_test/flutter_test.dart';
import 'package:testapp/counter.dart';

void main() {
  //given - when - then: for naming test
  //Pretest -> testing - Posttest
  late Counter counter;
  //Pre-test
  setUp(() {
    counter = Counter();
  }); //called before each test
  //setUpAll(() => null); //called once before all the tests happens

  group('counter Class - ', () {
    test('given counter class when its instanted then the value of count should be 0', () {
      //arrange
      final val = counter.count; //act
      expect(val, 0); //assert
    });

    test('when increase is called value should be updated', () {
      counter.incrementcounter();
      final incVal = counter.count;
      expect(incVal, 1);
    });

    test('when decrease is called value should be decreased', () {
      counter.decrementcounter();
      final decVal = counter.count;
      expect(decVal, -1); //unit test be independent of each other
    });
    test('when reset is called the counter should be 0', () {
      counter.resetcounter();
      final resVal = counter.count;
      expect(resVal, 0); //unit test be independent of each other
    });
  });

  //Post-test
  //tearDown(() => null); //teardown after each test
  //tearDownAll(() => null); // teardownall will be called after all test
}
