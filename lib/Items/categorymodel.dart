class CategoryModel {
  String? categoryName;
  int? selectedIndex;
  String? image;

  // get image => null;
}

class ShowCategoryModel {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? content;

  ShowCategoryModel(
      {this.author,
      this.content,
      this.description,
      this.title,
      this.url,
      this.urlToImage});
}
