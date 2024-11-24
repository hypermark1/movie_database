-- Creating tables

CREATE TABLE Movies (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Title TEXT NOT NULL,
    ReleaseDate DATE,
    Genre TEXT,
    Rating REAL,
    Description TEXT
);

CREATE TABLE People (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    Role TEXT
);

CREATE TABLE MoviePeople (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    MovieID INTEGER,
    PeopleID INTEGER,
    FOREIGN KEY (MovieID) REFERENCES Movies(ID) ON DELETE CASCADE,
    FOREIGN KEY (PeopleID) REFERENCES People(ID)
);

CREATE TABLE Users (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Username TEXT NOT NULL,
    Email TEXT,
    Password TEXT
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

CREATE TABLE News (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Title TEXT NOT NULL,
    Content TEXT,
    Author TEXT,
    PublishDate DATE
);

CREATE TABLE Favorites (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    UserID INTEGER,
    MovieID INTEGER,
    FOREIGN KEY (UserID) REFERENCES Users(ID),
    FOREIGN KEY (MovieID) REFERENCES Movies(ID)
);

CREATE TABLE Preferences (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    UserID INTEGER,
    Preference TEXT,
    FOREIGN KEY (UserID) REFERENCES Users(ID)
);

CREATE TABLE Comments (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    UserID INTEGER,
    MovieID INTEGER,
    Comment TEXT,
    CommentDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(ID),
    FOREIGN KEY (MovieID) REFERENCES Movies(ID)
);

-- Inserting data

INSERT INTO Movies (Title, ReleaseDate, Genre, Rating, Description) VALUES 
('The Grand Adventure', '2022-01-01', 'Drama', 8.5, 'An epic tale of love and betrayal.'),
('Fast & Furious: Speed Wars', '2023-05-10', 'Action', 7.2, 'High-octane action and thrilling car chases.');

INSERT INTO People (Name, Role) VALUES 
('John Doe', 'Actor'), 
('Jane Smith', 'Director');

INSERT INTO MoviePeople (MovieID, PeopleID) VALUES 
(1, 1), 
(1, 2);

INSERT INTO Users (Username, Email, Password) VALUES 
('Alice', 'alice@example.com', 'password123'), 
('Bob', 'bob@example.com', 'securepassword');

INSERT INTO Reviews (MovieID, UserID, Rating, ReviewText, ReviewDate) VALUES 
(1, 1, 9.0, 'Absolutely loved it! A must-watch.', '2023-06-01'), 
(2, 2, 7.5, 'Great action scenes, but lacking in story.', '2023-06-02');

INSERT INTO News (Title, Content, Author, PublishDate) VALUES 
('Award Season Begins', 'The annual award season has started with a bang.', 'Editor1', '2023-06-03'), 
('New Movie Releases', 'Check out the latest movies hitting theaters this week.', 'Editor2', '2023-06-04');

INSERT INTO Favorites (UserID, MovieID) VALUES
(1, 1),
(2, 2);

INSERT INTO Preferences (UserID, Preference) VALUES
(1, 'Drama'),
(2, 'Action');

INSERT INTO Comments (UserID, MovieID, Comment, CommentDate) VALUES
(1, 1, 'Amazing movie!', '2023-06-01'),
(2, 2, 'Great action scenes.', '2023-06-02');

-- Extra
-- 1. List all movies with details
SELECT * FROM Movies;

-- 2. Find movies by genre and release date
SELECT * FROM Movies WHERE Genre = 'Action' AND ReleaseDate > '2023-01-01';

-- 3. List actors and their roles in a specific movie
SELECT People.Name, People.Role 
FROM People
JOIN MoviePeople ON People.ID = MoviePeople.PeopleID
WHERE MoviePeople.MovieID = 1;

-- 4. List reviews and ratings for a specific movie
SELECT Users.Username, Reviews.Rating, Reviews.ReviewText, Reviews.ReviewDate
FROM Reviews
JOIN Users ON Reviews.UserID = Users.ID
WHERE Reviews.MovieID = 1;

-- 5. Add a new movie
INSERT INTO Movies (Title, ReleaseDate, Genre, Rating, Description) 
VALUES ('Movie3', '2023-12-01', 'Comedy', 8.0, 'Description of Movie3');

-- 6. Update movie information
UPDATE Movies 
SET Rating = 8.3 
WHERE ID = 1;

-- 7. Delete a movie
DELETE FROM Movies WHERE ID = 2;

-- 8. Add a new review
INSERT INTO Reviews (MovieID, UserID, Rating, ReviewText, ReviewDate) 
VALUES (1, 2, 8.5, 'Nice movie!', '2023-06-05');

-- 9. Delete a review
DELETE FROM Reviews WHERE ID = 2;

-- 10. Add a favorite movie for a user
INSERT INTO Favorites (UserID, MovieID) 
VALUES (1, 1);

-- 11. Add a preference for a user
INSERT INTO Preferences (UserID, Preference) 
VALUES (1, 'Comedy');

-- 12. Add a comment for a movie
INSERT INTO Comments (UserID, MovieID, Comment, CommentDate) 
VALUES (1, 1, 'Fantastic movie, highly recommend!', '2023-06-01');

