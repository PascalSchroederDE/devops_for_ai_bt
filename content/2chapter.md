# Theory {#sec:theory}

In this chapter the theoretical basics, that are needed for creating DevOps principles for AI, will be given. For that it will be started with an explanation of what DevOps is in general. Then it will be shown, which new possibilites came with Cloud and 12-factor-apps in chapter \ref{sec:ms12}. After that the basics of Machine Learning and AI will be given in chapter \ref{sec:ml}, specializing on the lifecycle of AI development in chapter \ref{sec:aicycle}. Last in chapter \ref{sec:devopsai} all these knowledges will be combined to adopt the DevOps principles explained in chapter \ref{sec:devops} to the new world of AI with the help of new Cloud technologies.

## Development Operations principles {#sec:devops}

Since people started manufacturing products on a mass scale, the goal is to increase the efficiency of this manufacturing process and reduce waste of time and material. 

One early set of best pracitces for manufacturing was the concept of "Lean manufacturing", which tries to reduce the waste of ressources and time of a production cycle as much as possible. With the upcoming use of Software as commercial product in the 1970s [@wikipedia] a desire came on to create best practices for developing and operating products the same way as it was already usual in common manufacturing. [@leanmanufacturing]

In 2009 two Flickr employees - John Allspaw and Paul Hammond, presented their way of combining Development and Operations. Inspired by this presentation a belgian consultant named Patrick Debois formed a new conference - the "Devopsday" in Ghent. This is how the term "DevOps" has been created and prevailed. [@devops.com]

Since then DevOps has been established or at least planned in 91% of all companies as an important way to increase their efficiency of Software development. [@statista] For almost every stage of development there are principles and practices defined and continiuously improved. But before those practices will be explained, a further insight in the business need will be given.

Every process or product need a business value that cover the costs caused by it. For that there must be either an outcome for the customer or reduced producing costs.

For DevOps it is usually even both - on the one hand an enhanced customer experience can be guaranteed and on the other hand the efficiency of the production cycle can be increased.

One example for an enhanced customer experience are practices to get fast feedback from all stakeholders. This feedback can then be used to improve the designed product. One of such practices is the so called "A-B testing". There two different sets of features are enrolled to two groups of randomly chosen users. Both can give their feedback to the producer and the set with the better feedback will then later be enrolled for every user. 

The efficiency can be increased through reduced waste and rework because of practices to write reusable components. Another example are tools for planning a product or fast ways to deliver a product without the need to redeploy everything step by step. In this chapter the advantages of DevOps will be delighted in more detail and some of the practices will be described and explained.

The DevOps movement is generally based on four principles. The first one is to develop and test against production like systemt to move operations concerns earlier in the life cycle. The purpose of this is to see how th esystem behaves and performs before it gets deployed. This is also advantageous from an operations perspective, because it can be seen, how the system behaves when it supports the application. 

The second principle is to deploy with repeatable and reliable processes. The objective is to create a delivery pipeline, that enables continuous, automated deployment and testing of the product.

Third, it is important to monitor and validate operational quality. This means, that applications and systems should not only be monitored in production, but already earlier. This forces automated testing to be done early and often to monitor the application. Metrics should alwways be captured and analyzed to provide an early warning system about potential issues and risks.

The last principle is to amplify feedback loops with the goal to enable a quick reaction to issues. For this organizations need to create a communication channel to its users, so that they can give feedback and the developers can react to it accordingly.

The DevOps practices, that have become commonplace, can be splitted in four different sets based on the different periods of a product lifecycle. To each set there are several pracices, standards and tools available, which help to achieve the best possible result. The four different sets and some example practices can be seen in figure \ref{}. 

The first set is called "Steer", which is about managing and planning the development and lifecycle of a product. This includes establishing and continuously adjusting business goals. The process resolving this issue is called "Continuous Business Planning". 

This includes three major points - the acceleration of software delivery, a good balance between speed, cost, quality and risk and the reduction of the time it needs to get customer feedback. [@ibmsummit] 

This is mainly done via tools and practices to track the status, feedback and needs of a project in an efficient way. First, a vision of the projects overall objective should be created and every action should be guided by it. [@ibmsummit]

The strategy, which should lead to this vision, has to be monitored and agjusted continiuously based on new information and feedbacks. This is called continuous improvment. For that a good dialog between a Business and IT is necessary for defining good scopes and priorities. [@ibmsummit]

Then a good plan can be built,for example with a release roadmap, which determines which feature should be completed at what time. This is called release planning and helps to track the progress of the project and makes it easier to react on new trends, feedback or issues and adjust the single steps based on this. The status of each release as well as each single feature has to be continuously tracked, so that risks will be recognized as early as possible to increase the available time to react. [@ibmsummit]

