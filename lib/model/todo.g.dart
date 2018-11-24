// GENERATED CODE - DO NOT MODIFY BY HAND

part of todo;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first
// ignore_for_file: unnecessary_const
// ignore_for_file: unnecessary_new
// ignore_for_file: test_types_in_equals

class _$Todo extends Todo {
  @override
  final String name;
  @override
  final bool isChecked;

  factory _$Todo([void updates(TodoBuilder b)]) =>
      (new TodoBuilder()..update(updates)).build();

  _$Todo._({this.name, this.isChecked}) : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('Todo', 'name');
    }
    if (isChecked == null) {
      throw new BuiltValueNullFieldError('Todo', 'isChecked');
    }
  }

  @override
  Todo rebuild(void updates(TodoBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  TodoBuilder toBuilder() => new TodoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Todo && name == other.name && isChecked == other.isChecked;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, name.hashCode), isChecked.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Todo')
          ..add('name', name)
          ..add('isChecked', isChecked))
        .toString();
  }
}

class TodoBuilder implements Builder<Todo, TodoBuilder> {
  _$Todo _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  bool _isChecked;
  bool get isChecked => _$this._isChecked;
  set isChecked(bool isChecked) => _$this._isChecked = isChecked;

  TodoBuilder();

  TodoBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _isChecked = _$v.isChecked;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Todo other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Todo;
  }

  @override
  void update(void updates(TodoBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Todo build() {
    final _$result = _$v ?? new _$Todo._(name: name, isChecked: isChecked);
    replace(_$result);
    return _$result;
  }
}
