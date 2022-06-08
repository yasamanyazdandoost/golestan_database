import operator
from functools import reduce
from typing import List

from database_gui import User, Category, Product, Preservative, Receipt, Purchase


class API:

    @classmethod
    def create_user(cls, **kwargs):
        for i in kwargs:
            if i not in ['email', 'password', 'mobile_number']:
                del kwargs[i]
        return User.create(**kwargs)

    @classmethod
    def delete_user(cls, user_id) -> int:
        return User.delete().where(User.id == user_id).execute()

    @classmethod
    def update_user(cls, user_id, **kwargs) -> int:
        for i in kwargs:
            if i not in ['email', 'password', 'mobile_number']:
                del kwargs[i]
        return User.update(**kwargs).where(User.id == user_id).execute()

    @classmethod
    def get_products(cls, **kwargs) -> List[Product]:
        filters = cls.__get_products_serializer(**kwargs)
        products = Product.select().where(filters) if filters else Product.select()
        return list(products)

    @classmethod
    def __get_products_serializer(cls, **kwargs):
        temp_filters = []
        for i in kwargs:
            if i == 'price_range':
                price_range = kwargs[i]
                temp_filters.append(((Product.price >= price_range[0]) & (Product.price <= price_range[1])))
            elif i == "categories":
                temp_filters.append((Product.category_id << kwargs[i]))
            elif i == "colors":
                temp_filters.append((Product.color << kwargs[i]))

        if not temp_filters:
            return None

        filters = reduce(operator.and_, temp_filters)
        return filters

    @classmethod
    def update_product(cls, product_id, **kwargs) -> int:
        for i in kwargs:
            if i not in ['name', 'image', 'price', 'color', 'number', 'category']:
                del kwargs[i]
        if 'category' in kwargs:
            kwargs['category_id'] = kwargs['category']
            del kwargs['category']
        return Product.update(**kwargs).where(Product.id == product_id).execute()

    @classmethod
    def delete_product(cls, product_id) -> int:
        return Product.delete().where(Product.id == product_id).execute()
