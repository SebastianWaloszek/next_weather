import 'dart:async';

mixin RefreshablePage {
  Completer<void> refreshCompleter;

  void initRefreshCompleter() {
    refreshCompleter = Completer<void>();
  }

  void handleRefreshCompletion() {
    refreshCompleter?.complete();
    refreshCompleter = Completer();
  }
}
