import 'package:bionic_book_reader/pages/main_page/main_page.dart';
import 'package:bionic_book_reader/route/app_router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;

void main() {
  runApp(MyApp());

  /*To prevent "Got a stack frame from package:stack_trace,
    where a vm or web frame was expected" error, because riverpod produces
    a different format of stack trace to that produced by the VM*/
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };
}

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    debugPrint('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "$newValue"
}''');
  }

  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value,
      ProviderContainer container) {
    debugPrint(''' ${provider.name} added ''');
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      observers: [Logger()],
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        title: 'Bionic Book Reader',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
