// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_anime_details.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetAnimeDetailsData> _$gGetAnimeDetailsDataSerializer =
    new _$GGetAnimeDetailsDataSerializer();
Serializer<GGetAnimeDetailsData_anime> _$gGetAnimeDetailsDataAnimeSerializer =
    new _$GGetAnimeDetailsData_animeSerializer();
Serializer<GGetAnimeDetailsData_anime_episodes>
    _$gGetAnimeDetailsDataAnimeEpisodesSerializer =
    new _$GGetAnimeDetailsData_anime_episodesSerializer();
Serializer<GGetAnimeDetailsData_anime_episodes_files>
    _$gGetAnimeDetailsDataAnimeEpisodesFilesSerializer =
    new _$GGetAnimeDetailsData_anime_episodes_filesSerializer();
Serializer<GGetAnimeDetailsData_anime_episodes_files_videoTracks>
    _$gGetAnimeDetailsDataAnimeEpisodesFilesVideoTracksSerializer =
    new _$GGetAnimeDetailsData_anime_episodes_files_videoTracksSerializer();
Serializer<GGetAnimeDetailsData_anime_episodes_files_audioTracks>
    _$gGetAnimeDetailsDataAnimeEpisodesFilesAudioTracksSerializer =
    new _$GGetAnimeDetailsData_anime_episodes_files_audioTracksSerializer();
Serializer<GGetAnimeDetailsData_anime_episodes_files_group>
    _$gGetAnimeDetailsDataAnimeEpisodesFilesGroupSerializer =
    new _$GGetAnimeDetailsData_anime_episodes_files_groupSerializer();

