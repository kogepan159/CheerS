import 'package:cheers_app/models/repositories/user_repository.dart';
import 'package:flutter/material.dart';


class LoginViewModel extends ChangeNotifier{

  final UserRepository userRepository;
  LoginViewModel({this.userRepository});

  bool isLoading = false;
  bool isSuccessful = false;

  //登録済みがどうかをboolかつ非同期処理で確認
  // 登録済みの人はトップページへ移動。してない人は登録画面に誘導するため。
  Future <bool> isSignIn()async{
    return await userRepository.isSignIn();
  }

 Future <void> signIn() async{
    isLoading = true;
    notifyListeners();

    //isSuccessfulの結果は,loginScreenで使う（userRepository.SignInから値が帰ってきたら、isSuccessful）
    isSuccessful = await userRepository.signIn();

    isLoading = false;
    notifyListeners();

 }

}