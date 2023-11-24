class YoutubeVideoListResponse {
  String kind;
  String etag;
  List<YoutubeVideoItem> items;
  String nextPageToken;
  YoutubeVideoPageInfo pageInfo;

  YoutubeVideoListResponse({
    required this.kind,
    required this.etag,
    required this.items,
    required this.nextPageToken,
    required this.pageInfo,
  });

  factory YoutubeVideoListResponse.fromJson(Map<String, dynamic> json) {
    return YoutubeVideoListResponse(
      kind: json['kind'] ?? '',
      etag: json['etag'] ?? '',
      items: (json['items'] as List<dynamic>?)
              ?.map((item) => YoutubeVideoItem.fromJson(item))
              .toList() ??
          [],
      nextPageToken: json['nextPageToken'] ?? '',
      pageInfo: YoutubeVideoPageInfo.fromJson(json['pageInfo'] ?? {}),
    );
  }
}

class YoutubeVideoItem {
  String kind;
  String etag;
  String id;
  YoutubeVideoSnippet snippet;

  YoutubeVideoItem({
    required this.kind,
    required this.etag,
    required this.id,
    required this.snippet,
  });

  factory YoutubeVideoItem.fromJson(Map<String, dynamic> json) {
    return YoutubeVideoItem(
      kind: json['kind'] ?? '',
      etag: json['etag'] ?? '',
      id: json['id'] ?? '',
      snippet: YoutubeVideoSnippet.fromJson(json['snippet'] ?? {}),
    );
  }
}

class YoutubeVideoSnippet {
  String publishedAt;
  String channelId;
  String title;
  String description;
  YoutubeVideoThumbnails thumbnails;
  String channelTitle;
  List<String> tags;
  String categoryId;
  String liveBroadcastContent;
  YoutubeVideoLocalized localized;
  String defaultAudioLanguage;

  YoutubeVideoSnippet({
    required this.publishedAt,
    required this.channelId,
    required this.title,
    required this.description,
    required this.thumbnails,
    required this.channelTitle,
    required this.tags,
    required this.categoryId,
    required this.liveBroadcastContent,
    required this.localized,
    required this.defaultAudioLanguage,
  });

  factory YoutubeVideoSnippet.fromJson(Map<String, dynamic> json) {
    return YoutubeVideoSnippet(
      publishedAt: json['publishedAt'] ?? '',
      channelId: json['channelId'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      thumbnails: YoutubeVideoThumbnails.fromJson(json['thumbnails'] ?? {}),
      channelTitle: json['channelTitle'] ?? '',
      tags: (json['tags'] as List<dynamic>?)
              ?.map((tag) => tag.toString())
              .toList() ??
          [],
      categoryId: json['categoryId'] ?? '',
      liveBroadcastContent: json['liveBroadcastContent'] ?? '',
      localized: YoutubeVideoLocalized.fromJson(json['localized'] ?? {}),
      defaultAudioLanguage: json['defaultAudioLanguage'] ?? '',
    );
  }
}

class YoutubeVideoThumbnails {
  YoutubeVideoThumbnail defaultThumbnail;
  YoutubeVideoThumbnail mediumThumbnail;
  YoutubeVideoThumbnail highThumbnail;
  YoutubeVideoThumbnail standardThumbnail;
  YoutubeVideoThumbnail maxresThumbnail;

  YoutubeVideoThumbnails({
    required this.defaultThumbnail,
    required this.mediumThumbnail,
    required this.highThumbnail,
    required this.standardThumbnail,
    required this.maxresThumbnail,
  });

  factory YoutubeVideoThumbnails.fromJson(Map<String, dynamic> json) {
    return YoutubeVideoThumbnails(
      defaultThumbnail: YoutubeVideoThumbnail.fromJson(json['default'] ?? {}),
      mediumThumbnail: YoutubeVideoThumbnail.fromJson(json['medium'] ?? {}),
      highThumbnail: YoutubeVideoThumbnail.fromJson(json['high'] ?? {}),
      standardThumbnail: YoutubeVideoThumbnail.fromJson(json['standard'] ?? {}),
      maxresThumbnail: YoutubeVideoThumbnail.fromJson(json['maxres'] ?? {}),
    );
  }
}

class YoutubeVideoThumbnail {
  String url;
  int width;
  int height;

  YoutubeVideoThumbnail({
    required this.url,
    required this.width,
    required this.height,
  });

  factory YoutubeVideoThumbnail.fromJson(Map<String, dynamic> json) {
    return YoutubeVideoThumbnail(
      url: json['url'] ?? '',
      width: json['width'] ?? 0,
      height: json['height'] ?? 0,
    );
  }
}

class YoutubeVideoLocalized {
  String title;
  String description;

  YoutubeVideoLocalized({
    required this.title,
    required this.description,
  });

  factory YoutubeVideoLocalized.fromJson(Map<String, dynamic> json) {
    return YoutubeVideoLocalized(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
    );
  }
}

class YoutubeVideoPageInfo {
  int totalResults;
  int resultsPerPage;

  YoutubeVideoPageInfo({
    required this.totalResults,
    required this.resultsPerPage,
  });

  factory YoutubeVideoPageInfo.fromJson(Map<String, dynamic> json) {
    return YoutubeVideoPageInfo(
      totalResults: json['totalResults'] ?? 0,
      resultsPerPage: json['resultsPerPage'] ?? 0,
    );
  }
}
