# testapp
A new project to implement testing methods in flutter.

These tests are to test the positive test flow of the application
#unit testing if data is comming from a api or other Dependecy plugin
- http request can :
    1. give the expected responce
    2. unexpected Error 
    3. wrong response 
    4. can be null if the request cant reach the server

- user repo created -> initilised -> check for expected response
    # but these are not in isolation a successful response of user repo affects the test for exception in user repo
    # in the constructor we are doing the dependency injection using Client 

- to over come this we do dependency injection using mock package
    # user id dependent on http package so make it a constructor
    # before the test happens use: when get is called using mockhttp (user -> mock -> get -> thenAnswer) to deside the expected output of the test

    