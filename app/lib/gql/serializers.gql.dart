import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:gql_code_builder/src/serializers/operation_serializer.dart'
    show OperationSerializer;
import 'package:tetsu/gql/get_anime_details.data.gql.dart'
    show
        GGetAnimeDetailsData,
        GGetAnimeDetailsData_anime,
        GGetAnimeDetailsData_anime_files,
        GGetAnimeDetailsData_anime_files_audioTracks,
        GGetAnimeDetailsData_anime_files_episode,
        GGetAnimeDetailsData_anime_files_group,
        GGetAnimeDetailsData_anime_files_videoTracks;
import 'package:tetsu/gql/get_anime_details.req.gql.dart'
    show GGetAnimeDetailsReq;
import 'package:tetsu/gql/get_anime_details.var.gql.dart'
    show GGetAnimeDetailsVars;
import 'package:tetsu/gql/get_anime_shows.data.gql.dart'
    show
        GGetAnimeShowsData,
        GGetAnimeShowsData_animes,
        GGetAnimeShowsData_animes_watchProgress;
import 'package:tetsu/gql/get_anime_shows.req.gql.dart' show GGetAnimeShowsReq;
import 'package:tetsu/gql/get_anime_shows.var.gql.dart' show GGetAnimeShowsVars;
import 'package:tetsu/gql/get_player_status.data.gql.dart'
    show GGetPlayerStatusData, GGetPlayerStatusData_player;
import 'package:tetsu/gql/get_player_status.req.gql.dart'
    show GGetPlayerStatusReq;
import 'package:tetsu/gql/get_player_status.var.gql.dart'
    show GGetPlayerStatusVars;
import 'package:tetsu/gql/load_playlist.data.gql.dart'
    show GLoadPlaylistData, GLoadPlaylistData_player;
import 'package:tetsu/gql/load_playlist.req.gql.dart' show GLoadPlaylistReq;
import 'package:tetsu/gql/load_playlist.var.gql.dart' show GLoadPlaylistVars;
import 'package:tetsu/gql/player_seek.data.gql.dart'
    show GPlayerSeekData, GPlayerSeekData_player;
import 'package:tetsu/gql/player_seek.req.gql.dart' show GPlayerSeekReq;
import 'package:tetsu/gql/player_seek.var.gql.dart' show GPlayerSeekVars;
import 'package:tetsu/gql/schema.schema.gql.dart'
    show GEpisodeType, GRelatedAnimeType;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(OperationSerializer())
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GEpisodeType,
  GGetAnimeDetailsData,
  GGetAnimeDetailsData_anime,
  GGetAnimeDetailsData_anime_files,
  GGetAnimeDetailsData_anime_files_audioTracks,
  GGetAnimeDetailsData_anime_files_episode,
  GGetAnimeDetailsData_anime_files_group,
  GGetAnimeDetailsData_anime_files_videoTracks,
  GGetAnimeDetailsReq,
  GGetAnimeDetailsVars,
  GGetAnimeShowsData,
  GGetAnimeShowsData_animes,
  GGetAnimeShowsData_animes_watchProgress,
  GGetAnimeShowsReq,
  GGetAnimeShowsVars,
  GGetPlayerStatusData,
  GGetPlayerStatusData_player,
  GGetPlayerStatusReq,
  GGetPlayerStatusVars,
  GLoadPlaylistData,
  GLoadPlaylistData_player,
  GLoadPlaylistReq,
  GLoadPlaylistVars,
  GPlayerSeekData,
  GPlayerSeekData_player,
  GPlayerSeekReq,
  GPlayerSeekVars,
  GRelatedAnimeType
])
final Serializers serializers = _serializersBuilder.build();