class _$GGetAnimeDetailsDataSerializer
    implements StructuredSerializer<GGetAnimeDetailsData> {
  @override
  final Iterable<Type> types = const [
    GGetAnimeDetailsData,
    _$GGetAnimeDetailsData
  ];
  @override
  final String wireName = 'GGetAnimeDetailsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetAnimeDetailsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.anime;
    if (value != null) {
      result
        ..add('anime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GGetAnimeDetailsData_anime)));
    }
    return result;
  }

  @override
  GGetAnimeDetailsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetAnimeDetailsDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'anime':
          result.anime.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GGetAnimeDetailsData_anime))!
              as GGetAnimeDetailsData_anime);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetAnimeDetailsData_animeSerializer
    implements StructuredSerializer<GGetAnimeDetailsData_anime> {
  @override
  final Iterable<Type> types = const [
    GGetAnimeDetailsData_anime,
    _$GGetAnimeDetailsData_anime
  ];
  @override
  final String wireName = 'GGetAnimeDetailsData_anime';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetAnimeDetailsData_anime object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'aid',
      serializers.serialize(object.aid, specifiedType: const FullType(int)),
      'year',
      serializers.serialize(object.year, specifiedType: const FullType(String)),
      'atype',
      serializers.serialize(object.atype,
          specifiedType: const FullType(String)),
      'romajiName',
      serializers.serialize(object.romajiName,
          specifiedType: const FullType(String)),
      'kanjiName',
      serializers.serialize(object.kanjiName,
          specifiedType: const FullType(String)),
      'englishName',
      serializers.serialize(object.englishName,
          specifiedType: const FullType(String)),
      'shortNameList',
      serializers.serialize(object.shortNameList,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'episodeCount',
      serializers.serialize(object.episodeCount,
          specifiedType: const FullType(int)),
      'specialEpCount',
      serializers.serialize(object.specialEpCount,
          specifiedType: const FullType(int)),
      'airDate',
      serializers.serialize(object.airDate, specifiedType: const FullType(int)),
      'endDate',
      serializers.serialize(object.endDate, specifiedType: const FullType(int)),
      'picname',
      serializers.serialize(object.picname,
          specifiedType: const FullType(String)),
      'nsfw',
      serializers.serialize(object.nsfw, specifiedType: const FullType(bool)),
      'characteridList',
      serializers.serialize(object.characteridList,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
      'specialsCount',
      serializers.serialize(object.specialsCount,
          specifiedType: const FullType(int)),
      'creditsCount',
      serializers.serialize(object.creditsCount,
          specifiedType: const FullType(int)),
      'otherCount',
      serializers.serialize(object.otherCount,
          specifiedType: const FullType(int)),
      'trailerCount',
      serializers.serialize(object.trailerCount,
          specifiedType: const FullType(int)),
      'parodyCount',
      serializers.serialize(object.parodyCount,
          specifiedType: const FullType(int)),
      'episodes',
      serializers.serialize(object.episodes,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GGetAnimeDetailsData_anime_episodes)])),
    ];

    return result;
  }

  @override
  GGetAnimeDetailsData_anime deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetAnimeDetailsData_animeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'aid':
          result.aid = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'year':
          result.year = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'atype':
          result.atype = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'romajiName':
          result.romajiName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'kanjiName':
          result.kanjiName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'englishName':
          result.englishName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'shortNameList':
          result.shortNameList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'episodeCount':
          result.episodeCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'specialEpCount':
          result.specialEpCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'airDate':
          result.airDate = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'endDate':
          result.endDate = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'picname':
          result.picname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'nsfw':
          result.nsfw = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'characteridList':
          result.characteridList.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'specialsCount':
          result.specialsCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'creditsCount':
          result.creditsCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'otherCount':
          result.otherCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'trailerCount':
          result.trailerCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'parodyCount':
          result.parodyCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'episodes':
          result.episodes.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GGetAnimeDetailsData_anime_episodes)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetAnimeDetailsData_anime_episodesSerializer
    implements StructuredSerializer<GGetAnimeDetailsData_anime_episodes> {
  @override
  final Iterable<Type> types = const [
    GGetAnimeDetailsData_anime_episodes,
    _$GGetAnimeDetailsData_anime_episodes
  ];
  @override
  final String wireName = 'GGetAnimeDetailsData_anime_episodes';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetAnimeDetailsData_anime_episodes object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'eid',
      serializers.serialize(object.eid, specifiedType: const FullType(int)),
      'length',
      serializers.serialize(object.length, specifiedType: const FullType(int)),
      'rating',
      serializers.serialize(object.rating, specifiedType: const FullType(int)),
      'votes',
      serializers.serialize(object.votes, specifiedType: const FullType(int)),
      'epno',
      serializers.serialize(object.epno, specifiedType: const FullType(String)),
      'eng',
      serializers.serialize(object.eng, specifiedType: const FullType(String)),
      'romaji',
      serializers.serialize(object.romaji,
          specifiedType: const FullType(String)),
      'kanji',
      serializers.serialize(object.kanji,
          specifiedType: const FullType(String)),
      'aired',
      serializers.serialize(object.aired, specifiedType: const FullType(int)),
      'episodeType',
      serializers.serialize(object.episodeType,
          specifiedType: const FullType(_i2.GEpisodeType)),
      'files',
      serializers.serialize(object.files,
          specifiedType: const FullType(BuiltList, const [
            const FullType(GGetAnimeDetailsData_anime_episodes_files)
          ])),
    ];

    return result;
  }

  @override
  GGetAnimeDetailsData_anime_episodes deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetAnimeDetailsData_anime_episodesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'eid':
          result.eid = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'length':
          result.length = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'votes':
          result.votes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'epno':
          result.epno = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'eng':
          result.eng = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'romaji':
          result.romaji = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'kanji':
          result.kanji = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'aired':
          result.aired = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'episodeType':
          result.episodeType = serializers.deserialize(value,
                  specifiedType: const FullType(_i2.GEpisodeType))
              as _i2.GEpisodeType;
          break;
        case 'files':
          result.files.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GGetAnimeDetailsData_anime_episodes_files)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetAnimeDetailsData_anime_episodes_filesSerializer
    implements StructuredSerializer<GGetAnimeDetailsData_anime_episodes_files> {
  @override
  final Iterable<Type> types = const [
    GGetAnimeDetailsData_anime_episodes_files,
    _$GGetAnimeDetailsData_anime_episodes_files
  ];
  @override
  final String wireName = 'GGetAnimeDetailsData_anime_episodes_files';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetAnimeDetailsData_anime_episodes_files object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'fid',
      serializers.serialize(object.fid, specifiedType: const FullType(int)),
      'state',
      serializers.serialize(object.state, specifiedType: const FullType(int)),
      'size',
      serializers.serialize(object.size, specifiedType: const FullType(int)),
      'quality',
      serializers.serialize(object.quality,
          specifiedType: const FullType(String)),
      'source',
      serializers.serialize(object.source,
          specifiedType: const FullType(String)),
      'subLanguages',
      serializers.serialize(object.subLanguages,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'videoTracks',
      serializers.serialize(object.videoTracks,
          specifiedType: const FullType(BuiltList, const [
            const FullType(
                GGetAnimeDetailsData_anime_episodes_files_videoTracks)
          ])),
      'audioTracks',
      serializers.serialize(object.audioTracks,
          specifiedType: const FullType(BuiltList, const [
            const FullType(
                GGetAnimeDetailsData_anime_episodes_files_audioTracks)
          ])),
      'lengthInSeconds',
      serializers.serialize(object.lengthInSeconds,
          specifiedType: const FullType(int)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'airedDate',
      serializers.serialize(object.airedDate,
          specifiedType: const FullType(int)),
      'onDisk',
      serializers.serialize(object.onDisk,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];
    Object? value;
    value = object.group;
    if (value != null) {
      result
        ..add('group')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GGetAnimeDetailsData_anime_episodes_files_group)));
    }
    return result;
  }

  @override
  GGetAnimeDetailsData_anime_episodes_files deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetAnimeDetailsData_anime_episodes_filesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'fid':
          result.fid = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'size':
          result.size = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'quality':
          result.quality = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'source':
          result.source = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'subLanguages':
          result.subLanguages.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'videoTracks':
          result.videoTracks.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    GGetAnimeDetailsData_anime_episodes_files_videoTracks)
              ]))! as BuiltList<Object?>);
          break;
        case 'audioTracks':
          result.audioTracks.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    GGetAnimeDetailsData_anime_episodes_files_audioTracks)
              ]))! as BuiltList<Object?>);
          break;
        case 'lengthInSeconds':
          result.lengthInSeconds = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'airedDate':
          result.airedDate = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'onDisk':
          result.onDisk.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'group':
          result.group.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GGetAnimeDetailsData_anime_episodes_files_group))!
              as GGetAnimeDetailsData_anime_episodes_files_group);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetAnimeDetailsData_anime_episodes_files_videoTracksSerializer
    implements
        StructuredSerializer<
            GGetAnimeDetailsData_anime_episodes_files_videoTracks> {
  @override
  final Iterable<Type> types = const [
    GGetAnimeDetailsData_anime_episodes_files_videoTracks,
    _$GGetAnimeDetailsData_anime_episodes_files_videoTracks
  ];
  @override
  final String wireName =
      'GGetAnimeDetailsData_anime_episodes_files_videoTracks';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetAnimeDetailsData_anime_episodes_files_videoTracks object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'codec',
      serializers.serialize(object.codec,
          specifiedType: const FullType(String)),
      'bitrate',
      serializers.serialize(object.bitrate,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.colourDepth;
    if (value != null) {
      result
        ..add('colourDepth')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GGetAnimeDetailsData_anime_episodes_files_videoTracks deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetAnimeDetailsData_anime_episodes_files_videoTracksBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'colourDepth':
          result.colourDepth = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'codec':
          result.codec = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'bitrate':
          result.bitrate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetAnimeDetailsData_anime_episodes_files_audioTracksSerializer
    implements
        StructuredSerializer<
            GGetAnimeDetailsData_anime_episodes_files_audioTracks> {
  @override
  final Iterable<Type> types = const [
    GGetAnimeDetailsData_anime_episodes_files_audioTracks,
    _$GGetAnimeDetailsData_anime_episodes_files_audioTracks
  ];
  @override
  final String wireName =
      'GGetAnimeDetailsData_anime_episodes_files_audioTracks';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetAnimeDetailsData_anime_episodes_files_audioTracks object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'codec',
      serializers.serialize(object.codec,
          specifiedType: const FullType(String)),
      'bitrate',
      serializers.serialize(object.bitrate,
          specifiedType: const FullType(String)),
      'language',
      serializers.serialize(object.language,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GGetAnimeDetailsData_anime_episodes_files_audioTracks deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetAnimeDetailsData_anime_episodes_files_audioTracksBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'codec':
          result.codec = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'bitrate':
          result.bitrate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'language':
          result.language = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetAnimeDetailsData_anime_episodes_files_groupSerializer
    implements
        StructuredSerializer<GGetAnimeDetailsData_anime_episodes_files_group> {
  @override
  final Iterable<Type> types = const [
    GGetAnimeDetailsData_anime_episodes_files_group,
    _$GGetAnimeDetailsData_anime_episodes_files_group
  ];
  @override
  final String wireName = 'GGetAnimeDetailsData_anime_episodes_files_group';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetAnimeDetailsData_anime_episodes_files_group object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'gid',
      serializers.serialize(object.gid, specifiedType: const FullType(int)),
      'rating',
      serializers.serialize(object.rating, specifiedType: const FullType(int)),
      'votes',
      serializers.serialize(object.votes, specifiedType: const FullType(int)),
      'acount',
      serializers.serialize(object.acount, specifiedType: const FullType(int)),
      'fcount',
      serializers.serialize(object.fcount, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'short',
      serializers.serialize(object.short,
          specifiedType: const FullType(String)),
      'ircChannel',
      serializers.serialize(object.ircChannel,
          specifiedType: const FullType(String)),
      'ircServer',
      serializers.serialize(object.ircServer,
          specifiedType: const FullType(String)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'picname',
      serializers.serialize(object.picname,
          specifiedType: const FullType(String)),
      'foundeddate',
      serializers.serialize(object.foundeddate,
          specifiedType: const FullType(int)),
      'disbandeddate',
      serializers.serialize(object.disbandeddate,
          specifiedType: const FullType(int)),
      'dateflags',
      serializers.serialize(object.dateflags,
          specifiedType: const FullType(int)),
      'lastreleasedate',
      serializers.serialize(object.lastreleasedate,
          specifiedType: const FullType(int)),
      'lastactivitydate',
      serializers.serialize(object.lastactivitydate,
          specifiedType: const FullType(int)),
      'grouprelations',
      serializers.serialize(object.grouprelations,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GGetAnimeDetailsData_anime_episodes_files_group deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetAnimeDetailsData_anime_episodes_files_groupBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'gid':
          result.gid = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'votes':
          result.votes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'acount':
          result.acount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'fcount':
          result.fcount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'short':
          result.short = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'ircChannel':
          result.ircChannel = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'ircServer':
          result.ircServer = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'picname':
          result.picname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'foundeddate':
          result.foundeddate = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'disbandeddate':
          result.disbandeddate = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'dateflags':
          result.dateflags = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'lastreleasedate':
          result.lastreleasedate = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'lastactivitydate':
          result.lastactivitydate = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'grouprelations':
          result.grouprelations = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetAnimeDetailsData extends GGetAnimeDetailsData {
  @override
  final String G__typename;
  @override
  final GGetAnimeDetailsData_anime? anime;

  factory _$GGetAnimeDetailsData(
          [void Function(GGetAnimeDetailsDataBuilder)? updates]) =>
      (new GGetAnimeDetailsDataBuilder()..update(updates)).build();

  _$GGetAnimeDetailsData._({required this.G__typename, this.anime})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GGetAnimeDetailsData', 'G__typename');
  }

  @override
  GGetAnimeDetailsData rebuild(
          void Function(GGetAnimeDetailsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetAnimeDetailsDataBuilder toBuilder() =>
      new GGetAnimeDetailsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetAnimeDetailsData &&
        G__typename == other.G__typename &&
        anime == other.anime;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), anime.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GGetAnimeDetailsData')
          ..add('G__typename', G__typename)
          ..add('anime', anime))
        .toString();
  }
}

class GGetAnimeDetailsDataBuilder
    implements Builder<GGetAnimeDetailsData, GGetAnimeDetailsDataBuilder> {
  _$GGetAnimeDetailsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GGetAnimeDetailsData_animeBuilder? _anime;
  GGetAnimeDetailsData_animeBuilder get anime =>
      _$this._anime ??= new GGetAnimeDetailsData_animeBuilder();
  set anime(GGetAnimeDetailsData_animeBuilder? anime) => _$this._anime = anime;

  GGetAnimeDetailsDataBuilder() {
    GGetAnimeDetailsData._initializeBuilder(this);
  }

  GGetAnimeDetailsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _anime = $v.anime?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetAnimeDetailsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetAnimeDetailsData;
  }

  @override
  void update(void Function(GGetAnimeDetailsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GGetAnimeDetailsData build() {
    _$GGetAnimeDetailsData _$result;
    try {
      _$result = _$v ??
          new _$GGetAnimeDetailsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GGetAnimeDetailsData', 'G__typename'),
              anime: _anime?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'anime';
        _anime?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GGetAnimeDetailsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetAnimeDetailsData_anime extends GGetAnimeDetailsData_anime {
  @override
  final String G__typename;
  @override
  final int aid;
  @override
  final String year;
  @override
  final String atype;
  @override
  final String romajiName;
  @override
  final String kanjiName;
  @override
  final String englishName;
  @override
  final BuiltList<String> shortNameList;
  @override
  final int episodeCount;
  @override
  final int specialEpCount;
  @override
  final int airDate;
  @override
  final int endDate;
  @override
  final String picname;
  @override
  final bool nsfw;
  @override
  final BuiltList<int> characteridList;
  @override
  final int specialsCount;
  @override
  final int creditsCount;
  @override
  final int otherCount;
  @override
  final int trailerCount;
  @override
  final int parodyCount;
  @override
  final BuiltList<GGetAnimeDetailsData_anime_episodes> episodes;

  factory _$GGetAnimeDetailsData_anime(
          [void Function(GGetAnimeDetailsData_animeBuilder)? updates]) =>
      (new GGetAnimeDetailsData_animeBuilder()..update(updates)).build();

  _$GGetAnimeDetailsData_anime._(
      {required this.G__typename,
      required this.aid,
      required this.year,
      required this.atype,
      required this.romajiName,
      required this.kanjiName,
      required this.englishName,
      required this.shortNameList,
      required this.episodeCount,
      required this.specialEpCount,
      required this.airDate,
      required this.endDate,
      required this.picname,
      required this.nsfw,
      required this.characteridList,
      required this.specialsCount,
      required this.creditsCount,
      required this.otherCount,
      required this.trailerCount,
      required this.parodyCount,
      required this.episodes})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GGetAnimeDetailsData_anime', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        aid, 'GGetAnimeDetailsData_anime', 'aid');
    BuiltValueNullFieldError.checkNotNull(
        year, 'GGetAnimeDetailsData_anime', 'year');
    BuiltValueNullFieldError.checkNotNull(
        atype, 'GGetAnimeDetailsData_anime', 'atype');
    BuiltValueNullFieldError.checkNotNull(
        romajiName, 'GGetAnimeDetailsData_anime', 'romajiName');
    BuiltValueNullFieldError.checkNotNull(
        kanjiName, 'GGetAnimeDetailsData_anime', 'kanjiName');
    BuiltValueNullFieldError.checkNotNull(
        englishName, 'GGetAnimeDetailsData_anime', 'englishName');
    BuiltValueNullFieldError.checkNotNull(
        shortNameList, 'GGetAnimeDetailsData_anime', 'shortNameList');
    BuiltValueNullFieldError.checkNotNull(
        episodeCount, 'GGetAnimeDetailsData_anime', 'episodeCount');
    BuiltValueNullFieldError.checkNotNull(
        specialEpCount, 'GGetAnimeDetailsData_anime', 'specialEpCount');
    BuiltValueNullFieldError.checkNotNull(
        airDate, 'GGetAnimeDetailsData_anime', 'airDate');
    BuiltValueNullFieldError.checkNotNull(
        endDate, 'GGetAnimeDetailsData_anime', 'endDate');
    BuiltValueNullFieldError.checkNotNull(
        picname, 'GGetAnimeDetailsData_anime', 'picname');
    BuiltValueNullFieldError.checkNotNull(
        nsfw, 'GGetAnimeDetailsData_anime', 'nsfw');
    BuiltValueNullFieldError.checkNotNull(
        characteridList, 'GGetAnimeDetailsData_anime', 'characteridList');
    BuiltValueNullFieldError.checkNotNull(
        specialsCount, 'GGetAnimeDetailsData_anime', 'specialsCount');
    BuiltValueNullFieldError.checkNotNull(
        creditsCount, 'GGetAnimeDetailsData_anime', 'creditsCount');
    BuiltValueNullFieldError.checkNotNull(
        otherCount, 'GGetAnimeDetailsData_anime', 'otherCount');
    BuiltValueNullFieldError.checkNotNull(
        trailerCount, 'GGetAnimeDetailsData_anime', 'trailerCount');
    BuiltValueNullFieldError.checkNotNull(
        parodyCount, 'GGetAnimeDetailsData_anime', 'parodyCount');
    BuiltValueNullFieldError.checkNotNull(
        episodes, 'GGetAnimeDetailsData_anime', 'episodes');
  }

  @override
  GGetAnimeDetailsData_anime rebuild(
          void Function(GGetAnimeDetailsData_animeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetAnimeDetailsData_animeBuilder toBuilder() =>
      new GGetAnimeDetailsData_animeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetAnimeDetailsData_anime &&
        G__typename == other.G__typename &&
        aid == other.aid &&
        year == other.year &&
        atype == other.atype &&
        romajiName == other.romajiName &&
        kanjiName == other.kanjiName &&
        englishName == other.englishName &&
        shortNameList == other.shortNameList &&
        episodeCount == other.episodeCount &&
        specialEpCount == other.specialEpCount &&
        airDate == other.airDate &&
        endDate == other.endDate &&
        picname == other.picname &&
        nsfw == other.nsfw &&
        characteridList == other.characteridList &&
        specialsCount == other.specialsCount &&
        creditsCount == other.creditsCount &&
        otherCount == other.otherCount &&
        trailerCount == other.trailerCount &&
        parodyCount == other.parodyCount &&
        episodes == other.episodes;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc(0, G__typename.hashCode), aid.hashCode),
                                                                                year.hashCode),
                                                                            atype.hashCode),
                                                                        romajiName.hashCode),
                                                                    kanjiName.hashCode),
                                                                englishName.hashCode),
                                                            shortNameList.hashCode),
                                                        episodeCount.hashCode),
                                                    specialEpCount.hashCode),
                                                airDate.hashCode),
                                            endDate.hashCode),
                                        picname.hashCode),
                                    nsfw.hashCode),
                                characteridList.hashCode),
                            specialsCount.hashCode),
                        creditsCount.hashCode),
                    otherCount.hashCode),
                trailerCount.hashCode),
            parodyCount.hashCode),
        episodes.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GGetAnimeDetailsData_anime')
          ..add('G__typename', G__typename)
          ..add('aid', aid)
          ..add('year', year)
          ..add('atype', atype)
          ..add('romajiName', romajiName)
          ..add('kanjiName', kanjiName)
          ..add('englishName', englishName)
          ..add('shortNameList', shortNameList)
          ..add('episodeCount', episodeCount)
          ..add('specialEpCount', specialEpCount)
          ..add('airDate', airDate)
          ..add('endDate', endDate)
          ..add('picname', picname)
          ..add('nsfw', nsfw)
          ..add('characteridList', characteridList)
          ..add('specialsCount', specialsCount)
          ..add('creditsCount', creditsCount)
          ..add('otherCount', otherCount)
          ..add('trailerCount', trailerCount)
          ..add('parodyCount', parodyCount)
          ..add('episodes', episodes))
        .toString();
  }
}

