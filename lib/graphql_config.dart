import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLConfig {          //configured GraphQL
  static HttpLink httpLink =
      HttpLink('https://great-mite-98.hasura.app/v1/graphql');      //graphQL endpoint

  GraphQLClient clientToQuery() =>
      GraphQLClient(link: httpLink, cache: GraphQLCache());
}