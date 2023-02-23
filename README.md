HierarchyCMS
=================

Overview
--------

HierarchyCMS was developed in the 2010-2011 timeframe to experiment with building a social network platform that relies on its community to contribute to its database schema. 

The idea was to give the community the ability to add new content types to add to social network profiles which can then be presented in social media feeds. 

For example, the community could submit a request to create a new data-type called "car" with attributes like "Make", "Model" and "Year" which could then be tied to a user profile via a relationship record ("User Profile"--"has"--->"Car"). 

A further distinguishing feature of this social media platform was the introduction of multiple personalities. 

At the time none of the social media platforms allowed the creation of multiple personalities under the same account.  

Facebook has since introduced the idea of "profiles" to achieve the same. 

## What is with the Name?

CMS short for Content Management System is an ever common term used for projects like WordPress and Drupal. 

Content Management Systems all have an extensible system for creating new content types, and that's where this project best fit the concept of a CMS. 

The "Hierarchy" portion of the name was to reflect the data structure that most typically represents user profiles and the data that is related to them. 

At the top of the hierarchy is the user's login, and below that top level would be the personas that belong to the login, and each persona might have a friend list, posts etc. 

The data ultimately ends up having a hierarchical organization with the user's login being the top node, and the rest of the user's content being descendants that branch off the top node. 

The more common term used to describe this type of data representation / organization is the term "Graph", so the project could have also been called GraphCMS. 

## What Features did it Come With?

At launch it came with the following features

1. Real-Time messaging.
2. The ability to create multiple personalities under a parent account. 
3. A rudimentary content type creator. 
4. Example Album content type for housing videos and photos (with content entry and display screens). 
5. Example Video content type (with content entry and display screens). 
6. Example Photo content type (with content entry and display screens). 
7. Example social media feed showing above content types with appropriate viewers.

## Technology Misfit

While the back-end was developed using a MySQL database, I soon came to the realization that not only was MySQL not a fit to build what is essentially a [graph database](https://en.wikipedia.org/wiki/Graph_database), but also that graph database platforms like [Neo4j](https://neo4j.com/) would be able to serve the need  much more efficiently. 

Using MySQL to store and retrieve graphs also made it difficult to use an ORM framework like Hibernate for the purpose, which forced the creation of an ugly non-standard/framework conformant data access layer. 

Since you are already here, also check out my other project [tguless/neo4j-gtfs](https://github.com/tguless/neo4j-gtfs) for an example application using the [Neo4j](https://neo4j.com/)  graph database. 

Furthermore, without the use of a UI framework like [Model View Presenter](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93presenter), the client side code quickly became unmanageable cluttered and difficult to maintain.  

## Why Did You Stop?

I came to the realization that I would never be able to catch up with social media behemoths with their massive and quickly grown valuations on my own, and I was not ready to quit my day-job and try to build a company with a bunch of investor cash. 

We also had a baby girl coming our way, and my time was better spent building applications for paying customers. 

## Why Was it Mothballed for So Long?

### Docker Not Available Yet To Create Repeatable Environments

The project was mothballed in an unreleased state because without Docker at the time, it was difficult to create simplified installation and deployment instructions of all the service dependencies to distribute among peers for review and co-development. 

### GWT Dependencies not in Maven Repositories

Also, since the application was developed using GWT and as most GWT libraries at the time had not been leveraging centralized repositories like Maven for software distribution, pulling in 3rd party dependencies required a complex set of instructions / scripts to package the right versions of dependencies together.

Even today, I had to mavenize some legacy dependencies and include them with my project to make the packaging of the application as clean as possible. 

## Where Can this Idea Go?

While this code with all its legacy gunk really cannot go very far, the idea behind this project still has potential. 

A community built database schema for various profile associated content types has potential as long as strong moderation workflows a-la-wikipedia can be built-in. 

Using a graph database engine like [Neo4j](https://neo4j.com/) can ensure that the back-end is capable of handling any numbers of entity types and relationships.

## Key Dependencies

### Packaging Help

[steinsag/gwt-maven-example](https://github.com/steinsag/gwt-maven-example) : Great example of how to mavenize GWT projects

### Real Time Messaging (Live Chat)

[EjabberD](https://www.ejabberd.im/) : Server platform to enable real time messaging using XMPP)

[Smack](https://github.com/igniterealtime/Smack) : Talk to EjabberD XMPP server for profile creation)

[EmiteGWT/emite](https://github.com/EmiteGWT/emite) : An XMPP Library for GWT environment to allow real-time messaging among users

[EmiteGWT/hablar](https://github.com/EmiteGWT/hablar) : A GUI front end for Emite

### Security

[SimpleCaptcha Java Library](https://simplecaptcha.sourceforge.net/) (captcha)

### Video

[PHP-FFMpeg](https://github.com/PHP-FFMpeg/PHP-FFMpeg) : API used for getting metadata of video files

[php-java-bridge](https://sourceforge.net/projects/php-java-bridge/) : Java bridge to invoke the php-ffmpeg API

[Letractively/gwt-html5-video](https://github.com/Letractively/gwt-html5-video) : A browser agnostic video playback widget for GWT

### Multi File Uploads

[gwt-fileapi](https://code.google.com/archive/p/gwt-fileapi/) : File upload GWT widget which supports multi-file uploads

[swfupload-gwt](https://code.google.com/archive/p/swfupload-gwt/) : Fallback for non HTML 5 browsers - this is legacy junk that can be removed since legacy browsers lost users / reached EOL and since Adobe Flash reached End Of Life. 

### GUI

[Sencha GXT](https://www.sencha.com/products/gxt/) : Enabled a rich GUI experience similar to full desktop apps of the time using the legacy gxt-2.2.4-gwt22 library. 

Running via Maven in GWT Dev Mode
---------------------------------

### Prerequisites

#### Maven

Download and install maven

#### JDK 8

Only tested with Oracle JDK 8 to date

#### GWT 2.5.1

I have not had a chance to port this beyond GWT 2.5.1

#### gxt-2.2.4-gwt22 Downloaded

You need to download and install gxt-2.2.4-gwt22.jar into a local maven repo.  

This is the cleanest way to handle jar dependencies that cannot be found on any maven code repository. 

Note: On windows, below commands are best run in Cygwin with wget and unzip packages installed. 

```
cd WebApp-Maven
mkdir jars
cd jars
wget http://www.java2s.com/Code/JarDownload/gxt/gxt-2.2.4-gwt22.jar.zip
unzip gxt-2.2.4-gwt22.jar.zip
rm gxt-2.2.4-gwt22.jar.zip
cd ..
mkdir local-maven-repo
sh ./regiser-jars.sh
```

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