class GGetAnimeDetailsData_animeBuilder
    implements
        Builder<GGetAnimeDetailsData_anime, GGetAnimeDetailsData_animeBuilder> {
  _$GGetAnimeDetailsData_anime? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _aid;
  int? get aid => _$this._aid;
  set aid(int? aid) => _$this._aid = aid;

  String? _year;
  String? get year => _$this._year;
  set year(String? year) => _$this._year = year;

  String? _atype;
  String? get atype => _$this._atype;
  set atype(String? atype) => _$this._atype = atype;

  String? _romajiName;
  String? get romajiName => _$this._romajiName;
  set romajiName(String? romajiName) => _$this._romajiName = romajiName;

  String? _kanjiName;
  String? get kanjiName => _$this._kanjiName;
  set kanjiName(String? kanjiName) => _$this._kanjiName = kanjiName;

  String? _englishName;
  String? get englishName => _$this._englishName;
  set englishName(String? englishName) => _$this._englishName = englishName;

  ListBuilder<String>? _shortNameList;
  ListBuilder<String> get shortNameList =>
      _$this._shortNameList ??= new ListBuilder<String>();
  set shortNameList(ListBuilder<String>? shortNameList) =>
      _$this._shortNameList = shortNameList;

  int? _episodeCount;
  int? get episodeCount => _$this._episodeCount;
  set episodeCount(int? episodeCount) => _$this._episodeCount = episodeCount;

  int? _specialEpCount;
  int? get specialEpCount => _$this._specialEpCount;
  set specialEpCount(int? specialEpCount) =>
      _$this._specialEpCount = specialEpCount;

  int? _airDate;
  int? get airDate => _$this._airDate;
  set airDate(int? airDate) => _$this._airDate = airDate;

  int? _endDate;
  int? get endDate => _$this._endDate;
  set endDate(int? endDate) => _$this._endDate = endDate;

  String? _picname;
  String? get picname => _$this._picname;
  set picname(String? picname) => _$this._picname = picname;

  bool? _nsfw;
  bool? get nsfw => _$this._nsfw;
  set nsfw(bool? nsfw) => _$this._nsfw = nsfw;

  ListBuilder<int>? _characteridList;
  ListBuilder<int> get characteridList =>
      _$this._characteridList ??= new ListBuilder<int>();
  set characteridList(ListBuilder<int>? characteridList) =>
      _$this._characteridList = characteridList;

  int? _specialsCount;
  int? get specialsCount => _$this._specialsCount;
  set specialsCount(int? specialsCount) =>
      _$this._specialsCount = specialsCount;

  int? _creditsCount;
  int? get creditsCount => _$this._creditsCount;
  set creditsCount(int? creditsCount) => _$this._creditsCount = creditsCount;

  int? _otherCount;
  int? get otherCount => _$this._otherCount;
  set otherCount(int? otherCount) => _$this._otherCount = otherCount;

  int? _trailerCount;
  int? get trailerCount => _$this._trailerCount;
  set trailerCount(int? trailerCount) => _$this._trailerCount = trailerCount;

  int? _parodyCount;
  int? get parodyCount => _$this._parodyCount;
  set parodyCount(int? parodyCount) => _$this._parodyCount = parodyCount;

  ListBuilder<GGetAnimeDetailsData_anime_episodes>? _episodes;
  ListBuilder<GGetAnimeDetailsData_anime_episodes> get episodes =>
      _$this._episodes ??=
          new ListBuilder<GGetAnimeDetailsData_anime_episodes>();
  set episodes(ListBuilder<GGetAnimeDetailsData_anime_episodes>? episodes) =>
      _$this._episodes = episodes;

  GGetAnimeDetailsData_animeBuilder() {
    GGetAnimeDetailsData_anime._initializeBuilder(this);
  }

  GGetAnimeDetailsData_animeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _aid = $v.aid;
      _year = $v.year;
      _atype = $v.atype;
      _romajiName = $v.romajiName;
      _kanjiName = $v.kanjiName;
      _englishName = $v.englishName;
      _shortNameList = $v.shortNameList.toBuilder();
      _episodeCount = $v.episodeCount;
      _specialEpCount = $v.specialEpCount;
      _airDate = $v.airDate;
      _endDate = $v.endDate;
      _picname = $v.picname;
      _nsfw = $v.nsfw;
      _characteridList = $v.characteridList.toBuilder();
      _specialsCount = $v.specialsCount;
      _creditsCount = $v.creditsCount;
      _otherCount = $v.otherCount;
      _trailerCount = $v.trailerCount;
      _parodyCount = $v.parodyCount;
      _episodes = $v.episodes.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetAnimeDetailsData_anime other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetAnimeDetailsData_anime;
  }

  @override
  void update(void Function(GGetAnimeDetailsData_animeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GGetAnimeDetailsData_anime build() {
    _$GGetAnimeDetailsData_anime _$result;
    try {
      _$result = _$v ??
          new _$GGetAnimeDetailsData_anime._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GGetAnimeDetailsData_anime', 'G__typename'),
              aid: BuiltValueNullFieldError.checkNotNull(
                  aid, 'GGetAnimeDetailsData_anime', 'aid'),
              year: BuiltValueNullFieldError.checkNotNull(
                  year, 'GGetAnimeDetailsData_anime', 'year'),
              atype: BuiltValueNullFieldError.checkNotNull(
                  atype, 'GGetAnimeDetailsData_anime', 'atype'),
              romajiName: BuiltValueNullFieldError.checkNotNull(
                  romajiName, 'GGetAnimeDetailsData_anime', 'romajiName'),
              kanjiName: BuiltValueNullFieldError.checkNotNull(
                  kanjiName, 'GGetAnimeDetailsData_anime', 'kanjiName'),
              englishName: BuiltValueNullFieldError.checkNotNull(
                  englishName, 'GGetAnimeDetailsData_anime', 'englishName'),
              shortNameList: shortNameList.build(),
              episodeCount: BuiltValueNullFieldError.checkNotNull(
                  episodeCount, 'GGetAnimeDetailsData_anime', 'episodeCount'),
              specialEpCount: BuiltValueNullFieldError.checkNotNull(specialEpCount, 'GGetAnimeDetailsData_anime', 'specialEpCount'),
              airDate: BuiltValueNullFieldError.checkNotNull(airDate, 'GGetAnimeDetailsData_anime', 'airDate'),
              endDate: BuiltValueNullFieldError.checkNotNull(endDate, 'GGetAnimeDetailsData_anime', 'endDate'),
              picname: BuiltValueNullFieldError.checkNotNull(picname, 'GGetAnimeDetailsData_anime', 'picname'),
              nsfw: BuiltValueNullFieldError.checkNotNull(nsfw, 'GGetAnimeDetailsData_anime', 'nsfw'),
              characteridList: characteridList.build(),
              specialsCount: BuiltValueNullFieldError.checkNotNull(specialsCount, 'GGetAnimeDetailsData_anime', 'specialsCount'),
              creditsCount: BuiltValueNullFieldError.checkNotNull(creditsCount, 'GGetAnimeDetailsData_anime', 'creditsCount'),
              otherCount: BuiltValueNullFieldError.checkNotNull(otherCount, 'GGetAnimeDetailsData_anime', 'otherCount'),
              trailerCount: BuiltValueNullFieldError.checkNotNull(trailerCount, 'GGetAnimeDetailsData_anime', 'trailerCount'),
              parodyCount: BuiltValueNullFieldError.checkNotNull(parodyCount, 'GGetAnimeDetailsData_anime', 'parodyCount'),
              episodes: episodes.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'shortNameList';
        shortNameList.build();

        _$failedField = 'characteridList';
        characteridList.build();

        _$failedField = 'episodes';
        episodes.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GGetAnimeDetailsData_anime', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetAnimeDetailsData_anime_episodes
    extends GGetAnimeDetailsData_anime_episodes {
  @override
  final String G__typename;
  @override
  final int eid;
  @override
  final int length;
  @override
  final int rating;
  @override
  final int votes;
  @override
  final String epno;
  @override
  final String eng;
  @override
  final String romaji;
  @override
  final String kanji;
  @override
  final int aired;
  @override
  final _i2.GEpisodeType episodeType;
  @override
  final BuiltList<GGetAnimeDetailsData_anime_episodes_files> files;

  factory _$GGetAnimeDetailsData_anime_episodes(
          [void Function(GGetAnimeDetailsData_anime_episodesBuilder)?
              updates]) =>
      (new GGetAnimeDetailsData_anime_episodesBuilder()..update(updates))
          .build();

  _$GGetAnimeDetailsData_anime_episodes._(
      {required this.G__typename,
      required this.eid,
      required this.length,
      required this.rating,
      required this.votes,
      required this.epno,
      required this.eng,
      required this.romaji,
      required this.kanji,
      required this.aired,
      required this.episodeType,
      required this.files})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, 'GGetAnimeDetailsData_anime_episodes', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        eid, 'GGetAnimeDetailsData_anime_episodes', 'eid');
    BuiltValueNullFieldError.checkNotNull(
        length, 'GGetAnimeDetailsData_anime_episodes', 'length');
    BuiltValueNullFieldError.checkNotNull(
        rating, 'GGetAnimeDetailsData_anime_episodes', 'rating');
    BuiltValueNullFieldError.checkNotNull(
        votes, 'GGetAnimeDetailsData_anime_episodes', 'votes');
    BuiltValueNullFieldError.checkNotNull(
        epno, 'GGetAnimeDetailsData_anime_episodes', 'epno');
    BuiltValueNullFieldError.checkNotNull(
        eng, 'GGetAnimeDetailsData_anime_episodes', 'eng');
    BuiltValueNullFieldError.checkNotNull(
        romaji, 'GGetAnimeDetailsData_anime_episodes', 'romaji');
    BuiltValueNullFieldError.checkNotNull(
        kanji, 'GGetAnimeDetailsData_anime_episodes', 'kanji');
    BuiltValueNullFieldError.checkNotNull(
        aired, 'GGetAnimeDetailsData_anime_episodes', 'aired');
    BuiltValueNullFieldError.checkNotNull(
        episodeType, 'GGetAnimeDetailsData_anime_episodes', 'episodeType');
    BuiltValueNullFieldError.checkNotNull(
        files, 'GGetAnimeDetailsData_anime_episodes', 'files');
  }

  @override
  GGetAnimeDetailsData_anime_episodes rebuild(
          void Function(GGetAnimeDetailsData_anime_episodesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetAnimeDetailsData_anime_episodesBuilder toBuilder() =>
      new GGetAnimeDetailsData_anime_episodesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetAnimeDetailsData_anime_episodes &&
        G__typename == other.G__typename &&
        eid == other.eid &&
        length == other.length &&
        rating == other.rating &&
        votes == other.votes &&
        epno == other.epno &&
        eng == other.eng &&
        romaji == other.romaji &&
        kanji == other.kanji &&
        aired == other.aired &&
        episodeType == other.episodeType &&
        files == other.files;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, G__typename.hashCode),
                                                eid.hashCode),
                                            length.hashCode),
                                        rating.hashCode),
                                    votes.hashCode),
                                epno.hashCode),
                            eng.hashCode),
                        romaji.hashCode),
                    kanji.hashCode),
                aired.hashCode),
            episodeType.hashCode),
        files.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GGetAnimeDetailsData_anime_episodes')
          ..add('G__typename', G__typename)
          ..add('eid', eid)
          ..add('length', length)
          ..add('rating', rating)
          ..add('votes', votes)
          ..add('epno', epno)
          ..add('eng', eng)
          ..add('romaji', romaji)
          ..add('kanji', kanji)
          ..add('aired', aired)
          ..add('episodeType', episodeType)
          ..add('files', files))
        .toString();
  }
}

