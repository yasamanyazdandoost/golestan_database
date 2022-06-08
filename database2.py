import sys
import mysql.connector
from mysql.connector import Error

try:
    db = mysql.connector.connect(
        host="localhost",
        user="project1",
        passwd="2208631",
        database="sql_project2"
    )
    mycursor = db.cursor()
except:
    print("Can't Connect to Database!")
    sys.exit(0)


class Project:

    def __init__(self):
        self.menu()

    def menu(self):

        while True:
            print("""
            
            ============================
            1.Show all available Products
            2.Filters
            3.Update a Product
            4.Delete a Product
            5.Exit
            ============================
            """)

            choice = input("""
            What would you like to do? """)

            if choice == "1":
                self.available_product()

            elif choice == "2":
                self.show_filters()

            elif choice == "3":
                print("""
            Updating Query Guide
            ============================
            UPDATE table_name 
            SET column_name1 = expr1,column_name2 = expr2,... 
            [WHERE condition];
            ============================
                """)
                self.update()

            elif choice == "4":
                print(""" 
            Deleting Query Guide
            ============================
            ALTER TABLE table_name DROP COLUMN column_name;
            DROP TABLE table_name;
            DELETE FROM table_name [WHERE search_condition];
            ============================
                """)
                self.update()

            elif choice == "5":
                break

            else:
                print("""
                Not Valid Choice Try again""")

    def available_product(self):
        mycursor.execute("SELECT * FROM Product WHERE number != 0")
        try:
            myresult = mycursor.fetchall()
            print("""\n
            All Available Products
            ============================
    (id, name, image, price, color, number, category)
            ============================""")
            for row in myresult:
                for x in range(7):
                    print(row[x], end=", ")
                print("\n")
        except:
            print("""
            Couldn't Fetch!""")

    def update(self):
        """ ALTER TABLE table_name DROP COLUMN column_name;
            DROP TABLE table_name;
            DELETE FROM table_name [WHERE search_condition];

            UPDATE table_name SET column_name1 = expr1,column_name2 = expr2,... [WHERE condition];"""

        query = input("""
            Query: """)
        query.replace('"', '\"')
        query.replace('\'', '\\\'')

        try:
            mycursor.execute(query)
            db.commit()
            print("Done.")

        except Error as error:
            print(error)
            print("""
            Not Valid Query Try again""")
            self.update()

    def show_filters(self):


        while True:
            print("""
            
            ============================           
            1.First Filter :  show emails of the users who each bought exactly 3 distinct
                            products (excluding preservatives) in 2020 (ascending order).              
            2.Second Filter :  show the names and prices of the products suitable for 
                            birthday occasions and have been bought before.  
            3.Third Filter : which users have bought the most expensive products? 
                            and how much is their price?                              
            4.Back to Menu
            ============================           
                        """)

            choice = input("""
            Which filter would you like to see?""")

            if choice == "1":
                self.first_filter()
            elif choice == "2":
                self.second_filter()
            elif choice == "3":
                self.third_filter()
            elif choice == "4":
                break
            else:
                print("""
            Not Valid Choice Try again""")

    def first_filter(self):

        mycursor.execute("""select email 
                            from (user natural join receipt) natural join purchase
                            where delivery_time > "2020-00-00" 
                            group by email 
                            having count(*) = 3 
                            order by email asc;""")
        try:
            myresult = mycursor.fetchall()
            print("""            Results: \n            ============================""")
            for row in myresult:
                print(row)
        except:
            print("""
            Couldn't Fetch!""")

    def second_filter(self):

        mycursor.execute("""select product_name, price 
                            from product 
                            where category_name = "Birthday flower" and number != 0 and 
                            product_id in (select product_id from purchase);""")
        try:
            myresult = mycursor.fetchall()
            print("""            Results: \n            ============================""")
            for row in myresult:
                print(row)
        except:
            print("""
            Couldn't Fetch!""")

    def third_filter(self):

        mycursor.execute("""select email, max(price) as m 
                            from (product natural join purchase) natural join user;""")
        try:
            myresult = mycursor.fetchall()
            print("""            Results: \n            ============================""")
            for row in myresult:
                print(row)
        except:
            print("""
            Couldn't Fetch!""")


p = Project()

mycursor.close()
db.close()



