// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blackout_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$blackoutHash() => r'186fae7ab20c5f4ee2ddca470f161bfc95b8451b';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$Blackout extends BuildlessAsyncNotifier<OutageReport?> {
  late final String jwt;
  late final int billID;

  FutureOr<OutageReport?> build(
    String jwt,
    int billID,
  );
}

/// See also [Blackout].
@ProviderFor(Blackout)
const blackoutProvider = BlackoutFamily();

/// See also [Blackout].
class BlackoutFamily extends Family<AsyncValue<OutageReport?>> {
  /// See also [Blackout].
  const BlackoutFamily();

  /// See also [Blackout].
  BlackoutProvider call(
    String jwt,
    int billID,
  ) {
    return BlackoutProvider(
      jwt,
      billID,
    );
  }

  @override
  BlackoutProvider getProviderOverride(
    covariant BlackoutProvider provider,
  ) {
    return call(
      provider.jwt,
      provider.billID,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'blackoutProvider';
}

/// See also [Blackout].
class BlackoutProvider
    extends AsyncNotifierProviderImpl<Blackout, OutageReport?> {
  /// See also [Blackout].
  BlackoutProvider(
    String jwt,
    int billID,
  ) : this._internal(
          () => Blackout()
            ..jwt = jwt
            ..billID = billID,
          from: blackoutProvider,
          name: r'blackoutProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$blackoutHash,
          dependencies: BlackoutFamily._dependencies,
          allTransitiveDependencies: BlackoutFamily._allTransitiveDependencies,
          jwt: jwt,
          billID: billID,
        );

  BlackoutProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.jwt,
    required this.billID,
  }) : super.internal();

  final String jwt;
  final int billID;

  @override
  FutureOr<OutageReport?> runNotifierBuild(
    covariant Blackout notifier,
  ) {
    return notifier.build(
      jwt,
      billID,
    );
  }

  @override
  Override overrideWith(Blackout Function() create) {
    return ProviderOverride(
      origin: this,
      override: BlackoutProvider._internal(
        () => create()
          ..jwt = jwt
          ..billID = billID,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        jwt: jwt,
        billID: billID,
      ),
    );
  }

  @override
  AsyncNotifierProviderElement<Blackout, OutageReport?> createElement() {
    return _BlackoutProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BlackoutProvider &&
        other.jwt == jwt &&
        other.billID == billID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, jwt.hashCode);
    hash = _SystemHash.combine(hash, billID.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin BlackoutRef on AsyncNotifierProviderRef<OutageReport?> {
  /// The parameter `jwt` of this provider.
  String get jwt;

  /// The parameter `billID` of this provider.
  int get billID;
}

class _BlackoutProviderElement
    extends AsyncNotifierProviderElement<Blackout, OutageReport?>
    with BlackoutRef {
  _BlackoutProviderElement(super.provider);

  @override
  String get jwt => (origin as BlackoutProvider).jwt;
  @override
  int get billID => (origin as BlackoutProvider).billID;
}

String _$mockBlackoutHash() => r'a1b14210100262a2d8144ec00a1f5b121f46d5c9';

abstract class _$MockBlackout extends BuildlessAsyncNotifier<OutageReport?> {
  late final String jwt;
  late final int billID;

  FutureOr<OutageReport?> build(
    String jwt,
    int billID,
  );
}

/// See also [MockBlackout].
@ProviderFor(MockBlackout)
const mockBlackoutProvider = MockBlackoutFamily();

/// See also [MockBlackout].
class MockBlackoutFamily extends Family<AsyncValue<OutageReport?>> {
  /// See also [MockBlackout].
  const MockBlackoutFamily();

  /// See also [MockBlackout].
  MockBlackoutProvider call(
    String jwt,
    int billID,
  ) {
    return MockBlackoutProvider(
      jwt,
      billID,
    );
  }

  @override
  MockBlackoutProvider getProviderOverride(
    covariant MockBlackoutProvider provider,
  ) {
    return call(
      provider.jwt,
      provider.billID,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'mockBlackoutProvider';
}

/// See also [MockBlackout].
class MockBlackoutProvider
    extends AsyncNotifierProviderImpl<MockBlackout, OutageReport?> {
  /// See also [MockBlackout].
  MockBlackoutProvider(
    String jwt,
    int billID,
  ) : this._internal(
          () => MockBlackout()
            ..jwt = jwt
            ..billID = billID,
          from: mockBlackoutProvider,
          name: r'mockBlackoutProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mockBlackoutHash,
          dependencies: MockBlackoutFamily._dependencies,
          allTransitiveDependencies:
              MockBlackoutFamily._allTransitiveDependencies,
          jwt: jwt,
          billID: billID,
        );

  MockBlackoutProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.jwt,
    required this.billID,
  }) : super.internal();

  final String jwt;
  final int billID;

  @override
  FutureOr<OutageReport?> runNotifierBuild(
    covariant MockBlackout notifier,
  ) {
    return notifier.build(
      jwt,
      billID,
    );
  }

  @override
  Override overrideWith(MockBlackout Function() create) {
    return ProviderOverride(
      origin: this,
      override: MockBlackoutProvider._internal(
        () => create()
          ..jwt = jwt
          ..billID = billID,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        jwt: jwt,
        billID: billID,
      ),
    );
  }

  @override
  AsyncNotifierProviderElement<MockBlackout, OutageReport?> createElement() {
    return _MockBlackoutProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MockBlackoutProvider &&
        other.jwt == jwt &&
        other.billID == billID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, jwt.hashCode);
    hash = _SystemHash.combine(hash, billID.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MockBlackoutRef on AsyncNotifierProviderRef<OutageReport?> {
  /// The parameter `jwt` of this provider.
  String get jwt;

  /// The parameter `billID` of this provider.
  int get billID;
}

class _MockBlackoutProviderElement
    extends AsyncNotifierProviderElement<MockBlackout, OutageReport?>
    with MockBlackoutRef {
  _MockBlackoutProviderElement(super.provider);

  @override
  String get jwt => (origin as MockBlackoutProvider).jwt;
  @override
  int get billID => (origin as MockBlackoutProvider).billID;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