class GGetAnimeDetailsData_anime_episodesBuilder
    implements
        Builder<GGetAnimeDetailsData_anime_episodes,
            GGetAnimeDetailsData_anime_episodesBuilder> {
  _$GGetAnimeDetailsData_anime_episodes? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _eid;
  int? get eid => _$this._eid;
  set eid(int? eid) => _$this._eid = eid;

  int? _length;
  int? get length => _$this._length;
  set length(int? length) => _$this._length = length;

  int? _rating;
  int? get rating => _$this._rating;
  set rating(int? rating) => _$this._rating = rating;

  int? _votes;
  int? get votes => _$this._votes;
  set votes(int? votes) => _$this._votes = votes;

  String? _epno;
  String? get epno => _$this._epno;
  set epno(String? epno) => _$this._epno = epno;

  String? _eng;
  String? get eng => _$this._eng;
  set eng(String? eng) => _$this._eng = eng;

  String? _romaji;
  String? get romaji => _$this._romaji;
  set romaji(String? romaji) => _$this._romaji = romaji;

  String? _kanji;
  String? get kanji => _$this._kanji;
  set kanji(String? kanji) => _$this._kanji = kanji;

  int? _aired;
  int? get aired => _$this._aired;
  set aired(int? aired) => _$this._aired = aired;

  _i2.GEpisodeType? _episodeType;
  _i2.GEpisodeType? get episodeType => _$this._episodeType;
  set episodeType(_i2.GEpisodeType? episodeType) =>
      _$this._episodeType = episodeType;

  ListBuilder<GGetAnimeDetailsData_anime_episodes_files>? _files;
  ListBuilder<GGetAnimeDetailsData_anime_episodes_files> get files =>
      _$this._files ??=
          new ListBuilder<GGetAnimeDetailsData_anime_episodes_files>();
  set files(ListBuilder<GGetAnimeDetailsData_anime_episodes_files>? files) =>
      _$this._files = files;

  GGetAnimeDetailsData_anime_episodesBuilder() {
    GGetAnimeDetailsData_anime_episodes._initializeBuilder(this);
  }

  GGetAnimeDetailsData_anime_episodesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _eid = $v.eid;
      _length = $v.length;
      _rating = $v.rating;
      _votes = $v.votes;
      _epno = $v.epno;
      _eng = $v.eng;
      _romaji = $v.romaji;
      _kanji = $v.kanji;
      _aired = $v.aired;
      _episodeType = $v.episodeType;
      _files = $v.files.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetAnimeDetailsData_anime_episodes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetAnimeDetailsData_anime_episodes;
  }

  @override
  void update(
      void Function(GGetAnimeDetailsData_anime_episodesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GGetAnimeDetailsData_anime_episodes build() {
    _$GGetAnimeDetailsData_anime_episodes _$result;
    try {
      _$result = _$v ??
          new _$GGetAnimeDetailsData_anime_episodes._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  'GGetAnimeDetailsData_anime_episodes', 'G__typename'),
              eid: BuiltValueNullFieldError.checkNotNull(
                  eid, 'GGetAnimeDetailsData_anime_episodes', 'eid'),
              length: BuiltValueNullFieldError.checkNotNull(
                  length, 'GGetAnimeDetailsData_anime_episodes', 'length'),
              rating: BuiltValueNullFieldError.checkNotNull(
                  rating, 'GGetAnimeDetailsData_anime_episodes', 'rating'),
              votes: BuiltValueNullFieldError.checkNotNull(
                  votes, 'GGetAnimeDetailsData_anime_episodes', 'votes'),
              epno: BuiltValueNullFieldError.checkNotNull(
                  epno, 'GGetAnimeDetailsData_anime_episodes', 'epno'),
              eng: BuiltValueNullFieldError.checkNotNull(
                  eng, 'GGetAnimeDetailsData_anime_episodes', 'eng'),
              romaji: BuiltValueNullFieldError.checkNotNull(romaji, 'GGetAnimeDetailsData_anime_episodes', 'romaji'),
              kanji: BuiltValueNullFieldError.checkNotNull(kanji, 'GGetAnimeDetailsData_anime_episodes', 'kanji'),
              aired: BuiltValueNullFieldError.checkNotNull(aired, 'GGetAnimeDetailsData_anime_episodes', 'aired'),
              episodeType: BuiltValueNullFieldError.checkNotNull(episodeType, 'GGetAnimeDetailsData_anime_episodes', 'episodeType'),
              files: files.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'files';
        files.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GGetAnimeDetailsData_anime_episodes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetAnimeDetailsData_anime_episodes_files
    extends GGetAnimeDetailsData_anime_episodes_files {
  @override
  final String G__typename;
  @override
  final int fid;
  @override
  final int state;
  @override
  final int size;
  @override
  final String quality;
  @override
  final String source;
  @override
  final BuiltList<String> subLanguages;
  @override
  final BuiltList<GGetAnimeDetailsData_anime_episodes_files_videoTracks>
      videoTracks;
  @override
  final BuiltList<GGetAnimeDetailsData_anime_episodes_files_audioTracks>
      audioTracks;
  @override
  final int lengthInSeconds;
  @override
  final String description;
  @override
  final int airedDate;
  @override
  final BuiltList<String> onDisk;
  @override
  final GGetAnimeDetailsData_anime_episodes_files_group? group;

  factory _$GGetAnimeDetailsData_anime_episodes_files(
          [void Function(GGetAnimeDetailsData_anime_episodes_filesBuilder)?
              updates]) =>
      (new GGetAnimeDetailsData_anime_episodes_filesBuilder()..update(updates))
          .build();

  _$GGetAnimeDetailsData_anime_episodes_files._(
      {required this.G__typename,
      required this.fid,
      required this.state,
      required this.size,
      required this.quality,
      required this.source,
      required this.subLanguages,
      required this.videoTracks,
      required this.audioTracks,
      required this.lengthInSeconds,
      required this.description,
      required this.airedDate,
      required this.onDisk,
      this.group})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        'GGetAnimeDetailsData_anime_episodes_files', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        fid, 'GGetAnimeDetailsData_anime_episodes_files', 'fid');
    BuiltValueNullFieldError.checkNotNull(
        state, 'GGetAnimeDetailsData_anime_episodes_files', 'state');
    BuiltValueNullFieldError.checkNotNull(
        size, 'GGetAnimeDetailsData_anime_episodes_files', 'size');
    BuiltValueNullFieldError.checkNotNull(
        quality, 'GGetAnimeDetailsData_anime_episodes_files', 'quality');
    BuiltValueNullFieldError.checkNotNull(
        source, 'GGetAnimeDetailsData_anime_episodes_files', 'source');
    BuiltValueNullFieldError.checkNotNull(subLanguages,
        'GGetAnimeDetailsData_anime_episodes_files', 'subLanguages');
    BuiltValueNullFieldError.checkNotNull(videoTracks,
        'GGetAnimeDetailsData_anime_episodes_files', 'videoTracks');
    BuiltValueNullFieldError.checkNotNull(audioTracks,
        'GGetAnimeDetailsData_anime_episodes_files', 'audioTracks');
    BuiltValueNullFieldError.checkNotNull(lengthInSeconds,
        'GGetAnimeDetailsData_anime_episodes_files', 'lengthInSeconds');
    BuiltValueNullFieldError.checkNotNull(description,
        'GGetAnimeDetailsData_anime_episodes_files', 'description');
    BuiltValueNullFieldError.checkNotNull(
        airedDate, 'GGetAnimeDetailsData_anime_episodes_files', 'airedDate');
    BuiltValueNullFieldError.checkNotNull(
        onDisk, 'GGetAnimeDetailsData_anime_episodes_files', 'onDisk');
  }

  @override
  GGetAnimeDetailsData_anime_episodes_files rebuild(
          void Function(GGetAnimeDetailsData_anime_episodes_filesBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetAnimeDetailsData_anime_episodes_filesBuilder toBuilder() =>
      new GGetAnimeDetailsData_anime_episodes_filesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetAnimeDetailsData_anime_episodes_files &&
        G__typename == other.G__typename &&
        fid == other.fid &&
        state == other.state &&
        size == other.size &&
        quality == other.quality &&
        source == other.source &&
        subLanguages == other.subLanguages &&
        videoTracks == other.videoTracks &&
        audioTracks == other.audioTracks &&
        lengthInSeconds == other.lengthInSeconds &&
        description == other.description &&
        airedDate == other.airedDate &&
        onDisk == other.onDisk &&
        group == other.group;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            0,
                                                            G__typename
                                                                .hashCode),
                                                        fid.hashCode),
                                                    state.hashCode),
                                                size.hashCode),
                                            quality.hashCode),
                                        source.hashCode),
                                    subLanguages.hashCode),
                                videoTracks.hashCode),
                            audioTracks.hashCode),
                        lengthInSeconds.hashCode),
                    description.hashCode),
                airedDate.hashCode),
            onDisk.hashCode),
        group.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GGetAnimeDetailsData_anime_episodes_files')
          ..add('G__typename', G__typename)
          ..add('fid', fid)
          ..add('state', state)
          ..add('size', size)
          ..add('quality', quality)
          ..add('source', source)
          ..add('subLanguages', subLanguages)
          ..add('videoTracks', videoTracks)
          ..add('audioTracks', audioTracks)
          ..add('lengthInSeconds', lengthInSeconds)
          ..add('description', description)
          ..add('airedDate', airedDate)
          ..add('onDisk', onDisk)
          ..add('group', group))
        .toString();
  }
}

