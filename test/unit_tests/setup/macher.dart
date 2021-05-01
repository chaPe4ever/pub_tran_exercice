import 'package:flutter_test/flutter_test.dart';

class _FunctionMatcher<T> extends CustomMatcher {
  final dynamic Function(T value) _feature;

  _FunctionMatcher(String name, this._feature, matcher)
      : super('`$name`:', '`$name`', matcher);

  @override
  Object featureValueOf(covariant T actual) => _feature(actual);
}

class HavingMatcher<T> implements TypeMatcher<T> {
  final TypeMatcher<T> _parent;
  final List<_FunctionMatcher<T>> _functionMatchers;

  HavingMatcher(TypeMatcher<T> parent, String description,
      Object Function(T) feature, dynamic matcher,
      [Iterable<_FunctionMatcher<T>> existing])
      : _parent = parent,
        _functionMatchers = [
          ...?existing,
          _FunctionMatcher<T>(description, feature, matcher)
        ];

  @override
  TypeMatcher<T> having(
          Object Function(T) feature, String description, dynamic matcher) =>
      HavingMatcher(_parent, description, feature, matcher, _functionMatchers);

  @override
  bool matches(dynamic item, Map matchState) {
    for (var matcher in <Matcher>[_parent].followedBy(_functionMatchers)) {
      if (!matcher.matches(item, matchState)) {
        addStateInfo(matchState, {'matcher': matcher});
        return false;
      }
    }
    return true;
  }

  @override
  Description describeMismatch(
    dynamic item,
    Description mismatchDescription,
    Map matchState,
    bool verbose,
  ) {
    var matcher = matchState['matcher'] as Matcher;
    matcher.describeMismatch(
        item, mismatchDescription, matchState['state'] as Map, verbose);
    return mismatchDescription;
  }

  @override
  Description describe(Description description) => description
      .add('')
      .addDescriptionOf(_parent)
      .add(' with ')
      .addAll('', ' and ', '', _functionMatchers);
}

class TypeMatcher<T> extends Matcher {
  const TypeMatcher();

  TypeMatcher<T> having(
          Object Function(T) feature, String description, dynamic matcher) =>
      HavingMatcher(this, description, feature, matcher);

  @override
  Description describe(Description description) {
    var name = _stripDynamic(T);
    return description.add("<Instance of '$name'>");
  }

  @override
  bool matches(Object item, Map matchState) => item is T;

  @override
  Description describeMismatch(
    dynamic item,
    Description mismatchDescription,
    Map matchState,
    bool verbose,
  ) {
    var name = _stripDynamic(T);
    return mismatchDescription.add("is not an instance of '$name'");
  }
}

String _stripDynamic(Type type) =>
    type.toString().replaceAll(_dart2DynamicArgs, '');
final _dart2DynamicArgs = RegExp('<dynamic(, dynamic)*>');
