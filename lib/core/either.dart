class Either<L, R> {
  final L? _left;
  final R? _right;

  Either._(this._left, this._right);

  factory Either.left(L value) => Either._(value, null);
  factory Either.right(R value) => Either._(null, value);

  bool isLeft() => _left != null;
  bool isRight() => _right != null;

  L? get left => _left;
  R? get right => _right;

  Either<L, R2> map<R2>(R2 Function(R) fn) {
    if (isRight()) {
      return Either.right(fn(_right!));
    }
    return Either.left(_left!);
  }

  Either<L2, R> mapLeft<L2>(L2 Function(L) fn) {
    if (isLeft()) {
      return Either.left(fn(_left!));
    }
    return Either.right(_right!);
  }

  R2 fold<R2>(R2 Function(L) ifLeft, R2 Function(R) ifRight) {
    if (isLeft()) {
      return ifLeft(_left!);
    }
    return ifRight(_right!);
  }
}
