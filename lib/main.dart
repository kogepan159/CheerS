import 'package:cheers_app/di/providers.dart';
import 'package:cheers_app/style.dart';
import 'package:cheers_app/view/home_screen.dart';
import 'package:cheers_app/view/login/screens/login_screen.dart';
import 'package:cheers_app/view_models/login_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';
import 'package:timeago/timeago.dart' as timeAgo;


void main() async{

  //投稿された時間（〜時間前）を設定
  timeAgo.setLocaleMessages("ja", timeAgo.JaMessages());


  //firebase1破壊的変更対応
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
      MultiProvider(
        providers: globalProviders,
        child: MyApp(),
      ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

   final loginViewModel = Provider.of<LoginViewModel>(context, listen: false);

    return MaterialApp(
      title: "CheerS",
      debugShowCheckedModeBanner: false,
      //ローカライゼーション対応
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,


      //アプリ全体の色、フォント設定
      theme: ThemeData(
        brightness: Brightness.light,
        buttonColor: Colors.deepOrange,
        primarySwatch: Colors.deepOrange,
        primaryIconTheme: IconThemeData(
          color: Colors.white,
        ),
        iconTheme: IconThemeData(
          color: Colors.deepOrange,
        ),
        fontFamily: RegularFont,
      ),
      //登録済みがどうかを非同期処理で確認。
      //登録済みの人はトップページへ移動。してない人は登録画面に誘導するため。
      home:
      FutureBuilder(
        future: loginViewModel.isSignIn(),
        builder: (context, AsyncSnapshot<bool> snapshot){
          //hasDataはbool型。userRepositoryで真偽判定
          if(snapshot.hasData && snapshot.data){
            return HomeScreen();
          }else{
            return
              LoginScreen();
          }
        },
      ),
    );
  }
}
