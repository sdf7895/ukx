abstract class ContentDisplay {
  display();
}

class ContentModel {
  String user_id;
  String userThumbnail;
  String content;
  String contentType;

  ContentModel({
    required this.user_id,
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
          user_id: '@dkxmfe2',
          userThumbnail: thumbnail,
          content: 'content1',
          contentType: 'image'),
      ContentModel(
          user_id: '@fdklsl3',
          userThumbnail: thumbnail,
          content: 'content2',
          contentType: 'image'),
      ContentModel(
          user_id: '@fdewfds0',
          userThumbnail: thumbnail,
          content: 'content3',
          contentType: 'gif'),
      ContentModel(
          user_id: '@kim',
          userThumbnail: thumbnail,
          content: 'content4',
          contentType: 'text'),
      ContentModel(
          user_id: '@dsfafds',
          userThumbnail: thumbnail,
          content: 'content5',
          contentType: 'gif'),
      ContentModel(
          user_id: '@wesdf',
          userThumbnail: thumbnail,
          content: 'content6',
          contentType: 'vedio'),
      ContentModel(
          user_id: '@sdfafdsds',
          userThumbnail: thumbnail,
          content: 'content7',
          contentType: 'text'),
      ContentModel(
          user_id: '@sdfer',
          userThumbnail: thumbnail,
          content: 'content8',
          contentType: 'vedio'),
      ContentModel(
          user_id: '@rewq',
          userThumbnail: thumbnail,
          content: 'content9',
          contentType: 'gif'),
      ContentModel(
          user_id: '@sfsdfsa',
          userThumbnail: thumbnail,
          content: 'content10',
          contentType: 'gif'),
      ContentModel(
          user_id: '@start_go',
          userThumbnail: thumbnail,
          content: 'content11',
          contentType: 'image'),
      ContentModel(
          user_id: '@sdvsdf',
          userThumbnail: thumbnail,
          content: 'content12',
          contentType: 'image'),
      ContentModel(
          user_id: '@sdjfxxcv',
          userThumbnail: thumbnail,
          content: 'content13',
          contentType: 'text'),
      ContentModel(
          user_id: '@dsweklt',
          userThumbnail: thumbnail,
          content: 'content14',
          contentType: 'gif'),
      ContentModel(
          user_id: '@tesadvd',
          userThumbnail: thumbnail,
          content: 'content15',
          contentType: 'image'),
      ContentModel(
          user_id: '@test',
          userThumbnail: thumbnail,
          content: 'content16',
          contentType: 'text'),
      ContentModel(
          user_id: '@dsfk^^',
          userThumbnail: thumbnail,
          content: 'content17',
          contentType: 'image'),
      ContentModel(
          user_id: '@sdfjklvb',
          userThumbnail: thumbnail,
          content: 'content18',
          contentType: 'image'),
      ContentModel(
          user_id: '@tekwlklfd',
          userThumbnail: thumbnail,
          content: 'content19',
          contentType: 'gif'),
      ContentModel(
          user_id: '@sdfkljtlw',
          userThumbnail: thumbnail,
          content: 'content20',
          contentType: 'vedio'),
      ContentModel(
          user_id: '@dsafs',
          userThumbnail: thumbnail,
          content: 'content21',
          contentType: 'vedio'),
      ContentModel(
          user_id: '@vcbc',
          userThumbnail: thumbnail,
          content: 'content22',
          contentType: 'text'),
      ContentModel(
          user_id: '@kl;ds',
          userThumbnail: thumbnail,
          content: 'content23',
          contentType: 'text'),
      ContentModel(
          user_id: '@sft5edf',
          userThumbnail: thumbnail,
          content: 'dsfasddsf',
          contentType: 'text'),
      ContentModel(
          user_id: '@fdsewrw',
          userThumbnail: thumbnail,
          content: 'content25',
          contentType: 'image'),
      ContentModel(
          user_id: '@sdfcvs',
          userThumbnail: thumbnail,
          content: 'content26',
          contentType: 'image'),
      ContentModel(
          user_id: '@sdfewry',
          userThumbnail: thumbnail,
          content: 'weewr123',
          contentType: 'vedio'),
      ContentModel(
          user_id: '@sdfsaa3',
          userThumbnail: thumbnail,
          content: 'content28',
          contentType: 'vedio'),
      ContentModel(
          user_id: '@sdfvvcx4',
          userThumbnail: thumbnail,
          content: 'content29',
          contentType: 'text'),
      ContentModel(
          user_id: '@dkxmfe2',
          userThumbnail: thumbnail,
          content: 'content30',
          contentType: 'text'),
      ContentModel(
          user_id: '@sdfahfds99',
          userThumbnail: thumbnail,
          content: 'content31',
          contentType: 'image'),
      ContentModel(
          user_id: '@sdfafasdrgdf',
          userThumbnail: thumbnail,
          content: 'content32',
          contentType: 'image'),
      ContentModel(
          user_id: '@mainjdskl',
          userThumbnail: thumbnail,
          content: 'content33',
          contentType: 'vedio'),
      ContentModel(
          user_id: '@server_1421',
          userThumbnail: thumbnail,
          content: 'content34',
          contentType: 'text'),
      ContentModel(
          user_id: '@sdfgsdfds',
          userThumbnail: thumbnail,
          content: 'content35',
          contentType: 'gif'),
      ContentModel(
          user_id: '@sdfgsfsads',
          userThumbnail: thumbnail,
          content: 'content36',
          contentType: 'gif'),
      ContentModel(
          user_id: '@terwesdf',
          userThumbnail: thumbnail,
          content: 'dsfxcv12',
          contentType: 'vedio'),
      ContentModel(
          user_id: '@sdfasdff54',
          userThumbnail: thumbnail,
          content: 'content38',
          contentType: 'text'),
      ContentModel(
          user_id: '@sdjklvcxkl',
          userThumbnail: thumbnail,
          content: 'content39',
          contentType: 'gif'),
      ContentModel(
          user_id: '@adsfklsklfls',
          userThumbnail: thumbnail,
          content: 'content40',
          contentType: 'vedio'),
    ];
  }
}