class GGetAnimeDetailsData_anime_episodes_filesBuilder
    implements
        Builder<GGetAnimeDetailsData_anime_episodes_files,
            GGetAnimeDetailsData_anime_episodes_filesBuilder> {
  _$GGetAnimeDetailsData_anime_episodes_files? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _fid;
  int? get fid => _$this._fid;
  set fid(int? fid) => _$this._fid = fid;

  int? _state;
  int? get state => _$this._state;
  set state(int? state) => _$this._state = state;

  int? _size;
  int? get size => _$this._size;
  set size(int? size) => _$this._size = size;

  String? _quality;
  String? get quality => _$this._quality;
  set quality(String? quality) => _$this._quality = quality;

  String? _source;
  String? get source => _$this._source;
  set source(String? source) => _$this._source = source;

  ListBuilder<String>? _subLanguages;
  ListBuilder<String> get subLanguages =>
      _$this._subLanguages ??= new ListBuilder<String>();
  set subLanguages(ListBuilder<String>? subLanguages) =>
      _$this._subLanguages = subLanguages;

  ListBuilder<GGetAnimeDetailsData_anime_episodes_files_videoTracks>?
      _videoTracks;
  ListBuilder<GGetAnimeDetailsData_anime_episodes_files_videoTracks>
      get videoTracks => _$this._videoTracks ??= new ListBuilder<
          GGetAnimeDetailsData_anime_episodes_files_videoTracks>();
  set videoTracks(
          ListBuilder<GGetAnimeDetailsData_anime_episodes_files_videoTracks>?
              videoTracks) =>
      _$this._videoTracks = videoTracks;

  ListBuilder<GGetAnimeDetailsData_anime_episodes_files_audioTracks>?
      _audioTracks;
  ListBuilder<GGetAnimeDetailsData_anime_episodes_files_audioTracks>
      get audioTracks => _$this._audioTracks ??= new ListBuilder<
          GGetAnimeDetailsData_anime_episodes_files_audioTracks>();
  set audioTracks(
          ListBuilder<GGetAnimeDetailsData_anime_episodes_files_audioTracks>?
              audioTracks) =>
      _$this._audioTracks = audioTracks;

  int? _lengthInSeconds;
  int? get lengthInSeconds => _$this._lengthInSeconds;
  set lengthInSeconds(int? lengthInSeconds) =>
      _$this._lengthInSeconds = lengthInSeconds;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  int? _airedDate;
  int? get airedDate => _$this._airedDate;
  set airedDate(int? airedDate) => _$this._airedDate = airedDate;

  ListBuilder<String>? _onDisk;
  ListBuilder<String> get onDisk =>
      _$this._onDisk ??= new ListBuilder<String>();
  set onDisk(ListBuilder<String>? onDisk) => _$this._onDisk = onDisk;

  GGetAnimeDetailsData_anime_episodes_files_groupBuilder? _group;
  GGetAnimeDetailsData_anime_episodes_files_groupBuilder get group =>
      _$this._group ??=
          new GGetAnimeDetailsData_anime_episodes_files_groupBuilder();
  set group(GGetAnimeDetailsData_anime_episodes_files_groupBuilder? group) =>
      _$this._group = group;

  GGetAnimeDetailsData_anime_episodes_filesBuilder() {
    GGetAnimeDetailsData_anime_episodes_files._initializeBuilder(this);
  }

  GGetAnimeDetailsData_anime_episodes_filesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _fid = $v.fid;
      _state = $v.state;
      _size = $v.size;
      _quality = $v.quality;
      _source = $v.source;
      _subLanguages = $v.subLanguages.toBuilder();
      _videoTracks = $v.videoTracks.toBuilder();
      _audioTracks = $v.audioTracks.toBuilder();
      _lengthInSeconds = $v.lengthInSeconds;
      _description = $v.description;
      _airedDate = $v.airedDate;
      _onDisk = $v.onDisk.toBuilder();
      _group = $v.group?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetAnimeDetailsData_anime_episodes_files other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetAnimeDetailsData_anime_episodes_files;
  }

  @override
  void update(
      void Function(GGetAnimeDetailsData_anime_episodes_filesBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GGetAnimeDetailsData_anime_episodes_files build() {
    _$GGetAnimeDetailsData_anime_episodes_files _$result;
    try {
      _$result = _$v ??
          new _$GGetAnimeDetailsData_anime_episodes_files._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, 'GGetAnimeDetailsData_anime_episodes_files', 'G__typename'),
              fid: BuiltValueNullFieldError.checkNotNull(
                  fid, 'GGetAnimeDetailsData_anime_episodes_files', 'fid'),
              state: BuiltValueNullFieldError.checkNotNull(
                  state, 'GGetAnimeDetailsData_anime_episodes_files', 'state'),
              size: BuiltValueNullFieldError.checkNotNull(
                  size, 'GGetAnimeDetailsData_anime_episodes_files', 'size'),
              quality: BuiltValueNullFieldError.checkNotNull(
                  quality, 'GGetAnimeDetailsData_anime_episodes_files', 'quality'),
              source: BuiltValueNullFieldError.checkNotNull(
                  source, 'GGetAnimeDetailsData_anime_episodes_files', 'source'),
              subLanguages: subLanguages.build(),
              videoTracks: videoTracks.build(),
              audioTracks: audioTracks.build(),
              lengthInSeconds: BuiltValueNullFieldError.checkNotNull(
                  lengthInSeconds, 'GGetAnimeDetailsData_anime_episodes_files', 'lengthInSeconds'),
              description: BuiltValueNullFieldError.checkNotNull(description, 'GGetAnimeDetailsData_anime_episodes_files', 'description'),
              airedDate: BuiltValueNullFieldError.checkNotNull(airedDate, 'GGetAnimeDetailsData_anime_episodes_files', 'airedDate'),
              onDisk: onDisk.build(),
              group: _group?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'subLanguages';
        subLanguages.build();
        _$failedField = 'videoTracks';
        videoTracks.build();
        _$failedField = 'audioTracks';
        audioTracks.build();

        _$failedField = 'onDisk';
        onDisk.build();
        _$failedField = 'group';
        _group?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GGetAnimeDetailsData_anime_episodes_files',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetAnimeDetailsData_anime_episodes_files_videoTracks
    extends GGetAnimeDetailsData_anime_episodes_files_videoTracks {
  @override
  final String G__typename;
  @override
  final String? colourDepth;
  @override
  final String codec;
  @override
  final String bitrate;

  factory _$GGetAnimeDetailsData_anime_episodes_files_videoTracks(
          [void Function(
                  GGetAnimeDetailsData_anime_episodes_files_videoTracksBuilder)?
              updates]) =>
      (new GGetAnimeDetailsData_anime_episodes_files_videoTracksBuilder()
            ..update(updates))
          .build();

  _$GGetAnimeDetailsData_anime_episodes_files_videoTracks._(
      {required this.G__typename,
      this.colourDepth,
      required this.codec,
      required this.bitrate})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        'GGetAnimeDetailsData_anime_episodes_files_videoTracks', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(codec,
        'GGetAnimeDetailsData_anime_episodes_files_videoTracks', 'codec');
    BuiltValueNullFieldError.checkNotNull(bitrate,
        'GGetAnimeDetailsData_anime_episodes_files_videoTracks', 'bitrate');
  }

  @override
  GGetAnimeDetailsData_anime_episodes_files_videoTracks rebuild(
          void Function(
                  GGetAnimeDetailsData_anime_episodes_files_videoTracksBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetAnimeDetailsData_anime_episodes_files_videoTracksBuilder toBuilder() =>
      new GGetAnimeDetailsData_anime_episodes_files_videoTracksBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetAnimeDetailsData_anime_episodes_files_videoTracks &&
        G__typename == other.G__typename &&
        colourDepth == other.colourDepth &&
        codec == other.codec &&
        bitrate == other.bitrate;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, G__typename.hashCode), colourDepth.hashCode),
            codec.hashCode),
        bitrate.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GGetAnimeDetailsData_anime_episodes_files_videoTracks')
          ..add('G__typename', G__typename)
          ..add('colourDepth', colourDepth)
          ..add('codec', codec)
          ..add('bitrate', bitrate))
        .toString();
  }
}

