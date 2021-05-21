class PostModel {
  final String language;
  final List<LinkPage> pages;
  final List<String> comments;

  const PostModel(this.language, this.pages, this.comments);
}

class LinkPage {
  final String url;
  final String title;

  const LinkPage(this.url, this.title);
}
