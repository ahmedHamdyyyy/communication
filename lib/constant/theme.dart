import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../feature/Home/cubit/home_state.dart';
import 'color_constant.dart';

ThemeData appThemes(int theme) => theme == 0
    ? ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: backGround[theme],
          elevation: 0,
          toolbarHeight: 55,
          centerTitle: true,
          titleTextStyle:  TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: 20,
            color: text[theme],
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: icons[theme], size: 25),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            elevation: const MaterialStatePropertyAll(10),
            textStyle: const MaterialStatePropertyAll(
              TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            padding: const MaterialStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            ),
          ),
        ),
        cardTheme: CardTheme(
          color: foreGround[theme],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        listTileTheme: ListTileThemeData(iconColor: text[theme]),
        drawerTheme: DrawerThemeData(
          backgroundColor: foreGround[theme],
          width: 275,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(custom[theme]),
          ),
        ))
    : (theme == 1
        ? ThemeData.dark(useMaterial3: true).copyWith(
            useMaterial3: true,
            appBarTheme: AppBarTheme(
              backgroundColor: backGround[theme],
              elevation: 0,
              toolbarHeight: 55,
              centerTitle: true,
              titleTextStyle:  TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 20,
              color:   text[theme],
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
              iconTheme: IconThemeData(color: icons[theme], size: 25),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                elevation: const MaterialStatePropertyAll(10),
                textStyle: const MaterialStatePropertyAll(
                  TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
                padding: const MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                ),
              ),
            ),
            cardTheme: CardTheme(
              color: foreGround[theme],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
            ),
            listTileTheme: ListTileThemeData(iconColor: text[theme]),
            drawerTheme: DrawerThemeData(
              backgroundColor: foreGround[theme],
              width: 275,
            ),
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(custom[theme]),
              ),
            ))
        : ThemeData.dark().copyWith(
            useMaterial3: true,
            scaffoldBackgroundColor: backGround[theme],
            appBarTheme: AppBarTheme(
              backgroundColor: backGround[theme],
              elevation: 0,
              foregroundColor: custom[theme],
              toolbarHeight: 55,
              centerTitle: true,
              titleTextStyle:  TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 20,
                color: text[theme],
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
              iconTheme: IconThemeData(color: icons[theme], size: 25),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                elevation: const MaterialStatePropertyAll(10),
                textStyle: const MaterialStatePropertyAll(
                  TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
                padding: const MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                ),
              ),
            ),
            cardTheme: CardTheme(
              color: foreGround[theme],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
            ),
            listTileTheme: ListTileThemeData(iconColor: text[theme]),
            drawerTheme: DrawerThemeData(
              backgroundColor: foreGround[theme],
              width: 275,
            ),
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(custom[theme]),
              ),
            ),
          ));

void systemTheme(HomeState state) => SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness:
            state.currentTheme == 0 ? Brightness.light : Brightness.dark,
        statusBarColor: backGround[state.currentTheme],
        systemNavigationBarColor: primaryColor[state.currentTheme],
        systemNavigationBarIconBrightness:
            state.currentTheme == 0 ? Brightness.dark : Brightness.light,
      ),
    );
