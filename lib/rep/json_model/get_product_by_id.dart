import 'package:newnedratask/rep/abstract_json_resource.dart';

class GetProductById extends AbstractJsonResource{
  Product? product;
  String? message;
  int? status;

  GetProductById({this.product, this.message, this.status});

  GetProductById.fromJson(Map<String, dynamic> json) {
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Product {
  ProductOptions? productOptions;
  String? sId;
  String? productName;
  List<ProductVariants>? productVariants;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Product(
      {this.productOptions,
        this.sId,
        this.productName,
        this.productVariants,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Product.fromJson(Map<String, dynamic> json) {
    productOptions = json['productOptions'] != null
        ? new ProductOptions.fromJson(json['productOptions'])
        : null;
    sId = json['_id'];
    productName = json['productName'];
    if (json['productVariants'] != null) {
      productVariants = <ProductVariants>[];
      json['productVariants'].forEach((v) {
        productVariants!.add(new ProductVariants.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productOptions != null) {
      data['productOptions'] = this.productOptions!.toJson();
    }
    data['_id'] = this.sId;
    data['productName'] = this.productName;
    if (this.productVariants != null) {
      data['productVariants'] =
          this.productVariants!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class ProductOptions {
  List<String>? productSizes;
  List<ProductColors>? productColors;

  ProductOptions({this.productSizes, this.productColors});

  ProductOptions.fromJson(Map<String, dynamic> json) {
    productSizes = json['productSizes'].cast<String>();
    if (json['productColors'] != null) {
      productColors = <ProductColors>[];
      json['productColors'].forEach((v) {
        productColors!.add(new ProductColors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productSizes'] = this.productSizes;
    if (this.productColors != null) {
      data['productColors'] =
          this.productColors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductColors {
  List<String>? colorImages;
  String? colorName;
  String? sId;

  ProductColors({this.colorImages, this.colorName, this.sId});

  ProductColors.fromJson(Map<String, dynamic> json) {
    colorImages = json['colorImages'].cast<String>();
    colorName = json['colorName'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['colorImages'] = this.colorImages;
    data['colorName'] = this.colorName;
    data['_id'] = this.sId;
    return data;
  }
}

class ProductVariants {
  VariantAttributes? variantAttributes;
  String? sId;
  String? variantPrice;
  int? iV;
  String? createdAt;
  String? updatedAt;
  String? productId;

  ProductVariants(
      {this.variantAttributes,
        this.sId,
        this.variantPrice,
        this.iV,
        this.createdAt,
        this.updatedAt,
        this.productId});

  ProductVariants.fromJson(Map<String, dynamic> json) {
    variantAttributes = json['variantAttributes'] != null
        ? new VariantAttributes.fromJson(json['variantAttributes'])
        : null;
    sId = json['_id'];
    variantPrice = json['variantPrice'];
    iV = json['__v'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.variantAttributes != null) {
      data['variantAttributes'] = this.variantAttributes!.toJson();
    }
    data['_id'] = this.sId;
    data['variantPrice'] = this.variantPrice;
    data['__v'] = this.iV;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['productId'] = this.productId;
    return data;
  }
}

class VariantAttributes {
  VariantColor? variantColor;
  String? variantSize;

  VariantAttributes({this.variantColor, this.variantSize});

  VariantAttributes.fromJson(Map<String, dynamic> json) {
    variantColor = json['variantColor'] != null
        ? new VariantColor.fromJson(json['variantColor'])
        : null;
    variantSize = json['variantSize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.variantColor != null) {
      data['variantColor'] = this.variantColor!.toJson();
    }
    data['variantSize'] = this.variantSize;
    return data;
  }
}

class VariantColor {
  String? colorName;

  VariantColor({this.colorName});

  VariantColor.fromJson(Map<String, dynamic> json) {
    colorName = json['colorName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['colorName'] = this.colorName;
    return data;
  }
}
