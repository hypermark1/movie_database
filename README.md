# Movies Database Project

## Overview

This project is a relational database designed to manage movie-related data and user interactions. The database supports storing information about movies, people involved in production, user reviews, preferences, news articles, and more. It is built using PostgreSQL and follows a structured schema for efficient querying and data organization.

## Features

* **Movie Management:** Store and retrieve information about movies, including genres, release dates, and ratings.
* **People Management:** Track individuals involved in movies (e.g., actors, directors).
* **User Interactions:** Users can leave reviews, rate movies, add favorites, and set preferences.
* **News System:** Store and manage movie-related news articles.
* **Comment System:** Allow users to comment on movies.

## Project Structure

* **schema.sql:** The SQL schema file to create the database structure.
* **Data Export:** The exported database (if included) for direct import.
* **README.md:** Documentation for the project.

## Database Tables

### Movies

| Column | Type | Description |
|---|---|---|
| ID | INT | Unique identifier for each movie |
| Title | VARCHAR(255) | Movie title |
| ReleaseDate | DATE | Release date of the movie |
| Genre | VARCHAR(255) | Genre of the movie |
| Rating | DECIMAL(2, 1) | Movie rating (out of 5) |
| Description | TEXT | A detailed description of the movie |

### People

| Column | Type | Description |
|---|---|---|
| ID | INT | Unique identifier for each person |
| Name | VARCHAR(255) | Name of the person |
| Role | VARCHAR(255) | The person's role in the movie industry (e.g., actor, director) |

### MoviePeople

| Column | Type | Description |
|---|---|---|
| ID | INT | Unique identifier for each movie-person relationship |
| MovieID | INT | Foreign key referencing the `Movies` table |
| PeopleID | INT | Foreign key referencing the `People` table |

### Users

| Column | Type | Description |
|---|---|---|
| ID | INT | Unique identifier for each user |
| Username | VARCHAR(255) | User's chosen username |
| Email | VARCHAR(255) | User's email address |
| Password | VARCHAR(255) | User's password (hashed) |

### Reviews

| Column | Type | Description |
|---|---|---|
| ID | INT | Unique identifier for each review |
| MovieID | INT | Foreign key referencing the `Movies` table |
| UserID | INT | Foreign key referencing the `Users` table |
| Rating | INT | Rating given by the user (out of 5) |
| ReviewText | TEXT | User's written review |
| ReviewDate | TIMESTAMP | Date and time the review was written |

### Favorites

| Column | Type | Description |
|---|---|---|
| ID | INT | Unique identifier for each favorite movie |
| UserID | INT | Foreign key referencing the `Users` table |
| MovieID | INT | Foreign key referencing the `Movies` table |

### Preferences

| Column | Type | Description |
|---|---|---|
| ID | INT | Unique identifier for each user preference |
| UserID | INT | Foreign key referencing the `Users` table |
| Preference | VARCHAR(255) | User's movie preference (e.g., genre, director) |

### Comments

| Column | Type | Description |
|---|---|---|
| ID | INT | Unique identifier for each comment |
| UserID | INT | Foreign key referencing the `Users` table |
| MovieID | INT | Foreign key referencing the `Movies` table |
| Comment | TEXT | The user's comment on the movie |
| CommentDate | TIMESTAMP | Date and time the comment was written |

### News

| Column | Type | Description |
|---|---|---|
| ID | INT | Unique identifier for each news article |
| Title | VARCHAR(255) | Title of the news article |
| Content | TEXT | Content of the news article |
| Author | VARCHAR(255) | Author of the news article |
| PublishDate | TIMESTAMP | Date and time the article was published |
