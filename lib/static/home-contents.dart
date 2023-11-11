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

class HomeContent{
  List<ContentModel> homeContent = [
    ContentModel(userThumbnail: '', content: 'content1', contentType: 'image'),
    ContentModel(userThumbnail: '', content: 'content2', contentType: 'image'),
    ContentModel(userThumbnail: '', content: 'content3', contentType: 'gif'),
    ContentModel(userThumbnail: '', content: 'content4', contentType: 'text'),
    ContentModel(userThumbnail: '', content: 'content5', contentType: 'gif'),
    ContentModel(userThumbnail: '', content: 'content6', contentType: 'vedio'),
    ContentModel(userThumbnail: '', content: 'content7', contentType: 'text'),
    ContentModel(userThumbnail: '', content: 'content8', contentType: 'vedio'),
    ContentModel(userThumbnail: '', content: 'content9', contentType: 'gif'),
    ContentModel(userThumbnail: '', content: 'content10', contentType: 'gif'),
    ContentModel(userThumbnail: '', content: 'content11', contentType: 'image'),
    ContentModel(userThumbnail: '', content: 'content12', contentType: 'image'),
    ContentModel(userThumbnail: '', content: 'content13', contentType: 'text'),
    ContentModel(userThumbnail: '', content: 'content14', contentType: 'gif'),
    ContentModel(userThumbnail: '', content: 'content15', contentType: 'image'),
    ContentModel(userThumbnail: '', content: 'content16', contentType: 'text'),
    ContentModel(userThumbnail: '', content: 'content17', contentType: 'image'),
    ContentModel(userThumbnail: '', content: 'content18', contentType: 'image'),
    ContentModel(userThumbnail: '', content: 'content19', contentType: 'gif'),
    ContentModel(userThumbnail: '', content: 'content20', contentType: 'vedio'),
    ContentModel(userThumbnail: '', content: 'content21', contentType: 'vedio'),
    ContentModel(userThumbnail: '', content: 'content22', contentType: 'text'),
    ContentModel(userThumbnail: '', content: 'content23', contentType: 'text'),
    ContentModel(userThumbnail: '', content: 'content24', contentType: 'text'),
    ContentModel(userThumbnail: '', content: 'content25', contentType: 'image'),
    ContentModel(userThumbnail: '', content: 'content26', contentType: 'image'),
    ContentModel(userThumbnail: '', content: 'content27', contentType: 'vedio'),
    ContentModel(userThumbnail: '', content: 'content28', contentType: 'vedio'),
    ContentModel(userThumbnail: '', content: 'content29', contentType: 'text'),
    ContentModel(userThumbnail: '', content: 'content30', contentType: 'text'),
    ContentModel(userThumbnail: '', content: 'content31', contentType: 'image'),
    ContentModel(userThumbnail: '', content: 'content32', contentType: 'image'),
    ContentModel(userThumbnail: '', content: 'content33', contentType: 'vedio'),
    ContentModel(userThumbnail: '', content: 'content34', contentType: 'text'),
    ContentModel(userThumbnail: '', content: 'content35', contentType: 'gif'),
    ContentModel(userThumbnail: '', content: 'content36', contentType: 'gif'),
    ContentModel(userThumbnail: '', content: 'content37', contentType: 'vedio'),
    ContentModel(userThumbnail: '', content: 'content38', contentType: 'text'),
    ContentModel(userThumbnail: '', content: 'content39', contentType: 'gif'),
    ContentModel(userThumbnail: '', content: 'content40', contentType: 'vedio')
  ]
  HomeContent()
}
