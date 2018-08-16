// GENERATED CODE - DO NOT MODIFY BY HAND

part of todo;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_returning_this
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first

Serializer<TodoDto> _$todoDtoSerializer = new _$TodoDtoSerializer();

class _$TodoDtoSerializer implements StructuredSerializer<TodoDto> {
  @override
  final Iterable<Type> types = const [TodoDto, _$TodoDto];
  @override
  final String wireName = 'TodoDto';

  @override
  Iterable serialize(Serializers serializers, TodoDto object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'is_checked',
      serializers.serialize(object.isChecked,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  TodoDto deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new TodoDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'is_checked':
          result.isChecked = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$TodoDto extends TodoDto {
  @override
  final String name;
  @override
  final bool isChecked;

  factory _$TodoDto([void updates(TodoDtoBuilder b)]) =>
      (new TodoDtoBuilder()..update(updates)).build();

  _$TodoDto._({this.name, this.isChecked}) : super._() {
    if (name == null) throw new BuiltValueNullFieldError('TodoDto', 'name');
    if (isChecked == null)
      throw new BuiltValueNullFieldError('TodoDto', 'isChecked');
  }

  @override
  TodoDto rebuild(void updates(TodoDtoBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  TodoDtoBuilder toBuilder() => new TodoDtoBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! TodoDto) return false;
    return name == other.name && isChecked == other.isChecked;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, name.hashCode), isChecked.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TodoDto')
          ..add('name', name)
          ..add('isChecked', isChecked))
        .toString();
  }
}

class TodoDtoBuilder implements Builder<TodoDto, TodoDtoBuilder> {
  _$TodoDto _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  bool _isChecked;
  bool get isChecked => _$this._isChecked;
  set isChecked(bool isChecked) => _$this._isChecked = isChecked;

  TodoDtoBuilder();

  TodoDtoBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _isChecked = _$v.isChecked;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TodoDto other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$TodoDto;
  }

  @override
  void update(void updates(TodoDtoBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$TodoDto build() {
    final _$result = _$v ?? new _$TodoDto._(name: name, isChecked: isChecked);
    replace(_$result);
    return _$result;
  }
}
