import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

main() async {
  // if your flutter > 1.7.8 :  ensure flutter activated
  WidgetsFlutterBinding.ensureInitialized();

  LIST_OF_LANGS = ['ar', 'en']; // define languages
  LANGS_DIR = 'assets/langs/'; // define directory
  await translator.init(); // intialize

  runApp(LocalizedApp(child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      localizationsDelegates: translator.delegates,
      locale: translator.locale,
      supportedLocales: translator.locals(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // String testText = 'google translate test';
  final GlobalKey<ScaffoldState> scaffoldState = new GlobalKey<ScaffoldState>();
  showSnackBar() {
    scaffoldState.currentState.showSnackBar(SnackBar(
      backgroundColor: Colors.grey.shade400,
      content: GestureDetector(
          onTap: () {
            translator.setNewLanguage(
              context,
              newLanguage: translator.currentLanguage == 'ar' ? 'en' : 'ar',
              remember: true,
              restart: true,
            );
          },
          child: Text(
          translator.translate('appTitle'),
          style: TextStyle(
              color: Colors.black,
          ),
          )),
    ));
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      showSnackBar();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      body: Scrollbar(
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(icon: Icon(Icons.more_vert), onPressed: (){
                  showSnackBar();
                }),
                Container(
                  width: MediaQuery.of(context).size.width * .7,
                  //height: 40.0,
                  decoration: BoxDecoration(
                    //color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Center(
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 14.0,
                        ),
                        filled: true,
                        fillColor: Colors.white30,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                          ),
                        ),
                        hintText: translator.translate('textFieldArea'),
                        hintStyle: TextStyle(
                            color: Colors.grey.shade300, fontSize: 15.0),
                      ),
                    ),
                  ),
                ),
                IconButton(icon: Icon(Icons.arrow_forward_ios,size: 17.0,color: Colors.grey.shade600,), onPressed: (){}),

              ],
            ),
            SizedBox(
              height: 25.0,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 30.0, top: 20.0),
                child: Text(
                  translator.translate('MainHead'),
                  style: TextStyle(
                      color: Colors.blue.shade900,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left:30.0,right: 30.0),
                  child: Container(
                    //width: 200.0,
                    height: 75.0,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     textDirection: TextDirection.ltr,
                     children: <Widget>[
                       Column(
                         children: <Widget>[
                           SizedBox(height: 16.0,),
                          Padding(
                            padding: const EdgeInsets.only(left:44.0),
                            child: Text(translator.translate('firstRowTitle')),
                          ),
                           SizedBox(height: 6.0,),
                          Padding(
                            padding: const EdgeInsets.only(left:64.0),
                            child: Text(translator.translate('firstRowTitle2'),
                            style: TextStyle(
                              color: Colors.cyan,
                              fontSize: 14.0
                            ),
                            ),
                          ),
                         ],
                       ),
                       Padding(
                         padding: const EdgeInsets.all(18.0),
                         child: Align(
                             alignment: Alignment.centerLeft,
                             child: Image.asset('assets/image/Group 3019.png')),
                       ),
                     ],
                   ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:20.0,top: 15.0),
                  child: Align(
                    alignment: Alignment.centerLeft ,
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Center(
                        child: IconButton(icon: translator.currentLanguage == 'ar' ? Icon(Icons.arrow_forward_ios) : Icon(Icons.arrow_back_ios),
                          onPressed: (){},iconSize: 15.0,),
                      ),
                    ),
                  ),
                ),
              ],
            ),


            SizedBox(
              height: 25.0,
            ),
            Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left:30.0,right: 30.0),
                  child: Container(
                    //width: 200.0,
                    height: 75.0,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      textDirection: TextDirection.ltr,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            SizedBox(height: 16.0,),
                            Padding(
                              padding: const EdgeInsets.only(left:44.0),
                              child: Text(translator.translate('secondRowTitle')),
                            ),
                            SizedBox(height: 6.0,),
                            Padding(
                              padding: const EdgeInsets.only(left:64.0),
                              child: Text(translator.translate('secondRowTitle2'),
                                style: TextStyle(
                                    color: Colors.cyan,
                                    fontSize: 14.0
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Image.asset('assets/image/Group 3025.png')),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:20.0,top: 15.0),
                  child: Align(
                    alignment: Alignment.centerLeft ,
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Center(
                        child: IconButton(icon: translator.currentLanguage == 'ar' ? Icon(Icons.arrow_forward_ios) : Icon(Icons.arrow_back_ios),
                          onPressed: (){},iconSize: 15.0,),
                      ),
                    ),
                  ),
                ),
              ],
            ),






            SizedBox(
              height: 25.0,
            ),
            Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left:30.0,right: 30.0),
                  child: Container(
                    //width: 200.0,
                    height: 75.0,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      textDirection: TextDirection.ltr,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            SizedBox(height: 16.0,),
                            Padding(
                              padding: const EdgeInsets.only(left:44.0),
                              child: Text(translator.translate('thirdRowTitle')),
                            ),
                            SizedBox(height: 6.0,),
                            Padding(
                              padding: const EdgeInsets.only(left:64.0),
                              child: Text(translator.translate('thirdRowTitle2'),
                                style: TextStyle(
                                    color: Colors.cyan,
                                    fontSize: 14.0
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Image.asset('assets/image/Group 3022.png')),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:20.0,top: 15.0),
                  child: Align(
                    alignment: Alignment.centerLeft ,
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Center(
                        child: IconButton(icon: translator.currentLanguage == 'ar' ? Icon(Icons.arrow_forward_ios) : Icon(Icons.arrow_back_ios),
                          onPressed: (){},iconSize: 15.0,),
                      ),
                    ),
                  ),
                ),
              ],
            ),











          ],
        ),
      ),
    );
  }
}
