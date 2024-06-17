CREATE DATABASE Twitter_Clone;
USE Twitter_Clone;

-- Create the 'User' table
CREATE TABLE User (
    uid INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fname VARCHAR(30) NOT NULL,
    mname VARCHAR(30),
    lname VARCHAR(30) NOT NULL,
    email VARCHAR(30),
    mobile BIGINT(10),
    password varchar(255) NOT NULL,
    gender ENUM('Male', 'Female', 'DND') NOT NULL,
    dob DATE NOT NULL,
    dor DATE NOT NULL,
    status TINYINT(1) default 0,
    softdelete TINYINT default 0,
    about VARCHAR(255),
    profilepic VARCHAR(255),
    headerpic VARCHAR(255)
);


-- Create the 'tweet' table
CREATE TABLE tweet (
    tid INT PRIMARY KEY AUTO_INCREMENT not null,
    uid INT not null,
    post VARCHAR(255) not null,
    datetime DATETIME not null,
    image_video_name varchar(255),
    type varchar(30),
    softdelete TINYINT(1) DEFAULT 0,
    FOREIGN KEY (uid) REFERENCES User(uid)
);

-- Create the 'tweet_comment' table
CREATE TABLE tweet_comment (
    tcid INT PRIMARY KEY AUTO_INCREMENT not null,
    tid INT not null,
    uid INT not null,
    comment VARCHAR(255) not null,
    datetime DATETIME not null,
    softdelete TINYINT(1) DEFAULT 0,
    FOREIGN KEY (tid) REFERENCES tweet(tid),
    FOREIGN KEY (uid) REFERENCES User(uid)
);
-- Create the 'comment_like' table
create table comment_like (
    clid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tcid INT NOT NULL,
    uid INT NOT NULL,
    datetime DATETIME,
    FOREIGN KEY (tcid) REFERENCES tweet_comment(tcid),
    FOREIGN KEY (uid) REFERENCES User(uid)
);

-- Create the 'tweet_like' table
create table tweet_like(
	tlid int not null auto_increment primary key,
    tid int not null,
    uid int not null,
    datetime DATETIME,
    foreign key (tid) references tweet(tid),
    foreign key (uid) references User(uid)
);

-- Create the 'tags' table
CREATE TABLE tags (
    tagid INT not null PRIMARY KEY AUTO_INCREMENT,
    tagname VARCHAR(100) not null,
    datetime DATETIME
);

-- Create the 'user_follows' table
CREATE TABLE user_follows (
    ufid INT PRIMARY KEY AUTO_INCREMENT not null,
    uid INT not null,
    follow_id INT not null,
    softdelete TINYINT(1) DEFAULT 0,
    datetime DATETIME,
    FOREIGN KEY (uid) REFERENCES User(uid),
    FOREIGN KEY (follow_id) REFERENCES User(uid)
);


-- Create the 'profile_post_report' table
CREATE TABLE profile_post_report (
    pprid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    uid INT NOT NULL,
    postid_uid INT NOT NULL,
    type VARCHAR(30) NOT NULL,
    report_reason VARCHAR(255) NOT NULL,
    datetime DATETIME,
    FOREIGN KEY (uid) REFERENCES User(uid)
);

