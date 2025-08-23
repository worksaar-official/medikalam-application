// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dash_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DashboardData _$DashboardDataFromJson(Map<String, dynamic> json) {
  return _DashboardData.fromJson(json);
}

/// @nodoc
mixin _$DashboardData {
  String get greeting => throw _privateConstructorUsedError;
  StaffDetails get staffDetails => throw _privateConstructorUsedError;
  Analytics get analytics => throw _privateConstructorUsedError;

  /// Serializes this DashboardData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardDataCopyWith<DashboardData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardDataCopyWith<$Res> {
  factory $DashboardDataCopyWith(
          DashboardData value, $Res Function(DashboardData) then) =
      _$DashboardDataCopyWithImpl<$Res, DashboardData>;
  @useResult
  $Res call({String greeting, StaffDetails staffDetails, Analytics analytics});

  $StaffDetailsCopyWith<$Res> get staffDetails;
  $AnalyticsCopyWith<$Res> get analytics;
}

/// @nodoc
class _$DashboardDataCopyWithImpl<$Res, $Val extends DashboardData>
    implements $DashboardDataCopyWith<$Res> {
  _$DashboardDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? greeting = null,
    Object? staffDetails = null,
    Object? analytics = null,
  }) {
    return _then(_value.copyWith(
      greeting: null == greeting
          ? _value.greeting
          : greeting // ignore: cast_nullable_to_non_nullable
              as String,
      staffDetails: null == staffDetails
          ? _value.staffDetails
          : staffDetails // ignore: cast_nullable_to_non_nullable
              as StaffDetails,
      analytics: null == analytics
          ? _value.analytics
          : analytics // ignore: cast_nullable_to_non_nullable
              as Analytics,
    ) as $Val);
  }

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StaffDetailsCopyWith<$Res> get staffDetails {
    return $StaffDetailsCopyWith<$Res>(_value.staffDetails, (value) {
      return _then(_value.copyWith(staffDetails: value) as $Val);
    });
  }

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnalyticsCopyWith<$Res> get analytics {
    return $AnalyticsCopyWith<$Res>(_value.analytics, (value) {
      return _then(_value.copyWith(analytics: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DashboardDataImplCopyWith<$Res>
    implements $DashboardDataCopyWith<$Res> {
  factory _$$DashboardDataImplCopyWith(
          _$DashboardDataImpl value, $Res Function(_$DashboardDataImpl) then) =
      __$$DashboardDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String greeting, StaffDetails staffDetails, Analytics analytics});

  @override
  $StaffDetailsCopyWith<$Res> get staffDetails;
  @override
  $AnalyticsCopyWith<$Res> get analytics;
}

/// @nodoc
class __$$DashboardDataImplCopyWithImpl<$Res>
    extends _$DashboardDataCopyWithImpl<$Res, _$DashboardDataImpl>
    implements _$$DashboardDataImplCopyWith<$Res> {
  __$$DashboardDataImplCopyWithImpl(
      _$DashboardDataImpl _value, $Res Function(_$DashboardDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? greeting = null,
    Object? staffDetails = null,
    Object? analytics = null,
  }) {
    return _then(_$DashboardDataImpl(
      greeting: null == greeting
          ? _value.greeting
          : greeting // ignore: cast_nullable_to_non_nullable
              as String,
      staffDetails: null == staffDetails
          ? _value.staffDetails
          : staffDetails // ignore: cast_nullable_to_non_nullable
              as StaffDetails,
      analytics: null == analytics
          ? _value.analytics
          : analytics // ignore: cast_nullable_to_non_nullable
              as Analytics,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardDataImpl implements _DashboardData {
  const _$DashboardDataImpl(
      {this.greeting = "Hello",
      required this.staffDetails,
      required this.analytics});

  factory _$DashboardDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardDataImplFromJson(json);

  @override
  @JsonKey()
  final String greeting;
  @override
  final StaffDetails staffDetails;
  @override
  final Analytics analytics;

  @override
  String toString() {
    return 'DashboardData(greeting: $greeting, staffDetails: $staffDetails, analytics: $analytics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardDataImpl &&
            (identical(other.greeting, greeting) ||
                other.greeting == greeting) &&
            (identical(other.staffDetails, staffDetails) ||
                other.staffDetails == staffDetails) &&
            (identical(other.analytics, analytics) ||
                other.analytics == analytics));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, greeting, staffDetails, analytics);

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardDataImplCopyWith<_$DashboardDataImpl> get copyWith =>
      __$$DashboardDataImplCopyWithImpl<_$DashboardDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardDataImplToJson(
      this,
    );
  }
}

abstract class _DashboardData implements DashboardData {
  const factory _DashboardData(
      {final String greeting,
      required final StaffDetails staffDetails,
      required final Analytics analytics}) = _$DashboardDataImpl;

  factory _DashboardData.fromJson(Map<String, dynamic> json) =
      _$DashboardDataImpl.fromJson;

  @override
  String get greeting;
  @override
  StaffDetails get staffDetails;
  @override
  Analytics get analytics;

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardDataImplCopyWith<_$DashboardDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StaffDetails _$StaffDetailsFromJson(Map<String, dynamic> json) {
  return _StaffDetails.fromJson(json);
}

/// @nodoc
mixin _$StaffDetails {
  Hospital get hospital => throw _privateConstructorUsedError;
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  /// Serializes this StaffDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StaffDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StaffDetailsCopyWith<StaffDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffDetailsCopyWith<$Res> {
  factory $StaffDetailsCopyWith(
          StaffDetails value, $Res Function(StaffDetails) then) =
      _$StaffDetailsCopyWithImpl<$Res, StaffDetails>;
  @useResult
  $Res call(
      {Hospital hospital,
      @JsonKey(name: "_id") String id,
      String fullName,
      String title});

  $HospitalCopyWith<$Res> get hospital;
}

/// @nodoc
class _$StaffDetailsCopyWithImpl<$Res, $Val extends StaffDetails>
    implements $StaffDetailsCopyWith<$Res> {
  _$StaffDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StaffDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hospital = null,
    Object? id = null,
    Object? fullName = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      hospital: null == hospital
          ? _value.hospital
          : hospital // ignore: cast_nullable_to_non_nullable
              as Hospital,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of StaffDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HospitalCopyWith<$Res> get hospital {
    return $HospitalCopyWith<$Res>(_value.hospital, (value) {
      return _then(_value.copyWith(hospital: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StaffDetailsImplCopyWith<$Res>
    implements $StaffDetailsCopyWith<$Res> {
  factory _$$StaffDetailsImplCopyWith(
          _$StaffDetailsImpl value, $Res Function(_$StaffDetailsImpl) then) =
      __$$StaffDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Hospital hospital,
      @JsonKey(name: "_id") String id,
      String fullName,
      String title});

  @override
  $HospitalCopyWith<$Res> get hospital;
}

/// @nodoc
class __$$StaffDetailsImplCopyWithImpl<$Res>
    extends _$StaffDetailsCopyWithImpl<$Res, _$StaffDetailsImpl>
    implements _$$StaffDetailsImplCopyWith<$Res> {
  __$$StaffDetailsImplCopyWithImpl(
      _$StaffDetailsImpl _value, $Res Function(_$StaffDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hospital = null,
    Object? id = null,
    Object? fullName = null,
    Object? title = null,
  }) {
    return _then(_$StaffDetailsImpl(
      hospital: null == hospital
          ? _value.hospital
          : hospital // ignore: cast_nullable_to_non_nullable
              as Hospital,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StaffDetailsImpl implements _StaffDetails {
  const _$StaffDetailsImpl(
      {required this.hospital,
      @JsonKey(name: "_id") required this.id,
      required this.fullName,
      required this.title});

  factory _$StaffDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$StaffDetailsImplFromJson(json);

  @override
  final Hospital hospital;
  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final String fullName;
  @override
  final String title;

  @override
  String toString() {
    return 'StaffDetails(hospital: $hospital, id: $id, fullName: $fullName, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StaffDetailsImpl &&
            (identical(other.hospital, hospital) ||
                other.hospital == hospital) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hospital, id, fullName, title);

  /// Create a copy of StaffDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StaffDetailsImplCopyWith<_$StaffDetailsImpl> get copyWith =>
      __$$StaffDetailsImplCopyWithImpl<_$StaffDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StaffDetailsImplToJson(
      this,
    );
  }
}

abstract class _StaffDetails implements StaffDetails {
  const factory _StaffDetails(
      {required final Hospital hospital,
      @JsonKey(name: "_id") required final String id,
      required final String fullName,
      required final String title}) = _$StaffDetailsImpl;

  factory _StaffDetails.fromJson(Map<String, dynamic> json) =
      _$StaffDetailsImpl.fromJson;

  @override
  Hospital get hospital;
  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  String get fullName;
  @override
  String get title;

  /// Create a copy of StaffDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StaffDetailsImplCopyWith<_$StaffDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Analytics _$AnalyticsFromJson(Map<String, dynamic> json) {
  return _Analytics.fromJson(json);
}

/// @nodoc
mixin _$Analytics {
  Total get total => throw _privateConstructorUsedError;
  TodaySoFar get todaySoFar => throw _privateConstructorUsedError;

  /// Serializes this Analytics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Analytics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalyticsCopyWith<Analytics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsCopyWith<$Res> {
  factory $AnalyticsCopyWith(Analytics value, $Res Function(Analytics) then) =
      _$AnalyticsCopyWithImpl<$Res, Analytics>;
  @useResult
  $Res call({Total total, TodaySoFar todaySoFar});

  $TotalCopyWith<$Res> get total;
  $TodaySoFarCopyWith<$Res> get todaySoFar;
}

/// @nodoc
class _$AnalyticsCopyWithImpl<$Res, $Val extends Analytics>
    implements $AnalyticsCopyWith<$Res> {
  _$AnalyticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Analytics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? todaySoFar = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as Total,
      todaySoFar: null == todaySoFar
          ? _value.todaySoFar
          : todaySoFar // ignore: cast_nullable_to_non_nullable
              as TodaySoFar,
    ) as $Val);
  }

  /// Create a copy of Analytics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TotalCopyWith<$Res> get total {
    return $TotalCopyWith<$Res>(_value.total, (value) {
      return _then(_value.copyWith(total: value) as $Val);
    });
  }

  /// Create a copy of Analytics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TodaySoFarCopyWith<$Res> get todaySoFar {
    return $TodaySoFarCopyWith<$Res>(_value.todaySoFar, (value) {
      return _then(_value.copyWith(todaySoFar: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnalyticsImplCopyWith<$Res>
    implements $AnalyticsCopyWith<$Res> {
  factory _$$AnalyticsImplCopyWith(
          _$AnalyticsImpl value, $Res Function(_$AnalyticsImpl) then) =
      __$$AnalyticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Total total, TodaySoFar todaySoFar});

  @override
  $TotalCopyWith<$Res> get total;
  @override
  $TodaySoFarCopyWith<$Res> get todaySoFar;
}

/// @nodoc
class __$$AnalyticsImplCopyWithImpl<$Res>
    extends _$AnalyticsCopyWithImpl<$Res, _$AnalyticsImpl>
    implements _$$AnalyticsImplCopyWith<$Res> {
  __$$AnalyticsImplCopyWithImpl(
      _$AnalyticsImpl _value, $Res Function(_$AnalyticsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Analytics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? todaySoFar = null,
  }) {
    return _then(_$AnalyticsImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as Total,
      todaySoFar: null == todaySoFar
          ? _value.todaySoFar
          : todaySoFar // ignore: cast_nullable_to_non_nullable
              as TodaySoFar,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalyticsImpl implements _Analytics {
  const _$AnalyticsImpl({required this.total, required this.todaySoFar});

  factory _$AnalyticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyticsImplFromJson(json);

  @override
  final Total total;
  @override
  final TodaySoFar todaySoFar;

  @override
  String toString() {
    return 'Analytics(total: $total, todaySoFar: $todaySoFar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.todaySoFar, todaySoFar) ||
                other.todaySoFar == todaySoFar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total, todaySoFar);

  /// Create a copy of Analytics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsImplCopyWith<_$AnalyticsImpl> get copyWith =>
      __$$AnalyticsImplCopyWithImpl<_$AnalyticsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyticsImplToJson(
      this,
    );
  }
}

abstract class _Analytics implements Analytics {
  const factory _Analytics(
      {required final Total total,
      required final TodaySoFar todaySoFar}) = _$AnalyticsImpl;

  factory _Analytics.fromJson(Map<String, dynamic> json) =
      _$AnalyticsImpl.fromJson;

  @override
  Total get total;
  @override
  TodaySoFar get todaySoFar;

  /// Create a copy of Analytics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalyticsImplCopyWith<_$AnalyticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Total _$TotalFromJson(Map<String, dynamic> json) {
  return _Total.fromJson(json);
}

/// @nodoc
mixin _$Total {
  int get count => throw _privateConstructorUsedError;
  int get male => throw _privateConstructorUsedError;
  int get female => throw _privateConstructorUsedError;

  /// Serializes this Total to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Total
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TotalCopyWith<Total> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TotalCopyWith<$Res> {
  factory $TotalCopyWith(Total value, $Res Function(Total) then) =
      _$TotalCopyWithImpl<$Res, Total>;
  @useResult
  $Res call({int count, int male, int female});
}

/// @nodoc
class _$TotalCopyWithImpl<$Res, $Val extends Total>
    implements $TotalCopyWith<$Res> {
  _$TotalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Total
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? male = null,
    Object? female = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      male: null == male
          ? _value.male
          : male // ignore: cast_nullable_to_non_nullable
              as int,
      female: null == female
          ? _value.female
          : female // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TotalImplCopyWith<$Res> implements $TotalCopyWith<$Res> {
  factory _$$TotalImplCopyWith(
          _$TotalImpl value, $Res Function(_$TotalImpl) then) =
      __$$TotalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count, int male, int female});
}

/// @nodoc
class __$$TotalImplCopyWithImpl<$Res>
    extends _$TotalCopyWithImpl<$Res, _$TotalImpl>
    implements _$$TotalImplCopyWith<$Res> {
  __$$TotalImplCopyWithImpl(
      _$TotalImpl _value, $Res Function(_$TotalImpl) _then)
      : super(_value, _then);

  /// Create a copy of Total
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? male = null,
    Object? female = null,
  }) {
    return _then(_$TotalImpl(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      male: null == male
          ? _value.male
          : male // ignore: cast_nullable_to_non_nullable
              as int,
      female: null == female
          ? _value.female
          : female // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TotalImpl implements _Total {
  const _$TotalImpl(
      {required this.count, required this.male, required this.female});

  factory _$TotalImpl.fromJson(Map<String, dynamic> json) =>
      _$$TotalImplFromJson(json);

  @override
  final int count;
  @override
  final int male;
  @override
  final int female;

  @override
  String toString() {
    return 'Total(count: $count, male: $male, female: $female)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TotalImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.male, male) || other.male == male) &&
            (identical(other.female, female) || other.female == female));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, count, male, female);

  /// Create a copy of Total
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TotalImplCopyWith<_$TotalImpl> get copyWith =>
      __$$TotalImplCopyWithImpl<_$TotalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TotalImplToJson(
      this,
    );
  }
}

abstract class _Total implements Total {
  const factory _Total(
      {required final int count,
      required final int male,
      required final int female}) = _$TotalImpl;

  factory _Total.fromJson(Map<String, dynamic> json) = _$TotalImpl.fromJson;

  @override
  int get count;
  @override
  int get male;
  @override
  int get female;

  /// Create a copy of Total
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TotalImplCopyWith<_$TotalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TodaySoFar _$TodaySoFarFromJson(Map<String, dynamic> json) {
  return _TodaySoFar.fromJson(json);
}

/// @nodoc
mixin _$TodaySoFar {
  int get count => throw _privateConstructorUsedError;
  int get male => throw _privateConstructorUsedError;
  int get female => throw _privateConstructorUsedError;

  /// Serializes this TodaySoFar to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TodaySoFar
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodaySoFarCopyWith<TodaySoFar> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodaySoFarCopyWith<$Res> {
  factory $TodaySoFarCopyWith(
          TodaySoFar value, $Res Function(TodaySoFar) then) =
      _$TodaySoFarCopyWithImpl<$Res, TodaySoFar>;
  @useResult
  $Res call({int count, int male, int female});
}

/// @nodoc
class _$TodaySoFarCopyWithImpl<$Res, $Val extends TodaySoFar>
    implements $TodaySoFarCopyWith<$Res> {
  _$TodaySoFarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodaySoFar
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? male = null,
    Object? female = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      male: null == male
          ? _value.male
          : male // ignore: cast_nullable_to_non_nullable
              as int,
      female: null == female
          ? _value.female
          : female // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodaySoFarImplCopyWith<$Res>
    implements $TodaySoFarCopyWith<$Res> {
  factory _$$TodaySoFarImplCopyWith(
          _$TodaySoFarImpl value, $Res Function(_$TodaySoFarImpl) then) =
      __$$TodaySoFarImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count, int male, int female});
}

/// @nodoc
class __$$TodaySoFarImplCopyWithImpl<$Res>
    extends _$TodaySoFarCopyWithImpl<$Res, _$TodaySoFarImpl>
    implements _$$TodaySoFarImplCopyWith<$Res> {
  __$$TodaySoFarImplCopyWithImpl(
      _$TodaySoFarImpl _value, $Res Function(_$TodaySoFarImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodaySoFar
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? male = null,
    Object? female = null,
  }) {
    return _then(_$TodaySoFarImpl(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      male: null == male
          ? _value.male
          : male // ignore: cast_nullable_to_non_nullable
              as int,
      female: null == female
          ? _value.female
          : female // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TodaySoFarImpl implements _TodaySoFar {
  const _$TodaySoFarImpl(
      {required this.count, required this.male, required this.female});

  factory _$TodaySoFarImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodaySoFarImplFromJson(json);

  @override
  final int count;
  @override
  final int male;
  @override
  final int female;

  @override
  String toString() {
    return 'TodaySoFar(count: $count, male: $male, female: $female)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodaySoFarImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.male, male) || other.male == male) &&
            (identical(other.female, female) || other.female == female));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, count, male, female);

  /// Create a copy of TodaySoFar
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodaySoFarImplCopyWith<_$TodaySoFarImpl> get copyWith =>
      __$$TodaySoFarImplCopyWithImpl<_$TodaySoFarImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodaySoFarImplToJson(
      this,
    );
  }
}

abstract class _TodaySoFar implements TodaySoFar {
  const factory _TodaySoFar(
      {required final int count,
      required final int male,
      required final int female}) = _$TodaySoFarImpl;

  factory _TodaySoFar.fromJson(Map<String, dynamic> json) =
      _$TodaySoFarImpl.fromJson;

  @override
  int get count;
  @override
  int get male;
  @override
  int get female;

  /// Create a copy of TodaySoFar
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodaySoFarImplCopyWith<_$TodaySoFarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
