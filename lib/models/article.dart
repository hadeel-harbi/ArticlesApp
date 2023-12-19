class Article {
  String? url;
  String? publishedDate;
  String? byline;
  String? title;
  List<Media>? media;

  Article({
    this.url,
    this.publishedDate,
    this.byline,
    this.title,
    this.media,
  });

  Article.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    publishedDate = json['published_date'];
    byline = json['byline'];
    title = json['title'];
    if (json['media'] != null && json['media'].isNotEmpty) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(Media.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['url'] = url;
    data['published_date'] = publishedDate;
    data['byline'] = byline;
    data['title'] = title;
    if (media != null) {
      data['media'] = media!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Media {
  List<MediaMetadata>? mediaMetadata;

  Media({this.mediaMetadata});

  Media.fromJson(Map<String, dynamic> json) {
    if (json['media-metadata'] != null) {
      mediaMetadata = <MediaMetadata>[];
      json['media-metadata'].forEach((v) {
        mediaMetadata!.add(MediaMetadata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (mediaMetadata != null) {
      data['media-metadata'] = mediaMetadata!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class MediaMetadata {
  String? url;
  int? height;
  int? width;

  MediaMetadata({this.url, this.height, this.width});

  MediaMetadata.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    height = json['height'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['height'] = height;
    data['width'] = width;
    return data;
  }
}
