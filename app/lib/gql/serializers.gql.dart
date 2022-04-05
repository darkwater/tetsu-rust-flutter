import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:gql_code_builder/src/serializers/operation_serializer.dart'
    show OperationSerializer;
import 'package:tetsu/gql/get_anime_details.data.gql.dart'
    show
        GGetAnimeDetailsData,
        GGetAnimeDetailsData_anime,
        GGetAnimeDetailsData_anime_episodes,
        GGetAnimeDetailsData_anime_episodes_files,
        GGetAnimeDetailsData_anime_episodes_files_audioTracks,
        GGetAnimeDetailsData_anime_episodes_files_group,
        GGetAnimeDetailsData_anime_episodes_files_videoTracks;
import 'package:tetsu/gql/get_anime_details.req.gql.dart'
    show GGetAnimeDetailsReq;
import 'package:tetsu/gql/get_anime_details.var.gql.dart'
    show GGetAnimeDetailsVars;
import 'package:tetsu/gql/get_anime_shows.data.gql.dart'
    show GGetAnimeShowsData, GGetAnimeShowsData_animes;
import 'package:tetsu/gql/get_anime_shows.req.gql.dart' show GGetAnimeShowsReq;
import 'package:tetsu/gql/get_anime_shows.var.gql.dart' show GGetAnimeShowsVars;
import 'package:tetsu/gql/schema.schema.gql.dart' show GRelatedAnimeType;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(OperationSerializer())
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GGetAnimeDetailsData,
  GGetAnimeDetailsData_anime,
  GGetAnimeDetailsData_anime_episodes,
  GGetAnimeDetailsData_anime_episodes_files,
  GGetAnimeDetailsData_anime_episodes_files_audioTracks,
  GGetAnimeDetailsData_anime_episodes_files_group,
  GGetAnimeDetailsData_anime_episodes_files_videoTracks,
  GGetAnimeDetailsReq,
  GGetAnimeDetailsVars,
  GGetAnimeShowsData,
  GGetAnimeShowsData_animes,
  GGetAnimeShowsReq,
  GGetAnimeShowsVars,
  GRelatedAnimeType
])
final Serializers serializers = _serializersBuilder.build();
