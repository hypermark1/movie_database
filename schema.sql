-- TABLE
CREATE TABLE Comments (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    UserID INTEGER,
    MovieID INTEGER,
    Comment TEXT,
    CommentDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(ID),
    FOREIGN KEY (MovieID) REFERENCES Movies(ID)
);
CREATE TABLE Favorites (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    UserID INTEGER,
    MovieID INTEGER,
    FOREIGN KEY (UserID) REFERENCES Users(ID),
    FOREIGN KEY (MovieID) REFERENCES Movies(ID)
);
CREATE TABLE MoviePeople (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    MovieID INTEGER,
    PeopleID INTEGER,
    FOREIGN KEY (MovieID) REFERENCES Movies(ID) ON DELETE CASCADE,
    FOREIGN KEY (PeopleID) REFERENCES People(ID)
);
CREATE TABLE Movies (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Title TEXT NOT NULL,
    ReleaseDate DATE,
    Genre TEXT,
    Rating REAL,
    Description TEXT
);
CREATE TABLE News (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Title TEXT NOT NULL,
    Content TEXT,
    Author TEXT,
    PublishDate DATE
);
CREATE TABLE People (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    Role TEXT
);
CREATE TABLE Preferences (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    UserID INTEGER,
    Preference TEXT,
    FOREIGN KEY (UserID) REFERENCES Users(ID)
);
CREATE TABLE Reviews (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    MovieID INTEGER,
    UserID INTEGER,
    Rating REAL,
    ReviewText TEXT,
    ReviewDate DATE,
    FOREIGN KEY (MovieID) REFERENCES Movies(ID) ON DELETE CASCADE,
    FOREIGN KEY (UserID) REFERENCES Users(ID)
);
CREATE TABLE Users (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Username TEXT NOT NULL,
    Email TEXT,
    Password TEXT
);
 
-- INDEX
 
-- TRIGGER
 
-- VIEW
 