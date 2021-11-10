import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shopping_cart/injection.dart';
import 'package:shopping_cart/logic/cart/cart_watcher/cart_watcher_bloc.dart';
import 'routes/router.gr.dart';

class AppWidget extends StatelessWidget {
  final _appRouter = AppRouter();

  AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: () => BlocProvider(
        create: (context) => getIt<CartWatcherBloc>()
          ..add(const CartWatcherEvent.watchStarted()),
        child: MaterialApp.router(
          title: 'Shopping Cart',
          theme: ThemeData.light().copyWith(
            appBarTheme: ThemeData.light().appBarTheme.copyWith(
                  brightness: Brightness.dark,
                  color: const Color(0xFFD8D7DB),
                  iconTheme: ThemeData.light().iconTheme,
                  elevation: 0,
                ),
            iconTheme: ThemeData.light().iconTheme.copyWith(size: 24.r),
            primaryColor: const Color(0xFF131410),
            scaffoldBackgroundColor: const Color(0xFFD8D7DB),
          ),
          debugShowCheckedModeBanner: false,
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
        ),
      ),
    );
  }
}
