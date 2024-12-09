import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/blocs/forgot_password/forgot_password_bloc.dart';
import 'data/blocs/home/home_bloc.dart';
import 'data/blocs/login/login_bloc.dart';
import 'data/services/api/api.dart';
import 'router/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Api().logDataFromApi();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State createState() => _AppState();
}

class _AppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeBloc()),
        BlocProvider(create: (_) => LoginBloc()),
        BlocProvider(create: (_) => ForgotPasswordBloc()),
        // add  each provider for each screen in the future
      ],
      child: MaterialApp.router(
        builder: (context, child) {
          final data = MediaQuery.of(context);
          return MediaQuery(
            data: data.copyWith(textScaler: const TextScaler.linear(1.0)),
            child: child ?? Container(),
          );
        },
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter.config(),
        theme: ThemeData(useMaterial3: false),
      ),
    );
  }
}
