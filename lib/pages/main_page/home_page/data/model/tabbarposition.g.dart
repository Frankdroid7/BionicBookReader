// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tabbarposition.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTabBarPositionCollection on Isar {
  IsarCollection<TabBarPosition> get tabBarPositions => this.collection();
}

const TabBarPositionSchema = CollectionSchema(
  name: r'TabBarPosition',
  id: -7198462242468157458,
  properties: {
    r'position': PropertySchema(
      id: 0,
      name: r'position',
      type: IsarType.long,
    )
  },
  estimateSize: _tabBarPositionEstimateSize,
  serialize: _tabBarPositionSerialize,
  deserialize: _tabBarPositionDeserialize,
  deserializeProp: _tabBarPositionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _tabBarPositionGetId,
  getLinks: _tabBarPositionGetLinks,
  attach: _tabBarPositionAttach,
  version: '3.1.0+1',
);

int _tabBarPositionEstimateSize(
  TabBarPosition object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _tabBarPositionSerialize(
  TabBarPosition object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.position);
}

TabBarPosition _tabBarPositionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TabBarPosition(
    position: reader.readLong(offsets[0]),
  );
  return object;
}

P _tabBarPositionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _tabBarPositionGetId(TabBarPosition object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _tabBarPositionGetLinks(TabBarPosition object) {
  return [];
}

void _tabBarPositionAttach(
    IsarCollection<dynamic> col, Id id, TabBarPosition object) {}

extension TabBarPositionQueryWhereSort
    on QueryBuilder<TabBarPosition, TabBarPosition, QWhere> {
  QueryBuilder<TabBarPosition, TabBarPosition, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TabBarPositionQueryWhere
    on QueryBuilder<TabBarPosition, TabBarPosition, QWhereClause> {
  QueryBuilder<TabBarPosition, TabBarPosition, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TabBarPosition, TabBarPosition, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<TabBarPosition, TabBarPosition, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TabBarPosition, TabBarPosition, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TabBarPosition, TabBarPosition, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TabBarPositionQueryFilter
    on QueryBuilder<TabBarPosition, TabBarPosition, QFilterCondition> {
  QueryBuilder<TabBarPosition, TabBarPosition, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TabBarPosition, TabBarPosition, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TabBarPosition, TabBarPosition, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TabBarPosition, TabBarPosition, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TabBarPosition, TabBarPosition, QAfterFilterCondition>
      positionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'position',
        value: value,
      ));
    });
  }

  QueryBuilder<TabBarPosition, TabBarPosition, QAfterFilterCondition>
      positionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'position',
        value: value,
      ));
    });
  }

  QueryBuilder<TabBarPosition, TabBarPosition, QAfterFilterCondition>
      positionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'position',
        value: value,
      ));
    });
  }

  QueryBuilder<TabBarPosition, TabBarPosition, QAfterFilterCondition>
      positionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'position',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TabBarPositionQueryObject
    on QueryBuilder<TabBarPosition, TabBarPosition, QFilterCondition> {}

extension TabBarPositionQueryLinks
    on QueryBuilder<TabBarPosition, TabBarPosition, QFilterCondition> {}

extension TabBarPositionQuerySortBy
    on QueryBuilder<TabBarPosition, TabBarPosition, QSortBy> {
  QueryBuilder<TabBarPosition, TabBarPosition, QAfterSortBy> sortByPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'position', Sort.asc);
    });
  }

  QueryBuilder<TabBarPosition, TabBarPosition, QAfterSortBy>
      sortByPositionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'position', Sort.desc);
    });
  }
}

extension TabBarPositionQuerySortThenBy
    on QueryBuilder<TabBarPosition, TabBarPosition, QSortThenBy> {
  QueryBuilder<TabBarPosition, TabBarPosition, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TabBarPosition, TabBarPosition, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TabBarPosition, TabBarPosition, QAfterSortBy> thenByPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'position', Sort.asc);
    });
  }

  QueryBuilder<TabBarPosition, TabBarPosition, QAfterSortBy>
      thenByPositionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'position', Sort.desc);
    });
  }
}

extension TabBarPositionQueryWhereDistinct
    on QueryBuilder<TabBarPosition, TabBarPosition, QDistinct> {
  QueryBuilder<TabBarPosition, TabBarPosition, QDistinct> distinctByPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'position');
    });
  }
}

extension TabBarPositionQueryProperty
    on QueryBuilder<TabBarPosition, TabBarPosition, QQueryProperty> {
  QueryBuilder<TabBarPosition, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TabBarPosition, int, QQueryOperations> positionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'position');
    });
  }
}
