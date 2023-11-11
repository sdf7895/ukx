abstract class ContentDisplay {
  display();
}

class ContentModel {
  String userThumbnail;
  String content;
  String contentType;

  ContentModel({
    required this.userThumbnail,
    required this.content,
    required this.contentType,
  });
}

class Contents {
  ContentDisplay content;
  Contents({
    required this.content,
  });

  display() {
    content.display();
  }
}

class HomeContent {
  late String thumbnail;
  late List<ContentModel> _homeContent;
  List<ContentModel> get homeContent => _homeContent;
  HomeContent() {
    thumbnail = 'https://source.unsplash.com/random/300×300';
    _homeContent = [
      ContentModel(
          userThumbnail: thumbnail, content: 'content1', contentType: 'image'),
      ContentModel(
          userThumbnail: thumbnail, content: 'content2', contentType: 'image'),
      ContentModel(
          userThumbnail: thumbnail, content: 'content3', contentType: 'gif'),
      ContentModel(
          userThumbnail: thumbnail, content: 'content4', contentType: 'text'),
      ContentModel(
          userThumbnail: thumbnail, content: 'content5', contentType: 'gif'),
      ContentModel(
          userThumbnail: thumbnail, content: 'content6', contentType: 'vedio'),
      ContentModel(
          userThumbnail: thumbnail, content: 'content7', contentType: 'text'),
      ContentModel(
          userThumbnail: thumbnail, content: 'content8', contentType: 'vedio'),
      ContentModel(
          userThumbnail: thumbnail, content: 'content9', contentType: 'gif'),
      ContentModel(
          userThumbnail: thumbnail, content: 'content10', contentType: 'gif'),
      ContentModel(
          userThumbnail: thumbnail, content: 'content11', contentType: 'image'),
      ContentModel(
          userThumbnail: thumbnail, content: 'content12', contentType: 'image'),
      ContentModel(
          userThumbnail: thumbnail, content: 'content13', contentType: 'text'),
      ContentModel(
          userThumbnail: thumbnail, content: 'content14', contentType: 'gif'),
      ContentModel(
          userThumbnail: thumbnail, content: 'content15', contentType: 'image'),
      ContentModel(
          userThumbnail: thumbnail, content: 'content16', contentType: 'text'),
      ContentModel(
          userThumbnail: thumbnail, content: 'content17', contentType: 'image'),
      ContentModel(
          userThumbnail: thumbnail, content: 'content18', contentType: 'image'),
      ContentModel(
          userThumbnail: thumbnail, content: 'content19', contentType: 'gif'),
      ContentModel(
          userThumbnail: thumbnail, content: 'content20', contentType: 'vedio'),
      ContentModel(
          userThumbnail: thumbnail, content: 'content21', contentType: 'vedio'),
      ContentModel(
          userThumbnail: thumbnail, content: 'content22', contentType: 'text'),
      ContentModel(
          userThumbnail: thumbnail, content: 'content23', contentType: 'text'),
      ContentModel(
          userThumbnail: thumbnail, content: 'content24', contentType: 'text'),
      ContentModel(
          userThumbnail: thumbnail, content: 'content25', contentType: 'image'),
      ContentModel(
          userThumbnail: thumbnail, content: 'content26', contentType: 'image'),
      ContentModel(
          userThumbnail: thumbnail, content: 'content27', contentType: 'vedio'),
      ContentModel(
          userThumbnail: thumbnail, content: 'content28', contentType: 'vedio'),
      ContentModel(
          userThumbnail: thumbnail, content: 'content29', contentType: 'text'),
      ContentModel(
          userThumbnail: thumbnail, content: 'content30', contentType: 'text'),
      ContentModel(
          userThumbnail: thumbnail, content: 'content31', contentType: 'image'),
      ContentModel(
          userThumbnail: thumbnail, content: 'content32', contentType: 'image'),
      ContentModel(
          userThumbnail: thumbnail, content: 'content33', contentType: 'vedio'),
      ContentModel(
          userThumbnail: thumbnail, content: 'content34', contentType: 'text'),
      ContentModel(
          userThumbnail: thumbnail, content: 'content35', contentType: 'gif'),
      ContentModel(
          userThumbnail: thumbnail, content: 'content36', contentType: 'gif'),
      ContentModel(
          userThumbnail: thumbnail, content: 'content37', contentType: 'vedio'),
      ContentModel(
          userThumbnail: thumbnail, content: 'content38', contentType: 'text'),
      ContentModel(
          userThumbnail: thumbnail, content: 'content39', contentType: 'gif'),
      ContentModel(
          userThumbnail: thumbnail, content: 'content40', contentType: 'vedio')
    ];
  }
}
