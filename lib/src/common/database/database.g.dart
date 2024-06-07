// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Category> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String title;
  const Category({required this.id, required this.title});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      title: Value(title),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
    };
  }

  Category copyWith({int? id, String? title}) => Category(
        id: id ?? this.id,
        title: title ?? this.title,
      );
  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category && other.id == this.id && other.title == this.title);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> title;
  final Value<int> rowid;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoriesCompanion.insert({
    required int id,
    required String title,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title);
  static Insertable<Category> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int>? id, Value<String>? title, Value<int>? rowid}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProductsTable extends Products with TableInfo<$ProductsTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _pageMeta = const VerificationMeta('page');
  @override
  late final GeneratedColumn<int> page = GeneratedColumn<int>(
      'page', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<String> price = GeneratedColumn<String>(
      'price', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, page, categoryId, imageUrl, name, price];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(Insertable<Product> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('page')) {
      context.handle(
          _pageMeta, page.isAcceptableOrUnknown(data['page']!, _pageMeta));
    } else if (isInserting) {
      context.missing(_pageMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Product(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      page: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}page'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}price'])!,
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class Product extends DataClass implements Insertable<Product> {
  final int id;
  final int page;
  final int categoryId;
  final String imageUrl;
  final String name;
  final String price;
  const Product(
      {required this.id,
      required this.page,
      required this.categoryId,
      required this.imageUrl,
      required this.name,
      required this.price});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['page'] = Variable<int>(page);
    map['category_id'] = Variable<int>(categoryId);
    map['image_url'] = Variable<String>(imageUrl);
    map['name'] = Variable<String>(name);
    map['price'] = Variable<String>(price);
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      page: Value(page),
      categoryId: Value(categoryId),
      imageUrl: Value(imageUrl),
      name: Value(name),
      price: Value(price),
    );
  }

  factory Product.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      id: serializer.fromJson<int>(json['id']),
      page: serializer.fromJson<int>(json['page']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      name: serializer.fromJson<String>(json['name']),
      price: serializer.fromJson<String>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'page': serializer.toJson<int>(page),
      'categoryId': serializer.toJson<int>(categoryId),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'name': serializer.toJson<String>(name),
      'price': serializer.toJson<String>(price),
    };
  }

  Product copyWith(
          {int? id,
          int? page,
          int? categoryId,
          String? imageUrl,
          String? name,
          String? price}) =>
      Product(
        id: id ?? this.id,
        page: page ?? this.page,
        categoryId: categoryId ?? this.categoryId,
        imageUrl: imageUrl ?? this.imageUrl,
        name: name ?? this.name,
        price: price ?? this.price,
      );
  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('id: $id, ')
          ..write('page: $page, ')
          ..write('categoryId: $categoryId, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('name: $name, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, page, categoryId, imageUrl, name, price);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.id == this.id &&
          other.page == this.page &&
          other.categoryId == this.categoryId &&
          other.imageUrl == this.imageUrl &&
          other.name == this.name &&
          other.price == this.price);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<int> id;
  final Value<int> page;
  final Value<int> categoryId;
  final Value<String> imageUrl;
  final Value<String> name;
  final Value<String> price;
  final Value<int> rowid;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.page = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.name = const Value.absent(),
    this.price = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductsCompanion.insert({
    required int id,
    required int page,
    required int categoryId,
    required String imageUrl,
    required String name,
    required String price,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        page = Value(page),
        categoryId = Value(categoryId),
        imageUrl = Value(imageUrl),
        name = Value(name),
        price = Value(price);
  static Insertable<Product> custom({
    Expression<int>? id,
    Expression<int>? page,
    Expression<int>? categoryId,
    Expression<String>? imageUrl,
    Expression<String>? name,
    Expression<String>? price,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (page != null) 'page': page,
      if (categoryId != null) 'category_id': categoryId,
      if (imageUrl != null) 'image_url': imageUrl,
      if (name != null) 'name': name,
      if (price != null) 'price': price,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductsCompanion copyWith(
      {Value<int>? id,
      Value<int>? page,
      Value<int>? categoryId,
      Value<String>? imageUrl,
      Value<String>? name,
      Value<String>? price,
      Value<int>? rowid}) {
    return ProductsCompanion(
      id: id ?? this.id,
      page: page ?? this.page,
      categoryId: categoryId ?? this.categoryId,
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      price: price ?? this.price,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (page.present) {
      map['page'] = Variable<int>(page.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (price.present) {
      map['price'] = Variable<String>(price.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('page: $page, ')
          ..write('categoryId: $categoryId, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MapPointsTable extends MapPoints
    with TableInfo<$MapPointsTable, MapPoint> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MapPointsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
      'lat', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _lngMeta = const VerificationMeta('lng');
  @override
  late final GeneratedColumn<double> lng = GeneratedColumn<double>(
      'lng', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [address, lat, lng];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'map_points';
  @override
  VerificationContext validateIntegrity(Insertable<MapPoint> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('lat')) {
      context.handle(
          _latMeta, lat.isAcceptableOrUnknown(data['lat']!, _latMeta));
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('lng')) {
      context.handle(
          _lngMeta, lng.isAcceptableOrUnknown(data['lng']!, _lngMeta));
    } else if (isInserting) {
      context.missing(_lngMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  MapPoint map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MapPoint(
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address'])!,
      lat: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}lat'])!,
      lng: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}lng'])!,
    );
  }

  @override
  $MapPointsTable createAlias(String alias) {
    return $MapPointsTable(attachedDatabase, alias);
  }
}

class MapPoint extends DataClass implements Insertable<MapPoint> {
  final String address;
  final double lat;
  final double lng;
  const MapPoint({required this.address, required this.lat, required this.lng});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['address'] = Variable<String>(address);
    map['lat'] = Variable<double>(lat);
    map['lng'] = Variable<double>(lng);
    return map;
  }

  MapPointsCompanion toCompanion(bool nullToAbsent) {
    return MapPointsCompanion(
      address: Value(address),
      lat: Value(lat),
      lng: Value(lng),
    );
  }

  factory MapPoint.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MapPoint(
      address: serializer.fromJson<String>(json['address']),
      lat: serializer.fromJson<double>(json['lat']),
      lng: serializer.fromJson<double>(json['lng']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'address': serializer.toJson<String>(address),
      'lat': serializer.toJson<double>(lat),
      'lng': serializer.toJson<double>(lng),
    };
  }

  MapPoint copyWith({String? address, double? lat, double? lng}) => MapPoint(
        address: address ?? this.address,
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
      );
  @override
  String toString() {
    return (StringBuffer('MapPoint(')
          ..write('address: $address, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(address, lat, lng);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MapPoint &&
          other.address == this.address &&
          other.lat == this.lat &&
          other.lng == this.lng);
}

class MapPointsCompanion extends UpdateCompanion<MapPoint> {
  final Value<String> address;
  final Value<double> lat;
  final Value<double> lng;
  final Value<int> rowid;
  const MapPointsCompanion({
    this.address = const Value.absent(),
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MapPointsCompanion.insert({
    required String address,
    required double lat,
    required double lng,
    this.rowid = const Value.absent(),
  })  : address = Value(address),
        lat = Value(lat),
        lng = Value(lng);
  static Insertable<MapPoint> custom({
    Expression<String>? address,
    Expression<double>? lat,
    Expression<double>? lng,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (address != null) 'address': address,
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MapPointsCompanion copyWith(
      {Value<String>? address,
      Value<double>? lat,
      Value<double>? lng,
      Value<int>? rowid}) {
    return MapPointsCompanion(
      address: address ?? this.address,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lng.present) {
      map['lng'] = Variable<double>(lng.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MapPointsCompanion(')
          ..write('address: $address, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $MapPointsTable mapPoints = $MapPointsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [categories, products, mapPoints];
}