class GGetAnimeDetailsData_anime_episodes_files_videoTracksBuilder
    implements
        Builder<GGetAnimeDetailsData_anime_episodes_files_videoTracks,
            GGetAnimeDetailsData_anime_episodes_files_videoTracksBuilder> {
  _$GGetAnimeDetailsData_anime_episodes_files_videoTracks? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _colourDepth;
  String? get colourDepth => _$this._colourDepth;
  set colourDepth(String? colourDepth) => _$this._colourDepth = colourDepth;

  String? _codec;
  String? get codec => _$this._codec;
  set codec(String? codec) => _$this._codec = codec;

  String? _bitrate;
  String? get bitrate => _$this._bitrate;
  set bitrate(String? bitrate) => _$this._bitrate = bitrate;

  GGetAnimeDetailsData_anime_episodes_files_videoTracksBuilder() {
    GGetAnimeDetailsData_anime_episodes_files_videoTracks._initializeBuilder(
        this);
  }

  GGetAnimeDetailsData_anime_episodes_files_videoTracksBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _colourDepth = $v.colourDepth;
      _codec = $v.codec;
      _bitrate = $v.bitrate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetAnimeDetailsData_anime_episodes_files_videoTracks other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetAnimeDetailsData_anime_episodes_files_videoTracks;
  }

  @override
  void update(
      void Function(
              GGetAnimeDetailsData_anime_episodes_files_videoTracksBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GGetAnimeDetailsData_anime_episodes_files_videoTracks build() {
    final _$result = _$v ??
        new _$GGetAnimeDetailsData_anime_episodes_files_videoTracks._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                'GGetAnimeDetailsData_anime_episodes_files_videoTracks',
                'G__typename'),
            colourDepth: colourDepth,
            codec: BuiltValueNullFieldError.checkNotNull(
                codec,
                'GGetAnimeDetailsData_anime_episodes_files_videoTracks',
                'codec'),
            bitrate: BuiltValueNullFieldError.checkNotNull(
                bitrate,
                'GGetAnimeDetailsData_anime_episodes_files_videoTracks',
                'bitrate'));
    replace(_$result);
    return _$result;
  }
}

