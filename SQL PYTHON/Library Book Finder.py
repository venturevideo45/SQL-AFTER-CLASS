# ============================================================
# Activity: Library Book Finder
# ============================================================

import sqlite3
import pandas as pd

# ---- PART 1: Build the Database ----
conn = sqlite3.connect("library_books.db")
cursor = conn.cursor()

cursor.executescript("""
CREATE TABLE IF NOT EXISTS Author (
    Author_Id INTEGER PRIMARY KEY,
    Author_Name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Book (
    Book_Id INTEGER PRIMARY KEY,
    Title TEXT NOT NULL,
    Author_Id INTEGER,
    Genre TEXT,
    Publication_Year INTEGER,
    Price REAL,
    FOREIGN KEY (Author_Id) REFERENCES Author (Author_Id)
);

INSERT OR IGNORE INTO Author VALUES
    (1, 'George Orwell'), (2, 'Jane Austen'),
    (3, 'J.R.R. Tolkien'), (4, 'Mary Shelley');

INSERT OR IGNORE INTO Book VALUES
    (1, '1984', 1, 'Dystopian', 1949, 12.99),
    (2, 'Animal Farm', 1, 'Satire', 1945, 9.50),
    (3, 'Pride and Prejudice', 2, 'Romance', 1813, 10.99),
    (4, 'The Hobbit', 3, 'Fantasy', 1937, 14.99),
    (5, 'The Lord of the Rings', 3, 'Fantasy', 1954, 24.50),
    (6, 'Frankenstein', 4, 'Fiction', 1818, 8.75);
""")
conn.commit()
print("Library database ready!")

# ---- PART 2: Select Book Data ----
books = pd.read_sql("""SELECT * FROM Book;""", conn)
print(books)

# Select only the title and genre columns
titles = pd.read_sql("""SELECT Title, Genre FROM Book;""", conn)
print(titles)

# Show each book with its author's name
book_authors = pd.read_sql("""
    SELECT Book.Title, Author.Author_Name
    FROM Book JOIN Author ON Book.Author_Id = Author.Author_Id;
""", conn)
print(book_authors)

# ---- PART 3: Filter Books with WHERE ----
# Find books published after 1900
recent_books = pd.read_sql("""
    SELECT Title, Publication_Year
    FROM Book
    WHERE Publication_Year > 1900;
""", conn)
print(recent_books)

# Find fantasy books that cost less than $20
affordable_fantasy = pd.read_sql("""
    SELECT Title, Price
    FROM Book
    WHERE Genre = 'Fantasy' AND Price < 20;
""", conn)
print(affordable_fantasy)

# ---- PART 4: Search Titles with LIKE ----
# % matches any number of characters
the_books = pd.read_sql("""
    SELECT Title FROM Book WHERE Title LIKE 'The %';
""", conn)
print(the_books)

farm_books = pd.read_sql("""
    SELECT Title FROM Book WHERE Title LIKE '%Farm%';
""", conn)
print(farm_books)

# ---- PART 5: Find Smallest and Largest Values ----
prices = pd.read_sql("""
    SELECT MIN(Price) AS Lowest_Price, MAX(Price) AS Highest_Price
    FROM Book;
""", conn)
print(prices)

years = pd.read_sql("""
    SELECT MIN(Publication_Year) AS Earliest_Year,
           MAX(Publication_Year) AS Latest_Year
    FROM Book;
""", conn)
print(years)

conn.close()
