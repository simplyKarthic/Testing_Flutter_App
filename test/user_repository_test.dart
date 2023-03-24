import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:testapp/user_model.dart';
import 'package:testapp/user_repository.dart';
import 'package:http/http.dart';

class MockHTTPClient extends Mock implements Client {}

void main() {
  late UserRepository userRepository;
  late MockHTTPClient mockHTTPClient;

  setUp(() {
    mockHTTPClient = MockHTTPClient();
    userRepository = UserRepository(mockHTTPClient);
  });

  group("userRepository - ", () {
    group("getUser function", () {
      test("given user Repo when user function called with status 200", () async {
        //Arrange
        when(
          () => mockHTTPClient.get(
            Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
          ),
        ).thenAnswer((invocation) async {
          return Response('''
              {
                "id": 1,
                "name": "Leanne Graham",
                "username": "Bret",
                "email": "Sincere@april.biz",
                "website": "hildegard.org"
              }
          ''', 200);
        });
        //Act
        final user = await userRepository.getUser();
        //Assert
        expect(user, isA<User>()); // check with the user model
      });

      test("if user repo status is not 200", () async {
        //Arrange
        when((() => mockHTTPClient.get(
              Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
            ))).thenAnswer((invocation) async {
          return Response('{}', 500);
        });
        //Act
        final user = userRepository.getUser(); //removed await because we are expecting an exception
        //Assert
        expect(user, throwsException); // check with the user model is throwing exception
      });
    });
  });
}
