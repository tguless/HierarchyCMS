HierarchyCMS
=================

Overview
--------

HierarchyCMS was developed in the 2010-2011 timeframe to experiment with building a social network platform that relies on its community to contribute to its database schema. 

The idea was to give the community the ability to build a new database structure for content that can ultimately be tied to a social network profile and be presented in a social media feed. 

For example, the community could submit a request to create a new data-type called "car" with attributes like "Make", "Model" and "Year" which could then be tied to a user profile via a relationship record ("User Profile"--"has"--->"Car"). 

A further distinguishing feature of this social media platform was the introduction of multiple personalities while at the time none of the social media platforms allowed this.  

Facebook has since introduced the idea of "profiles". 

## What Features did it Come With?

At launch it came with the following features

1. Real-Time messaging.
2. The ability to create multiple personalities. 
3. Rudimentary content type creator. 
4. Example Album content type for housing videos and photos (with content entry and display screens). 
5. Example Video content type (with content entry and display screens). 
6. Example Photo content type (with content entry and display screens). 
7. Example social media feed showing above content types with appropriate viewers.

## Technology Misfit

While the back-end was developed using a MySQL database, I soon came to the realization that not only was MySQL not a fit to build what is essentially a graph database, but also that graph database platforms like [Neo4j](https://neo4j.com/) would be able to serve the need in a much more efficient manner. 

Using MySQL to store and retrieve graphs also made it difficult to use an ORM for the purpose, which forced the creation of a non-standard/framework conformant (i.e. Hibernate, Spring Data) data access layer. 

## Why Was it Mothballed for So Long?

The project was mothballed because without Docker, it was difficult to create simplified installation and deployment instructions of all the dependencies to distribute among peers for review and co-development. 

Also, since the application was developed using GWT and as most GWT libraries had not at the time been leveraging centralized repositories like Maven for software distribution, pulling in 3rd party dependencies required a complex set of instructions / scripts to package the right versions of dependencies together.

Even today, I had to mavenize some legacy dependencies and include them with my project to make the packaging of the application as clean as possible. 

## Honorable Mentions 

### Packaging Help

https://github.com/steinsag/gwt-maven-example (great example of how to mavenize GWT projects)

### Real Time Messaging

https://github.com/igniterealtime/Smack (talk to ejabberd XMPP server for profile creation)

https://www.ejabberd.im/ (real time messaging using XMPP)

https://github.com/EmiteGWT/hablar (front end for Emite)

https://github.com/EmiteGWT/emite (A XMPP Library for GWT environment)

### Security

https://simplecaptcha.sourceforge.net/ (captcha)

### Video

https://github.com/PHP-FFMpeg/PHP-FFMpeg (For introspecting video files)

https://sourceforge.net/projects/php-java-bridge/ (Java bridge to php-ffmpeg to help with video metadata extraction)

https://github.com/Letractively/gwt-html5-video (a browser agnostic video playback widget for GWT)

### Multi File Uploads

https://code.google.com/archive/p/gwt-fileapi/ (file upload GWT component)

https://code.google.com/archive/p/swfupload-gwt/ (fallback for non HTML 5 browsers - legacy junk now)

### GUI

https://www.sencha.com/products/gxt/ (used a legacy gxt-2.2.4-gwt22 library for visual elements)



Running via Maven in GWT Dev Mode
---------------------------------

### Start Dependencies

First we need to make sure mysql and ejabberd are up and running. 

```
docker-compose run mysql ejabberd
```

### Run the Application in GWT Dev Mode

In the directory WebApp-Maven:

```
cd WebApp-Maven
```

Start the web application in Tomcat 7 via Maven

```
mvn clean install
mvn tomcat7:run-war-only
```

Your application is now deployed at http://127.0.0.1:8082/parent/

Start GWT Dev Mode via Maven

```
mvn gwt:run -pl web
```

Upon success, the GWT Dev Mode window opens. 

Click *Launch Default Browser* to open it in GWT Dev Mode.

Your changes to client GWT Java code will become immediately available as soon as you reloaded the page in the browser.

