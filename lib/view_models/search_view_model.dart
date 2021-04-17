import 'package:cheers_app/data_models/user.dart';
import 'package:cheers_app/models/repositories/user_repository.dart';
import 'package:flutter/material.dart';

class SearchViewModel extends ChangeNotifier{

  final UserRepository userRepository;
  SearchViewModel({ this.userRepository});

  List<User> soughtUsers = List();

  Future<void> searchUsers(String query) async{

    soughtUsers =  await userRepository.searchUsers(query);
  }


}