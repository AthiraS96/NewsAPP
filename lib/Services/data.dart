import 'package:news_app/Items/categorymodel.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = [];
  CategoryModel categoryModel = new CategoryModel();

  categoryModel.categoryName = "General";
  categoryModel.selectedIndex = 0;
  categoryModel.image = "assets/general3.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Business";
  categoryModel.selectedIndex = 1;
  categoryModel.image = "assets/business.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Entertainment";
  categoryModel.selectedIndex = 2;
  categoryModel.image = "assets/entertainment.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Health";
  categoryModel.selectedIndex = 3;
  categoryModel.image = "assets/health1.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Sports";
  categoryModel.selectedIndex = 4;
  categoryModel.image = "assets/sports3.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  return category;
}
