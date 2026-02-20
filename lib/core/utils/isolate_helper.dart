import 'package:flutter/foundation.dart';

/// The Warp Core: Helper for managing background isolates
class IsolateHelper {
  /// Runs a heavy computation in a background isolate.
  /// 
  /// [callback] is the static or top-level function to run.
  /// [message] is the argument to pass to [callback].
  /// 
  /// Wraps [compute] to provide a unified entry point and simplified error handling.
  static Future<R> run<M, R>(ComputeCallback<M, R> callback, M message) async {
    try {
      return await compute(callback, message);
    } catch (e, stack) {
      debugPrint('[IsolateHelper] Warp Core Failure: $e\n$stack');
      rethrow;
    }
  }
}
