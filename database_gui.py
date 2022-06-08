from peewee import *

db = SqliteDatabase('data.db')
# db = MySQLDatabase(
#         host="localhost",
#         user="project1",
#         passwd="2208631",
#         database="SQL_PROJECT"
#         )


class BaseModel(Model):
    class Meta:
        database = db


class User(BaseModel):
    email = CharField(max_length=255)
    password = CharField(max_length=255)
    mobile_number = DecimalField(max_digits=14, decimal_places=0)


class Category(BaseModel):
    name = CharField()
    parent = ForeignKeyField('self', null=True)


class Product(BaseModel):
    name = CharField()
    image = BinaryUUIDField(default=None, null=True)
    price = DecimalField(max_digits=10, decimal_places=2)
    color = CharField(max_length=50)
    number = IntegerField(default=0)
    category = ForeignKeyField(Category, null=True, default=None)


class Preservative(BaseModel):
    name = CharField(max_length=255, default=None, null=True)
    price = DecimalField(max_digits=10, decimal_places=2, default=None, null=True)
    product = ForeignKeyField(Product, default=None, null=True)


class Receipt(BaseModel):
    delivery_time = DateTimeField()
    shipping_fee = IntegerField(default=None, null=True)
    user = ForeignKeyField(User)


class Purchase(BaseModel):
    receipt = ForeignKeyField(Receipt)
    product = ForeignKeyField(Product)
    preservative = ForeignKeyField(Preservative)
    product_number = IntegerField(default=None, null=True)


tables_to_create = []
for i in [User, Category, Product, Preservative, Receipt, Purchase]:
    if not db.table_exists(i):
        tables_to_create.append(i)

if tables_to_create:
    db.create_tables(tables_to_create)
