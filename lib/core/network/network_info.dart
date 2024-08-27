abstract class NetworkInfo {
  Future<bool> get isConneced;
}

class NetworkInfoImpl implements NetworkInfo {
  @override
  // TODO: implement isConneced
  Future<bool> get isConneced => throw UnimplementedError();
}
