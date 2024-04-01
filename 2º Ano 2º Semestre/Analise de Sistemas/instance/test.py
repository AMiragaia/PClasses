import sqlite3

def print_db():
    conn = sqlite3.connect('my_database.db')  # connect to your database
    cursor = conn.cursor()  # create a cursor object

    # execute an SQL statement to fetch all rows from the user table
    cursor.execute("SELECT * FROM user")
    rows = cursor.fetchall()

    for row in rows:
        print(row)

    conn.close()  # close the connection

if __name__ == "__main__":
    print_db()
