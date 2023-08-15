// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tabbarview_states.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTabClassCollection on Isar {
  IsarCollection<TabClass> get tabClass => this.collection();
}

const TabClassSchema = CollectionSchema(
  name: r'TabClass',
  id: 699708133122560218,
  properties: {
    r'enableBtn': PropertySchema(
      id: 0,
      name: r'enableBtn',
      type: IsarType.bool,
    ),
    r'tabTitle': PropertySchema(
      id: 1,
      name: r'tabTitle',
      type: IsarType.string,
    ),
    r'textToProcess': PropertySchema(
      id: 2,
      name: r'textToProcess',
      type: IsarType.string,
    )
  },
  estimateSize: _tabClassEstimateSize,
  serialize: _tabClassSerialize,
  deserialize: _tabClassDeserialize,
  deserializeProp: _tabClassDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _tabClassGetId,
  getLinks: _tabClassGetLinks,
  attach: _tabClassAttach,
  version: '3.1.0+1',
);

int _tabClassEstimateSize(
  TabClass object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.tabTitle.length * 3;
  bytesCount += 3 + object.textToProcess.length * 3;
  return bytesCount;
}

void _tabClassSerialize(
  TabClass object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.enableBtn);
  writer.writeString(offsets[1], object.tabTitle);
  writer.writeString(offsets[2], object.textToProcess);
}

TabClass _tabClassDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TabClass(
    id: id,
    tabTitle: reader.readString(offsets[1]),
    textToProcess: reader.readString(offsets[2]),
  );
  return object;
}

P _tabClassDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _tabClassGetId(TabClass object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _tabClassGetLinks(TabClass object) {
  return [];
}

void _tabClassAttach(IsarCollection<dynamic> col, Id id, TabClass object) {
  object.id = id;
}

extension TabClassQueryWhereSort on QueryBuilder<TabClass, TabClass, QWhere> {
  QueryBuilder<TabClass, TabClass, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TabClassQueryWhere on QueryBuilder<TabClass, TabClass, QWhereClause> {
  QueryBuilder<TabClass, TabClass, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TabClass, TabClass, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<TabClass, TabClass, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TabClass, TabClass, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TabClass, TabClass, QAfterWhereClause> idBetween(
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

extension TabClassQueryFilter
    on QueryBuilder<TabClass, TabClass, QFilterCondition> {
  QueryBuilder<TabClass, TabClass, QAfterFilterCondition> enableBtnEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enableBtn',
        value: value,
      ));
    });
  }

  QueryBuilder<TabClass, TabClass, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TabClass, TabClass, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<TabClass, TabClass, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<TabClass, TabClass, QAfterFilterCondition> idBetween(
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

  QueryBuilder<TabClass, TabClass, QAfterFilterCondition> tabTitleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tabTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TabClass, TabClass, QAfterFilterCondition> tabTitleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tabTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TabClass, TabClass, QAfterFilterCondition> tabTitleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tabTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TabClass, TabClass, QAfterFilterCondition> tabTitleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tabTitle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TabClass, TabClass, QAfterFilterCondition> tabTitleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tabTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TabClass, TabClass, QAfterFilterCondition> tabTitleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tabTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TabClass, TabClass, QAfterFilterCondition> tabTitleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tabTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TabClass, TabClass, QAfterFilterCondition> tabTitleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tabTitle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TabClass, TabClass, QAfterFilterCondition> tabTitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tabTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<TabClass, TabClass, QAfterFilterCondition> tabTitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tabTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<TabClass, TabClass, QAfterFilterCondition> textToProcessEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'textToProcess',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TabClass, TabClass, QAfterFilterCondition>
      textToProcessGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'textToProcess',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TabClass, TabClass, QAfterFilterCondition> textToProcessLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'textToProcess',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TabClass, TabClass, QAfterFilterCondition> textToProcessBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'textToProcess',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TabClass, TabClass, QAfterFilterCondition>
      textToProcessStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'textToProcess',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TabClass, TabClass, QAfterFilterCondition> textToProcessEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'textToProcess',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TabClass, TabClass, QAfterFilterCondition> textToProcessContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'textToProcess',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TabClass, TabClass, QAfterFilterCondition> textToProcessMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'textToProcess',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TabClass, TabClass, QAfterFilterCondition>
      textToProcessIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'textToProcess',
        value: '',
      ));
    });
  }

  QueryBuilder<TabClass, TabClass, QAfterFilterCondition>
      textToProcessIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'textToProcess',
        value: '',
      ));
    });
  }
}

extension TabClassQueryObject
    on QueryBuilder<TabClass, TabClass, QFilterCondition> {}

extension TabClassQueryLinks
    on QueryBuilder<TabClass, TabClass, QFilterCondition> {}

extension TabClassQuerySortBy on QueryBuilder<TabClass, TabClass, QSortBy> {
  QueryBuilder<TabClass, TabClass, QAfterSortBy> sortByEnableBtn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableBtn', Sort.asc);
    });
  }

  QueryBuilder<TabClass, TabClass, QAfterSortBy> sortByEnableBtnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableBtn', Sort.desc);
    });
  }

  QueryBuilder<TabClass, TabClass, QAfterSortBy> sortByTabTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tabTitle', Sort.asc);
    });
  }

  QueryBuilder<TabClass, TabClass, QAfterSortBy> sortByTabTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tabTitle', Sort.desc);
    });
  }

  QueryBuilder<TabClass, TabClass, QAfterSortBy> sortByTextToProcess() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textToProcess', Sort.asc);
    });
  }

  QueryBuilder<TabClass, TabClass, QAfterSortBy> sortByTextToProcessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textToProcess', Sort.desc);
    });
  }
}

extension TabClassQuerySortThenBy
    on QueryBuilder<TabClass, TabClass, QSortThenBy> {
  QueryBuilder<TabClass, TabClass, QAfterSortBy> thenByEnableBtn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableBtn', Sort.asc);
    });
  }

  QueryBuilder<TabClass, TabClass, QAfterSortBy> thenByEnableBtnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableBtn', Sort.desc);
    });
  }

  QueryBuilder<TabClass, TabClass, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TabClass, TabClass, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TabClass, TabClass, QAfterSortBy> thenByTabTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tabTitle', Sort.asc);
    });
  }

  QueryBuilder<TabClass, TabClass, QAfterSortBy> thenByTabTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tabTitle', Sort.desc);
    });
  }

  QueryBuilder<TabClass, TabClass, QAfterSortBy> thenByTextToProcess() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textToProcess', Sort.asc);
    });
  }

  QueryBuilder<TabClass, TabClass, QAfterSortBy> thenByTextToProcessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textToProcess', Sort.desc);
    });
  }
}

extension TabClassQueryWhereDistinct
    on QueryBuilder<TabClass, TabClass, QDistinct> {
  QueryBuilder<TabClass, TabClass, QDistinct> distinctByEnableBtn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enableBtn');
    });
  }

  QueryBuilder<TabClass, TabClass, QDistinct> distinctByTabTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tabTitle', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TabClass, TabClass, QDistinct> distinctByTextToProcess(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'textToProcess',
          caseSensitive: caseSensitive);
    });
  }
}

extension TabClassQueryProperty
    on QueryBuilder<TabClass, TabClass, QQueryProperty> {
  QueryBuilder<TabClass, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TabClass, bool, QQueryOperations> enableBtnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enableBtn');
    });
  }

  QueryBuilder<TabClass, String, QQueryOperations> tabTitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tabTitle');
    });
  }

  QueryBuilder<TabClass, String, QQueryOperations> textToProcessProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'textToProcess');
    });
  }
}