class _$GGetAnimeDetailsData_anime_episodes_files_audioTracks
    extends GGetAnimeDetailsData_anime_episodes_files_audioTracks {
  @override
  final String G__typename;
  @override
  final String codec;
  @override
  final String bitrate;
  @override
  final String language;

  factory _$GGetAnimeDetailsData_anime_episodes_files_audioTracks(
          [void Function(
                  GGetAnimeDetailsData_anime_episodes_files_audioTracksBuilder)?
              updates]) =>
      (new GGetAnimeDetailsData_anime_episodes_files_audioTracksBuilder()
            ..update(updates))
          .build();

  _$GGetAnimeDetailsData_anime_episodes_files_audioTracks._(
      {required this.G__typename,
      required this.codec,
      required this.bitrate,
      required this.language})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        'GGetAnimeDetailsData_anime_episodes_files_audioTracks', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(codec,
        'GGetAnimeDetailsData_anime_episodes_files_audioTracks', 'codec');
    BuiltValueNullFieldError.checkNotNull(bitrate,
        'GGetAnimeDetailsData_anime_episodes_files_audioTracks', 'bitrate');
    BuiltValueNullFieldError.checkNotNull(language,
        'GGetAnimeDetailsData_anime_episodes_files_audioTracks', 'language');
  }

  @override
  GGetAnimeDetailsData_anime_episodes_files_audioTracks rebuild(
          void Function(
                  GGetAnimeDetailsData_anime_episodes_files_audioTracksBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetAnimeDetailsData_anime_episodes_files_audioTracksBuilder toBuilder() =>
      new GGetAnimeDetailsData_anime_episodes_files_audioTracksBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetAnimeDetailsData_anime_episodes_files_audioTracks &&
        G__typename == other.G__typename &&
        codec == other.codec &&
        bitrate == other.bitrate &&
        language == other.language;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, G__typename.hashCode), codec.hashCode),
            bitrate.hashCode),
        language.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GGetAnimeDetailsData_anime_episodes_files_audioTracks')
          ..add('G__typename', G__typename)
          ..add('codec', codec)
          ..add('bitrate', bitrate)
          ..add('language', language))
        .toString();
  }
}

class GGetAnimeDetailsData_anime_episodes_files_audioTracksBuilder
    implements
        Builder<GGetAnimeDetailsData_anime_episodes_files_audioTracks,
            GGetAnimeDetailsData_anime_episodes_files_audioTracksBuilder> {
  _$GGetAnimeDetailsData_anime_episodes_files_audioTracks? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _codec;
  String? get codec => _$this._codec;
  set codec(String? codec) => _$this._codec = codec;

  String? _bitrate;
  String? get bitrate => _$this._bitrate;
  set bitrate(String? bitrate) => _$this._bitrate = bitrate;

  String? _language;
  String? get language => _$this._language;
  set language(String? language) => _$this._language = language;

  GGetAnimeDetailsData_anime_episodes_files_audioTracksBuilder() {
    GGetAnimeDetailsData_anime_episodes_files_audioTracks._initializeBuilder(
        this);
  }

  GGetAnimeDetailsData_anime_episodes_files_audioTracksBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _codec = $v.codec;
      _bitrate = $v.bitrate;
      _language = $v.language;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetAnimeDetailsData_anime_episodes_files_audioTracks other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetAnimeDetailsData_anime_episodes_files_audioTracks;
  }

  @override
  void update(
      void Function(
              GGetAnimeDetailsData_anime_episodes_files_audioTracksBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GGetAnimeDetailsData_anime_episodes_files_audioTracks build() {
    final _$result = _$v ??
        new _$GGetAnimeDetailsData_anime_episodes_files_audioTracks._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                'GGetAnimeDetailsData_anime_episodes_files_audioTracks',
                'G__typename'),
            codec: BuiltValueNullFieldError.checkNotNull(
                codec,
                'GGetAnimeDetailsData_anime_episodes_files_audioTracks',
                'codec'),
            bitrate: BuiltValueNullFieldError.checkNotNull(
                bitrate,
                'GGetAnimeDetailsData_anime_episodes_files_audioTracks',
                'bitrate'),
            language: BuiltValueNullFieldError.checkNotNull(
                language,
                'GGetAnimeDetailsData_anime_episodes_files_audioTracks',
                'language'));
    replace(_$result);
    return _$result;
  }
}

class _$GGetAnimeDetailsData_anime_episodes_files_group
    extends GGetAnimeDetailsData_anime_episodes_files_group {
  @override
  final String G__typename;
  @override
  final int gid;
  @override
  final int rating;
  @override
  final int votes;
  @override
  final int acount;
  @override
  final int fcount;
  @override
  final String name;
  @override
  final String short;
  @override
  final String ircChannel;
  @override
  final String ircServer;
  @override
  final String url;
  @override
  final String picname;
  @override
  final int foundeddate;
  @override
  final int disbandeddate;
  @override
  final int dateflags;
  @override
  final int lastreleasedate;
  @override
  final int lastactivitydate;
  @override
  final String grouprelations;

  factory _$GGetAnimeDetailsData_anime_episodes_files_group(
          [void Function(
                  GGetAnimeDetailsData_anime_episodes_files_groupBuilder)?
              updates]) =>
      (new GGetAnimeDetailsData_anime_episodes_files_groupBuilder()
            ..update(updates))
          .build();

  _$GGetAnimeDetailsData_anime_episodes_files_group._(
      {required this.G__typename,
      required this.gid,
      required this.rating,
      required this.votes,
      required this.acount,
      required this.fcount,
      required this.name,
      required this.short,
      required this.ircChannel,
      required this.ircServer,
      required this.url,
      required this.picname,
      required this.foundeddate,
      required this.disbandeddate,
      required this.dateflags,
      required this.lastreleasedate,
      required this.lastactivitydate,
      required this.grouprelations})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        'GGetAnimeDetailsData_anime_episodes_files_group', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        gid, 'GGetAnimeDetailsData_anime_episodes_files_group', 'gid');
    BuiltValueNullFieldError.checkNotNull(
        rating, 'GGetAnimeDetailsData_anime_episodes_files_group', 'rating');
    BuiltValueNullFieldError.checkNotNull(
        votes, 'GGetAnimeDetailsData_anime_episodes_files_group', 'votes');
    BuiltValueNullFieldError.checkNotNull(
        acount, 'GGetAnimeDetailsData_anime_episodes_files_group', 'acount');
    BuiltValueNullFieldError.checkNotNull(
        fcount, 'GGetAnimeDetailsData_anime_episodes_files_group', 'fcount');
    BuiltValueNullFieldError.checkNotNull(
        name, 'GGetAnimeDetailsData_anime_episodes_files_group', 'name');
    BuiltValueNullFieldError.checkNotNull(
        short, 'GGetAnimeDetailsData_anime_episodes_files_group', 'short');
    BuiltValueNullFieldError.checkNotNull(ircChannel,
        'GGetAnimeDetailsData_anime_episodes_files_group', 'ircChannel');
    BuiltValueNullFieldError.checkNotNull(ircServer,
        'GGetAnimeDetailsData_anime_episodes_files_group', 'ircServer');
    BuiltValueNullFieldError.checkNotNull(
        url, 'GGetAnimeDetailsData_anime_episodes_files_group', 'url');
    BuiltValueNullFieldError.checkNotNull(
        picname, 'GGetAnimeDetailsData_anime_episodes_files_group', 'picname');
    BuiltValueNullFieldError.checkNotNull(foundeddate,
        'GGetAnimeDetailsData_anime_episodes_files_group', 'foundeddate');
    BuiltValueNullFieldError.checkNotNull(disbandeddate,
        'GGetAnimeDetailsData_anime_episodes_files_group', 'disbandeddate');
    BuiltValueNullFieldError.checkNotNull(dateflags,
        'GGetAnimeDetailsData_anime_episodes_files_group', 'dateflags');
    BuiltValueNullFieldError.checkNotNull(lastreleasedate,
        'GGetAnimeDetailsData_anime_episodes_files_group', 'lastreleasedate');
    BuiltValueNullFieldError.checkNotNull(lastactivitydate,
        'GGetAnimeDetailsData_anime_episodes_files_group', 'lastactivitydate');
    BuiltValueNullFieldError.checkNotNull(grouprelations,
        'GGetAnimeDetailsData_anime_episodes_files_group', 'grouprelations');
  }

  @override
  GGetAnimeDetailsData_anime_episodes_files_group rebuild(
          void Function(GGetAnimeDetailsData_anime_episodes_files_groupBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetAnimeDetailsData_anime_episodes_files_groupBuilder toBuilder() =>
      new GGetAnimeDetailsData_anime_episodes_files_groupBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetAnimeDetailsData_anime_episodes_files_group &&
        G__typename == other.G__typename &&
        gid == other.gid &&
        rating == other.rating &&
        votes == other.votes &&
        acount == other.acount &&
        fcount == other.fcount &&
        name == other.name &&
        short == other.short &&
        ircChannel == other.ircChannel &&
        ircServer == other.ircServer &&
        url == other.url &&
        picname == other.picname &&
        foundeddate == other.foundeddate &&
        disbandeddate == other.disbandeddate &&
        dateflags == other.dateflags &&
        lastreleasedate == other.lastreleasedate &&
        lastactivitydate == other.lastactivitydate &&
        grouprelations == other.grouprelations;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            0,
                                                                            G__typename
                                                                                .hashCode),
                                                                        gid
                                                                            .hashCode),
                                                                    rating
                                                                        .hashCode),
                                                                votes.hashCode),
                                                            acount.hashCode),
                                                        fcount.hashCode),
                                                    name.hashCode),
                                                short.hashCode),
                                            ircChannel.hashCode),
                                        ircServer.hashCode),
                                    url.hashCode),
                                picname.hashCode),
                            foundeddate.hashCode),
                        disbandeddate.hashCode),
                    dateflags.hashCode),
                lastreleasedate.hashCode),
            lastactivitydate.hashCode),
        grouprelations.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GGetAnimeDetailsData_anime_episodes_files_group')
          ..add('G__typename', G__typename)
          ..add('gid', gid)
          ..add('rating', rating)
          ..add('votes', votes)
          ..add('acount', acount)
          ..add('fcount', fcount)
          ..add('name', name)
          ..add('short', short)
          ..add('ircChannel', ircChannel)
          ..add('ircServer', ircServer)
          ..add('url', url)
          ..add('picname', picname)
          ..add('foundeddate', foundeddate)
          ..add('disbandeddate', disbandeddate)
          ..add('dateflags', dateflags)
          ..add('lastreleasedate', lastreleasedate)
          ..add('lastactivitydate', lastactivitydate)
          ..add('grouprelations', grouprelations))
        .toString();
  }
}

