import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:social_app_flutter/graphql_config.dart';
import 'package:social_app_flutter/model/user_model.dart';

class GraphQLServices {
  static GraphQLConfig graphQLConfig = GraphQLConfig();
  GraphQLClient client = graphQLConfig.clientToQuery();

  Future<List<UserModel>> getUsers() async {            //function for fetch data from database
    try {
      QueryResult result = await client.query(
        QueryOptions(
          fetchPolicy: FetchPolicy.noCache,         //graphQL query
          document: gql("""  
          query MyQuery {
  users {
    id
    imageurl
    name
    description
  }
}
"""),
        ),
      );

      if (result.hasException) {
        throw Exception(result.exception);
      }

      List? res = result.data?['users'];     //fetched data from database 

      if (res == null || res.isEmpty) {
        return [];
      }
      List<UserModel> userData =
          res.map((user) => UserModel.fromMap(map: user)).toList();      //saved in userData by calling method from userModel

      return userData;
    } catch (error) {
      throw Exception(error);
    }
  }
}