The second set of practices is for the time of development and testing. Two eminent practices for this are collaborative development and continuous testing.

Collaborative development enables different practictioners - architects as well as analysts, developers, specialists etc. - to work together on one project. For that it provides a common set of practices and a common platform to create and deliver the software. 

One core capability is a practice called continuous integration, in which developers continuously or frequently integrate their work with the other developers. For that a shared platform or repository is necessary, on which the developers can frequently commit their changes in the code. Usually this is done using a version control system like Git. 

Also the application should be tested and verified continuously. For that the developer can run local unit tests to verify their changes before integrating. But this doesn't verify that the integrated code performs as designed. [@AWSCI] A continous integration service linke Jenkins can relieve the developer of this task and automatically builds and runs unit tests on the newly commited and integrated code. [@Jenkins] This process is called continuous testing.

Another important point is to shorten the delivery cycles through an end-to-end integration, so that it needs less time to enroll a new feature or similar. This leads to quickly given feedback and enables a faster reaction to this. [@ibmsummit] This is done in the Deployment stage of a product lifecycle and one of the root capabilities of DevOps. It deals with the automation of the deployment of the software to the different environments, which is called continuous delivery. 

After the deployment follows the Operation. During this stage the performance of an application should be montoried and feedback should be collected. The results of this should be used to improve the product as well as other products, that will be developed in the future. For this there are two practices defined - continuous monitoring and continuous feedback and optimization. 

Continuous monitoring provides data and metrics to the performance of an application as well as its running server, the development cycle, the production and other stakeholders.

Continuous feedback on the other hand provides data coming directly from the customer. This includes the behavior how they are using the system as well as feedback that the users provide.

Based on those retrieved data businesses may adjust their plans and priorities, improve the development cycle and features and enhance the environment in which the application is deployed in a more agile and responsive way. The objective of this is to improve the product and satisfy the users as well as use this knowledge for new products, that will be developed in the future.

IaaC

The most important technology for DevOps may be a Delivery pipeline. A delivery pipeline controls the product cycle of an application from development to production. Typically there are four or more stages - development, test, stage and production. 

For every stage there is usually one specific environment. In the development environment all the code updates are being done. There are tools provided like \acs{IDE}s (\acl{IDE}) to write the code as well as tools that enable collaborative development like source control management or project planning.

Source control management is typically combined with version control. This enables the developer to also store previous versions of his application and reduces the risk of issues in new updates, because it can roll them back in case of an error.[@overops]

After the development the delivery pipeline must care for the application to be built.

Second there is the testing environment, in which single components can be tested. For that it has to manage test data, scenarios, scripts and associated results. Similar to the development environment it must not look like the production environment. 
 
The next one is the staging environment, in which the system can be tested as a whole. The staging environment should be as much production like as possible, so that as many as possible required services, databases and configurations can be connected and applied without touching the production environment. The stage environment is for testing the application before rolling out a major update. 
 
The last one is the production environment, in which the application will be running live and accessible for the users. [@devto][@plesk]
 
The delivery pipeline consists out of all those stages and manages an automated transition from one stage to the next one.
 
For this deployment automation tools are necessary, which perform the deployments and track which version is deployed on which node. It also manages changes that need to be performed for the middleware components and configurations as well as database components or the environment. 

Last there should also be a tool for release management, which provides a single collabiration portal for all stakeholders participating in a project to plan and track the releases of an application and its components across all stages. 

With such technologies most of the defined practices can be performed with the help of accordingly educated people and well thought-out processes. But DevOps is no static set of practices and tools, but it changes with the changes in the world IT, such as Cloud or AI. In the next chapters these technologies will be reflected and the impact those have on DevOps will be analyzed.

[//]: # (Figures, sources?, abbreviations?)

[//]: # (https://en.wikipedia.org/wiki/Commercial_software#cite_note-5)
[//]: # (https://www.statista.com/statistics/673505/worldwide-software-development-survey-devops-adoption/)
[//]: # (https://devops.com/the-origins-of-devops-whats-in-a-name/)
[//]: # (https://dev.to/flippedcoding/difference-between-development-stage-and-production-d0p)
[//]: # (https://www.plesk.com/blog/product-technology/staging-environment-vs-test-environment/)
[//]: # (https://blog.overops.com/3-reasons-why-version-control-is-a-must-for-every-devops-team/)
[//]: # (IBM Tech Summit)
[//]: # (https://aws.amazon.com/devops/continuous-integration/)
[//]: # (https://blog.overops.com/3-reasons-why-version-control-is-a-must-for-every-devops-team/)

## Microservices and 12 factor apps {#sec:ms12}

## Machine Learning {#sec:ml}

## Artificial Intelligence lifecycle {#sec:aicycle}

## DevOps for Artificial Intelligence {#sec:devopsai}
