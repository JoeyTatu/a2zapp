BSc (Honours) in Computing

Cloud Application Development Project


Project Overview
This document outlines the project to be completed for the Cloud Application Development module.
The project accounts for 100% of the module mark. The repeat strategy for the module is to
complete a repeat project.

Description
You are required to design, develop and deploy a Software as a Service Application using a web
application framework and suitable design patterns. The application should be an information
management system and be implemented using Rails and have the following functionality:

• different account types with relationships between accounts, for example if we had a Healthcare
application, a Doctor could have multiple patients (this should be modelled appropriately in
rails). The application should demonstrate different roles within its functionality.

• users should be able to add, edit and view records within the system

• the application should consume at least two external data feeds to enhance its core functionality,
for example if the application was a news application you could consume information for
multiple social media sites and create a unique experience through your application. This is
typically referred to as a mashup application

• an integrated search functionality should be included

• the application should be deployed to a suitable Platform as a Service. The deployed platform
should be justified within the supporting documentation.

• the application should be constructed using suitable design patterns and custom Ruby Gems

NOTE: The demonstration of your project is a requirement to pass the
module, failure to demonstrate your project will result in a mark of zero
being awarded for the module. 

Deliverables

You have to submit the following deliverables through Moodle:
Source code of the application (the source code should contain comments to demonstrate your
understanding of the code)

Documentation for the project identifying the strategy that was implemented for the completion of
the project. To document your project use the project report template available on Moodle.
In addition you are required to:

Demonstration: present your project on the scheduled presentation day

Requirements and Assessment Criteria

15%: Documentation for the project identifying the strategy that was implemented to complete
the project. Use the project report template available on Moodle named “Project Report
Template”.

10%: Awarded for the successful deployment of your application to a suitable Cloud Platform as
a Service, for example Heroku. An analysis of the deployed application should be completed
against the local version.

10%: The User Interface/ Views of your application. You should demonstrate effective use of the
Rails framework for example using partials, layouts, bootstrap…etc.

45%: Awarded for the application requirements implementation
• 35%: for the required functionalities
- 6%: The database architecture must be created using rake and running database migrations
(i.e. you cannot import a database into the application). Evidence must exist for validations,
relationships between multiple models…etc.
- 30%: Allows a user to add a record, offers a user a profile (managed through a separate
model), allows search functionality. You are required to use at least one external GEM to
construct this functionality. You should demonstrate effective use of Cookies and Sessions
to persist data and consume two external sources of data
- 9%: for documented use of a Test Driven Development process followed through your project
to highlight Unit, Functional and Integration testing throughout the lifespan of the project.

10%: for implementing two appropriate design patterns in your application

10%: Building of suitable custom GEM incorporated into your project that performs a key part
of the functionality, for example a GEM showing the time or a simple conditional statement will
receive a mark of zero