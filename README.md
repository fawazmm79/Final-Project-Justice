# Final-Project-Justice

[![wakatime](https://wakatime.com/badge/github/fawazmm79/Final-Project-Justice.svg)](https://wakatime.com/badge/github/fawazmm79/Final-Project-Justice)

# Description
Justice is an application that provides certified lawyers classified according to cases and provides legal information as well as the locations of lawyers' offices and courts on the map.

# Stories
### User path
* As a user I want to Go to the registration page as a user So that I can start use the app.
* As a user I want to login to my account So that I can use my account on the app.
* As a user I want to create my account So that I can start use the app.
* As a user I want to logout from app So that I can log my exit points.
* As a user I want to Browse all Case Categories So that I can To determine the classification of the case.
* As a user I want to Browse the lawyers rating of the case So that I can start communicating with the lawyer who specializes in the case.
* As a user I want to Browse all certified lawyers in the app So that I can choose a lawyer and communicate with him.
* As a user I want to Browse the news of courts and laws in the Kingdom of Saudi Arabia So that I can know all the news about the courts and their new laws and news.
* As a user I want to See the locations of the courts and lawyers' offices that are on the map and close to my location So that I can access them easily.

### Lawyer path
* As a lawyer I want to Go to the registration page as a lawyer So that I can start use the app.
* As a lawyer I want to login to my account So that I can use my account on the app.
* As a lawyer I want to create my account So that I can start use the app.
* As a lawyer I want to logout from app So that I can log my exit points.
* As a lawyer I want to Receive user questions through chat So that I can Answering user questions.
* As a lawyer I want to Receive user questions through a call So that I can Answering user questions.

# Backlog
### User profile:
* see my profile
* see exit point

### Lawyer profile:
* see my profile
* see exit point

# Client / Frontend
|Path|Component|Behavior|
|/|Splash Page|The main page to specify the path of the user as a user or as a lawyer|
|/user login|Login Page|Login, navigate to homepage after login|
|/user signup|Signup Page|signup, navigate to homepage after signup|
|/Lawyer login|Login Page|Login, navigate to homepage after login|
|/Lawyer signup|Signup Page|signup, navigate to homepage after signup|
|----|---------|--------|
|----|---------|--------|
|----|---------|--------|
|----|---------|--------|
|----|---------|--------|
|----|---------|--------|
|----|---------|--------|
|----|---------|--------|
|----|---------|--------|
|----|---------|--------|
|----|---------|--------|
|----|---------|--------|
|----|---------|--------|
Path Component
/	SplashPage
/signup	SignupPage

# Components
### User path
* Page for Selection Path as user or Lawyer
* Page for Login as User
* Page for Signup as User
* Tab Bar
* Page for Categories Cases
* Page for all lawyers names in app
* Page for Previous Conversations
* Page for News about courts and laws
* Page for Locations on the map
* Page for More Settings

### Lawyer path
* Page for Selection Path as user or Lawyer
* Page for Login as Lawyer
* Page for Signup as Lawyer
* Tab Bar
* Page for Previous Conversations with users
* Page for Locations on the map
* Page for More Settings

# Services
### User path
* Auth Service
    * auth.login(user)
    * auth.signup(user)
    * auth.logout()
    * auth.me()
    * auth.getUser() // synchronous
* Exit Point Service
    * exitPoint.list()
    * exitPoint.detail(id)
    * exitPoint.add(id)
    * exitPoint.delete(id)
* User Service
    * user.detail(id)

### Lawyer path
* Auth Service
    * auth.login(Lawyer)
    * auth.signup(Lawyer)
    * auth.logout()
    * auth.me()
    * auth.getUser() // synchronous
* Exit Point Service
    * exitPoint.list()
    * exitPoint.detail(id)
    * exitPoint.add(id)
    * exitPoint.delete(id)
* Lawyer Service
    * user.detail(id)

# Models (Server / Backend)

### User model path
{\
  id: {type: String, required: true, unique: true},\
  name: {type: String, required: true, unique: true},\
  image: {type: String, required: true, unique: false},\
  userEmail: {type: String, required: true, unique: true},\
  status: {type: String, required: true, unique: false},\
  latitude: {type: String, required: true, unique: false},\
  longitude: {type: String, required: true, unique: false},\
}

### Lawyer model path
{\
  id: {type: String, required: true, unique: true},\
  name: {type: String, required: true, unique: true},\
  image: {type: String, required: true, unique: false},\
  userEmail: {type: String, required: true, unique: true},\
  status: {type: String, required: true, unique: false},\
  latitude: {type: String, required: true, unique: false},\
  longitude: {type: String, required: true, unique: false},\
}

# Links

# Git
[Github Home Page Link](https://github.com/fawazmm79)

[Project Repository Link](https://github.com/fawazmm79/Final-Project-Justice.git)

# Slides
[Slides Link](https://drive.google.com/file/d/1b4fRQ9xpeKBJ8UaSd5tVWHBn_0a5EiHG/view?usp=sharing)
