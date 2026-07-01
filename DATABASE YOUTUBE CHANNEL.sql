CREATE DATABASE YouTubeDB;
USE YouTubeDB;

CREATE TABLE Users (user_id INT PRIMARY KEY,name VARCHAR(100),email VARCHAR(100),join_date DATE);
CREATE TABLE Channel (channel_id INT PRIMARY KEY,channel_name VARCHAR(100),creation_date DATE,user_id INT);
CREATE TABLE Video (video_id INT PRIMARY KEY,title VARCHAR(150),upload_date DATE,views INT,channel_id INT);
CREATE TABLE Comment (comment_id INT PRIMARY KEY,text VARCHAR(255),comment_date DATE,user_id INT,video_id INT);
CREATE TABLE Likes (like_id INT PRIMARY KEY,user_id INT,video_id INT);
CREATE TABLE Subscription (sub_id INT PRIMARY KEY,user_id INT,channel_id INT,sub_date DATE);


ALTER TABLE Channel
ADD FOREIGN KEY (user_id) REFERENCES Users(user_id);

ALTER TABLE Video
ADD FOREIGN KEY (channel_id) REFERENCES Channel(channel_id);

ALTER TABLE Comment
ADD FOREIGN KEY (user_id) REFERENCES Users(user_id);

ALTER TABLE Comment
ADD FOREIGN KEY (video_id) REFERENCES Video(video_id);

ALTER TABLE Likes
ADD FOREIGN KEY (user_id) REFERENCES Users(user_id);

ALTER TABLE Likes
ADD FOREIGN KEY (video_id) REFERENCES Video(video_id);

ALTER TABLE Subscription
ADD FOREIGN KEY (user_id) REFERENCES Users(user_id);

ALTER TABLE Subscription
ADD FOREIGN KEY (channel_id) REFERENCES Channel(channel_id);


INSERT INTO Users VALUES
(1, 'Ali Khan', 'ali@gmail.com', '2023-01-10'),
(2, 'Sara Ahmed', 'sara@gmail.com', '2023-02-15'),
(3, 'Usman Tariq', 'usman@gmail.com', '2023-03-20');


INSERT INTO Channel VALUES
(101, 'Tech World', '2023-01-15', 1),
(102, 'Cooking Master', '2023-02-20', 2);

INSERT INTO Video VALUES
(1001, 'How to build PC', '2023-03-01', 5000, 101),
(1002, 'Best Pasta Recipe', '2023-03-05', 3000, 102);

INSERT INTO Comment VALUES
(201, 'Great video!', '2023-03-06', 2, 1001),
(202, 'Very helpful!', '2023-03-07', 3, 1002);

INSERT INTO Likes VALUES
(301, 2, 1001),
(302, 3, 1002);

INSERT INTO Subscription VALUES
(401, 2, 101, '2023-03-10'),
(402, 3, 102, '2023-03-12');