class GGetAnimeDetailsData_anime_episodes_files_groupBuilder
    implements
        Builder<GGetAnimeDetailsData_anime_episodes_files_group,
            GGetAnimeDetailsData_anime_episodes_files_groupBuilder> {
  _$GGetAnimeDetailsData_anime_episodes_files_group? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _gid;
  int? get gid => _$this._gid;
  set gid(int? gid) => _$this._gid = gid;

  int? _rating;
  int? get rating => _$this._rating;
  set rating(int? rating) => _$this._rating = rating;

  int? _votes;
  int? get votes => _$this._votes;
  set votes(int? votes) => _$this._votes = votes;

  int? _acount;
  int? get acount => _$this._acount;
  set acount(int? acount) => _$this._acount = acount;

  int? _fcount;
  int? get fcount => _$this._fcount;
  set fcount(int? fcount) => _$this._fcount = fcount;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _short;
  String? get short => _$this._short;
  set short(String? short) => _$this._short = short;

  String? _ircChannel;
  String? get ircChannel => _$this._ircChannel;
  set ircChannel(String? ircChannel) => _$this._ircChannel = ircChannel;

  String? _ircServer;
  String? get ircServer => _$this._ircServer;
  set ircServer(String? ircServer) => _$this._ircServer = ircServer;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  String? _picname;
  String? get picname => _$this._picname;
  set picname(String? picname) => _$this._picname = picname;

  int? _foundeddate;
  int? get foundeddate => _$this._foundeddate;
  set foundeddate(int? foundeddate) => _$this._foundeddate = foundeddate;

  int? _disbandeddate;
  int? get disbandeddate => _$this._disbandeddate;
  set disbandeddate(int? disbandeddate) =>
      _$this._disbandeddate = disbandeddate;

  int? _dateflags;
  int? get dateflags => _$this._dateflags;
  set dateflags(int? dateflags) => _$this._dateflags = dateflags;

  int? _lastreleasedate;
  int? get lastreleasedate => _$this._lastreleasedate;
  set lastreleasedate(int? lastreleasedate) =>
      _$this._lastreleasedate = lastreleasedate;

  int? _lastactivitydate;
  int? get lastactivitydate => _$this._lastactivitydate;
  set lastactivitydate(int? lastactivitydate) =>
      _$this._lastactivitydate = lastactivitydate;

  String? _grouprelations;
  String? get grouprelations => _$this._grouprelations;
  set grouprelations(String? grouprelations) =>
      _$this._grouprelations = grouprelations;

  GGetAnimeDetailsData_anime_episodes_files_groupBuilder() {
    GGetAnimeDetailsData_anime_episodes_files_group._initializeBuilder(this);
  }

  GGetAnimeDetailsData_anime_episodes_files_groupBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _gid = $v.gid;
      _rating = $v.rating;
      _votes = $v.votes;
      _acount = $v.acount;
      _fcount = $v.fcount;
      _name = $v.name;
      _short = $v.short;
      _ircChannel = $v.ircChannel;
      _ircServer = $v.ircServer;
      _url = $v.url;
      _picname = $v.picname;
      _foundeddate = $v.foundeddate;
      _disbandeddate = $v.disbandeddate;
      _dateflags = $v.dateflags;
      _lastreleasedate = $v.lastreleasedate;
      _lastactivitydate = $v.lastactivitydate;
      _grouprelations = $v.grouprelations;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetAnimeDetailsData_anime_episodes_files_group other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetAnimeDetailsData_anime_episodes_files_group;
  }

  @override
  void update(
      void Function(GGetAnimeDetailsData_anime_episodes_files_groupBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GGetAnimeDetailsData_anime_episodes_files_group build() {
    final _$result = _$v ??
        new _$GGetAnimeDetailsData_anime_episodes_files_group._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, 'GGetAnimeDetailsData_anime_episodes_files_group', 'G__typename'),
            gid: BuiltValueNullFieldError.checkNotNull(
                gid, 'GGetAnimeDetailsData_anime_episodes_files_group', 'gid'),
            rating: BuiltValueNullFieldError.checkNotNull(
                rating, 'GGetAnimeDetailsData_anime_episodes_files_group', 'rating'),
            votes: BuiltValueNullFieldError.checkNotNull(
                votes, 'GGetAnimeDetailsData_anime_episodes_files_group', 'votes'),
            acount: BuiltValueNullFieldError.checkNotNull(
                acount, 'GGetAnimeDetailsData_anime_episodes_files_group', 'acount'),
            fcount: BuiltValueNullFieldError.checkNotNull(
                fcount, 'GGetAnimeDetailsData_anime_episodes_files_group', 'fcount'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, 'GGetAnimeDetailsData_anime_episodes_files_group', 'name'),
            short: BuiltValueNullFieldError.checkNotNull(short, 'GGetAnimeDetailsData_anime_episodes_files_group', 'short'),
            ircChannel: BuiltValueNullFieldError.checkNotNull(ircChannel, 'GGetAnimeDetailsData_anime_episodes_files_group', 'ircChannel'),
            ircServer: BuiltValueNullFieldError.checkNotNull(ircServer, 'GGetAnimeDetailsData_anime_episodes_files_group', 'ircServer'),
            url: BuiltValueNullFieldError.checkNotNull(url, 'GGetAnimeDetailsData_anime_episodes_files_group', 'url'),
            picname: BuiltValueNullFieldError.checkNotNull(picname, 'GGetAnimeDetailsData_anime_episodes_files_group', 'picname'),
            foundeddate: BuiltValueNullFieldError.checkNotNull(foundeddate, 'GGetAnimeDetailsData_anime_episodes_files_group', 'foundeddate'),
            disbandeddate: BuiltValueNullFieldError.checkNotNull(disbandeddate, 'GGetAnimeDetailsData_anime_episodes_files_group', 'disbandeddate'),
            dateflags: BuiltValueNullFieldError.checkNotNull(dateflags, 'GGetAnimeDetailsData_anime_episodes_files_group', 'dateflags'),
            lastreleasedate: BuiltValueNullFieldError.checkNotNull(lastreleasedate, 'GGetAnimeDetailsData_anime_episodes_files_group', 'lastreleasedate'),
            lastactivitydate: BuiltValueNullFieldError.checkNotNull(lastactivitydate, 'GGetAnimeDetailsData_anime_episodes_files_group', 'lastactivitydate'),
            grouprelations: BuiltValueNullFieldError.checkNotNull(grouprelations, 'GGetAnimeDetailsData_anime_episodes_files_group', 'grouprelations'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
