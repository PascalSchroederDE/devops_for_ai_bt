# Theory - DevOps, Cloud and Machine Learning {#sec:theory}

In this chapter, the theoretical basis, that is needed for creating DevOps principles for AI, will be explained. For that, it will be started with an explanation of DevOps in general. Then it will be shown, which new possibilities came with Cloud and Microservices in chapter \ref{sec:ms12}. After that, the basics of Machine Learning and AI will be delighted in chapter \ref{sec:ml}, specializing on the lifecycle of AI development in chapter \ref{sec:aicycle}. In chapter \ref{sec:devopsai}, this knowledge will be combined to adapt the DevOps principles explained in chapter \ref{sec:devops} to the new era of AI with the help of Cloud technologies.

## DevOps - Development Operations {#sec:devops}

Since the development of software producsts became a commercial field for companies, there has been a continuous effort to improve the quality and efficiency of a product development. One important point of this is to combine the different fields of a products lifecycle for a better coordination. In 2009 two Flickr employees - John Allspaw and Paul Hammond - presented their way of combining Development and Operations. Inspired by this presentation, a Belgian consultant named Patrick Debois formed a new conference - the "Devopsday" in Ghent. This naming is how the term "DevOps" has been created and prevailed. [@SteveMezak]

Since then, DevOps has been established or at least planned in 91% of all companies as an essential way to increase their efficiency of software development. [@SauceLabs] For almost every stage of development, there are principles and practices defined and continuously improved. Among a lot of good literature the book "DevOps for Dummies" by Sanjeev Sharma and Bernie Coyne stood out, which is why this chapter is based to a great extent on knowledge gained from this book. [@Sharma2017]

Before starting to describe the single principles and practices leading to the fulfilling of these objectives, the term DevOps needs to be defined. For this Len Bass, Ingo Weber, and Liming Zhu defined DevOps as follows: [@BassWeberZhu15]

\begin{definition}
DevOps is a set of practices intended to reduce the time between committing a change to a system and the change being placed into normal production, while ensuring high quality.
\end{definition}

Following this definition, every process or product need a business value that covers the costs caused by it. For that, there must be either an outcome for the customer or reduced producing costs.

For DevOps, it is usually even both - on the one hand, enhanced customer experience can be guaranteed, and on the other hand, the efficiency of the production cycle can be increased. An example of enhanced customer experience are practices to get fast feedback from all stakeholders. [@Sharma2017, 3-6]

The efficiency can be increased through reduced waste and rework through practices to write reusable components. Other examples are tools for planning a product or fast ways to deliver a product without the need to redeploy everything step by step. In this chapter, the advantages of DevOps will be delighted in more detail, and some of the practices will be described and explained.

### Principles

The DevOps movement is generally based on four principles. The first one is to *develop and test against production-like systems* to move operations concerns earlier in the life cycle. The purpose of this is to see how the system behaves and performs before it gets deployed. This is also advantageous from an operations perspective, because it can be seen, how the system behaves when it supports the application. [@Sharma2017, 6f]

The second principle is to *deploy with repeatable and reliable processes*. The objective is to create a delivery pipeline, that enables continuous, automated deployment and testing of the product. [@Sharma2017, 7]

Third, it is crucial to *monitor and validate operational quality.* This means that applications and systems should not only be monitored in production, but already earlier. This forces automated testing to be done early and often to monitor the application. Metrics should always be captured and analyzed to provide an early warning system about potential issues and risks. [@Sharma2017, 8]

The last principle is to *amplify feedback loops* intending to enable a quick reaction to issues. For this, organizations need to create a communication channel to their users, so that they can give feedback, and the developers can react to it accordingly. [@Sharma2017, 8]

### Practices

The DevOps practices that have become commonplace can be split into four different sets based on the different periods of a product lifecycle. To each set, there are several practices, standards, and tools available, which help to achieve the best possible result. The four different sets and some example practices can be seen in figure \ref{fig:devops_architecture}.

The first set is called **Steer**, which is about managing and planning the development and lifecycle of a product. This set includes establishing and continuously adjusting business goals. The process of resolving this issue is called *Continuous Business Planning*. [@Sharma2017, 10f]

This practice includes three major points - the acceleration of software delivery, a good balance between speed, cost, quality and risk, and the reduction of the time it needs to get customer feedback. [@IBM2013] 

These points are mainly fulfilled via tools and practices to track the status, feedback, and needs of a project efficiently. First, a vision of the projects overall objective should be created, and every action should be guided by it. [@IBM2013]

![DevOps reference architecture[@Sharma2017, 10]](images/chapter2/devops_architecture.png){ width=400px #fig:devops_architecture}

The strategy, which should lead to this vision, has to be monitored and adjusted continuously based on new information and feedback. This procedure is called *continuous improvement*. For that, a good dialog between a Business and IT is necessary for defining good scopes and priorities. [@IBM2013]

Then a good plan can be built, for example with a release roadmap, which determines which feature should be completed at what time. This approach is called *release planning* and helps to track the progress of the project and makes it easier to react on new trends, feedback or issues and adjust the single steps based on this. The status of each release, as well as every single feature, has to be continuously tracked so that risks will be recognized as early as possible to increase the available time to react. [@IBM2013]

The second set of practices is for the time of **development and testing**. Two eminent practices for this are *collaborative development* and *continuous testing*. [@Sharma2017, 11ff]

*Collaborative development* enables different practitioners - architects as well as analysts, developers, specialists, and other participants - to work together on one project. For that, it provides a standard set of practices and a common platform to create and deliver the software. [@Sharma2017, 11]

One core capability is a practice called *continuous integration*, in which developers continuously or frequently integrate their work with the other developers. For that, a shared platform or repository is necessary, on which the developers can frequently commit their changes in the code. [@Sharma2017, 12] Often, this is done using a version control system like Git, which does not only enable version controlling and continuous integration, but supports almost the whole operation lifecycle, which is known as *GitOps*. *GitOps* is a special kind of DevOps and starts with a Collaboration platform like Github to enable a group of people to work together. It also enables version controlling and continuous integration. For that the project is split into several branches, on which code changes can be commited. On the master branch those will then be integrated. This master branch can then serve as trigger for a delivery pipeline, which compiles the code and moves it to the deployment environment, for example a Kubernetes cluster. [@AlexisRichardson]

Additionally, the application should be tested and verified continuously. For that, the developer can run local unit tests to verify their changes before integrating. Unit tests test a specific component with defined input and output and checks if the calculated output is the expected one. This does not verify that the integrated code performs as designed. [@AmazonDocumentation] A continuous integration service like Jenkins can relieve the developer of this task and automatically builds and runs unit tests on the newly committed and integrated code. In doing so, it runs not only unit tests, but also integration tests, which test the software as a whole. This process is called *continuous testing*. [@Sharma2017, 13]

Another critical point is to shorten the delivery cycles through an end-to-end integration so that it needs less time to enroll a new feature or similar. This method leads to quickly given feedback and enables a faster reaction to this. [@IBM2013] This approach takes place in the **Deployment** stage of a product lifecycle and one of the root capabilities of DevOps. It deals with the automation of the deployment of the software to the different environments, which is called *continuous delivery*. [@Sharma2017, 13]

After the deployment follows the **Operation**. During this stage, the performance of an application should be monitored, and feedback should be collected. The results of this should be used to improve the product as well as other products, that will be developed in the future. For this, there are two practices defined - *continuous monitoring* and *continuous feedback and optimization*. [@Sharma2017, 14]

*Continuous monitoring* provides data and metrics to the performance of an application as well as its running server, the development cycle, the production, and other stakeholders. [@Sharma2017, 14]

*Continuous feedback*, on the other hand, provides data coming directly from the customer. This data includes the behavior of the users, which is then analyzed, as well as feedback provided by them. [@Sharma2017, 14]

Based on those retrieved data, businesses may adjust their plans and priorities, improve the development cycle and features, and enhance the environment in which the application is deployed in a more agile and responsive way. The objective of this is to improve the products speed and quality. Additionally, this knowledge should be used for new products, that will be developed in the future.

### Technologies

One technology to enable developers to implement above practices is **Infrastructure as code**, which enables organizations to deploy their environments faster and on a larger scale. This technology is implemented with machine-readable definitions and configurations. Based on them, the machine can provide the necessary environment automatically to enable continuous delivery. [@Sharma2017, 25]

Another important technology for DevOps are **delivery pipelines**. A delivery pipeline controls the product cycle of an application from development to production. Typically there are four or more stages - development, test, stage, and production. This can be seen in figure \ref{fig:del_pipeline}. [@Sharma2017, 26ff]

For every stage, there is usually one specific environment. Those are represented as a box. The two boxes on the right half represent a production-like environment.

![Delivery pipeline[@Sharma2017, 26ff]](images/chapter2/delivery_pipeline.png){ width=400px #fig:del_pipeline}

In the development environment, all the code updates are being done. There are tools provided like \acs{IDE}s (\acl{IDE}) to write the code as well as tools that enable collaborative development like source control management or project planning. [@Sharma2017, 26]

Source control management is typically combined with version control. This enables the developer also to store previous versions of his application and reduces the risk of issues in new updates because it can roll them back in case of an error.[@TaliSoroker]

After the development, the delivery pipeline must take care for the application to be built.

Second, there is the testing environment, in which single components can be tested. For that, it has to manage test data, scenarios, scripts, and associated results. Similar to the development environment, it must not look like the production environment. [@Sharma2017, 27] 

The third is the staging environment, in which the system can be tested as a whole. The staging environment should be as much production-like as possible so that as many required services, databases, and configurations as possible can be connected and applied without touching the production environment. The stage environment is for testing the application before rolling out a major update. [@MileciaMcG][@Debbie][@Sharma2017, 28]

The last one is the production environment, in which the application will be running live and accessible for the users. [@Sharma2017, 28]

The delivery pipeline consists of all those stages and manages an automated transition from one stage to the next one starting directly after the development.

For this deployment automation tools are necessary, which perform the deployments and track which version is deployed on which node. It also manages changes that need to be performed for the middleware components and configurations as well as database components or the environment. 

Also, a tool for **release management** is mandatory, which provides a single collaboration portal for all stakeholders participating in a project to plan and track the releases of an application and its components across all stages. [@Sharma2017, 28f]

With such technologies, most of the defined practices can be performed with the help of accordingly educated people and well-thought-out processes. DevOps is no static set of practices and tools, but it changes with the changes in the IT, such as Cloud or AI. In the next chapters, these technologies will be reflected, and the impact those have on DevOps will be analyzed.

[//]: # "Figures, sources?, abbreviations?"

[//]: # "https://en.wikipedia.org/wiki/Commercial_software#cite_note-5"
[//]: # "https://www.statista.com/statistics/673505/worldwide-software-development-survey-devops-adoption/"
[//]: # "https://devops.com/the-origins-of-devops-whats-in-a-name/"
[//]: # "https://dev.to/flippedcoding/difference-between-development-stage-and-production-d0p"
[//]: # "https://www.plesk.com/blog/product-technology/staging-environment-vs-test-environment/"
[//]: # "https://blog.overops.com/3-reasons-why-version-control-is-a-must-for-every-devops-team/"
[//]: # "IBM Tech Summit"
[//]: # "https://aws.amazon.com/devops/continuous-integration/"

## Microservices and 12 factor apps {#sec:ms12}

As described in chapter \ref{sec:cloud} Cloud opened new possibilities of deploying and maintaining software. This eases the deployment itself as well as rolling updates without any downtime. Additionally, it enables high scalability as well as high availability.

One model of Cloud Computing is \acl{SaaS} (\acs{SaaS}). In this model, an application is deployed on the provider's platform and is accessible via the internet on demand. This way, the end-user can access the software from anywhere anytime. In doing so, there is no need to deploy, install, or maintain anything. The user has to pay-per-use, which means that he only pays for the resources, which he has claimed. [@Kumar2014]

The development and deployment of portable, resilient applications that will thrive in Cloud environments are different from traditional development. Because monolithic applications need to be rebuilt entirely as soon as one component is being changed, the development is unflexible. Additionally, the scaling of a single component needs a scaling of the whole application. Both are disadvantages which are opposed to the new possibilities a Cloud deployment offers. The solution was to build those applications not as one monolithic software but as a suit of services.

### Microservice Architecture

For that, the term Microservice Architecture has developed over the last few years. There is no unique definition for it, but, when talking about Microservice Architecture, mostly, it is referred to Martin Fowler's characteristics described in [@MartinFowler].

Following Fowler, the first characteristic is, that componentization is realized via services. In monolithic software, different components are linked together via libraries. Services on the other side are out-of-process components. The communication is realized with web service requests or remote procedure calls. The advantage of this approach is that they are independently deployable.

A second characteristic is that Microservices are organized around business capabilities. This means that the services take a broad-stack implementation of software for that business era. This also leads to cross-functional teams, which are working together on building the Microservice. 

Additionally, Microservices are handled as products instead of projects. The difference is, that while products are supported and owned by the product team over its full lifetime, projects are not. They are completed as soon as a specified set of functionalities is implemented. After that, an independent operation team would support those projects. The approach to treat Microservices as products has the advantage, that the development team has full responsibility for it and are probably more interested in a clean, well functioning long-term solution.

Another characteristic is the use of smart endpoints and dumb pipes, which means that the services are as decoupled as possible. The only way they stick together is that they receive requests of each other and produce responses after applying the defined logic. This communication is handled via simple \acs{REST}ish (\acl{REST} protocols.

Also, the governance of Microservices is usually decentralized so that every service can be built on different technology platforms, and there is a different approach to standards. This decentralization leads to a more flexible environment.

The same applies to data management, which is decentralized as well. Each service can manage its database, which avoids problems through different conceptual models. While in centralized data management changes are usually made via transactions, in a decentralized data management system, there is transactionless coordination between the services. This does not necessarily result in consistency, but this cost is less than the cost, that would come up if a consistency would be forced to Microservices by distributed transactions. Instead, the problems this eventual consistency could cause are dealt with by compensating operations.

The next characteristic is the automation of the infrastructure. This includes automated testing and deployment. It is essential to test every single Microservice intensively because the operational landscape for each can be strikingly different. Also, the deployment could differ from service to service.

Important for Microservices is that they are designed for failure. This means that it detects failures quickly and automatically restore it in case an error happens. This approach demands real-time monitoring.

The last characteristic defined by Fowler is the evolutionary design. This design enables a more granular release planning because every change can be handled as a single and only modified services needs to be redeployed. These changes should not affect the communication with other services, which is the reason why they should always be designed as tolerant as possible. 

The advantage of those Microservices for Cloud applications is mainly caused by possibilities to treat every component as a single. This improves the scalability, productivity, and the speed of the application as well as the development. This is caused by the faster way of developing such independent services. Additionally, it is easier to maintain services instead of a monolith application, and it gives more flexibility in technologies. Still, the development of Microservices should follow some guidelines to support the concept of independently managed and iterated services.

### 12 factor apps

One standard set of guidelines and best practices for the development of Cloud-based software and especially Microservices are the 12 factors drafted by developers at Heroku. These factors are [@Wiggins]

- Codebase - For every deployed service there should be precisely one codebase, for example, an IT repository
- Dependency - Services should explicitly declare and isolate all dependencies 
- Config - Configurations for the deployments should be stored in the environment
- Backing services - All backing services should be treated as attached resources
- Build, release, run - The delivery pipeline should be strictly separated into building, releasing and running
- Processes - Apps should be executed in one or more stateless process
- Port binding - Services should be exposed by listening on a specific port
- Concurrency - Concurrency is achieved by horizontal scaling
- Disposability - The objective should be a robust and resilient system with fast startup and graceful shutdown
- Dev/prod parity - The development, staging, production and every other environment should be as similar as possible
- Logs - Applications should produce logs as event streams
- Admin processes - Admin tasks should be packaged alongside the application to ensure that it is run with the same environment

Following these guidelines, stable and performant Microservices can be built. In the last years, some technologies have emerged as particularly suitable for developing such services.

### Container

Such a technology is containerization of applications. Following techterms.com, a container is defined as follows: [@Techterms.com]

\begin{definition}
A container is a software package that contains everything the software needs to run. This includes the executable program as well as system tools, libraries, and settings. Containers are not installed like traditional software programs, which allows them to be isolated from the other software and the operating system itself.
\end{definition}

For this an open standard - Open Container Initiative - has been developed, which is implemented by most leaders of the container industry. This technology can be understood as a package for the isolation of applications within a closed environment, which provides everything the application needs. It is comparable to a \acs{VM} (\acl{VM}), but much more light-weighted. [@Jerry2015] This enables a light deployment without unnecessary services or applications running in the background, which leads to a very performant execution.

Exemplary container engine technologies are Docker or OpenShift Container Platform. In figure \ref{fig:docker_vm} the differences between such container engines and a VM can be seen.

On the left side of that figure, the infrastructure of a VM can be seen, on the right side, the infrastructure of container engines. Both need the infrastructure of a physical device and its operating system. If using a VM, there is a Hypervisor on top of the Host Operating System. On this Hypervisor several Guest OS can be running. Seperated resources are assigned to every single VM. The Guest OSs on the VMs can then be used as usual systems and libraries and applications can be started and hosted on this OS. For this only the assigned resources can be used.

![Comparison between container and a VM[@Twistlock]](images/chapter2/docker_vm.png){ width=500px #fig:docker_vm}

In case of container engines there is the container engine itself running on top of the Operating system. The task of those engines is listening and processing API requests from the client, managing objects, e.g. the containers or volumes, and building the images. 

The containers are running on top of the OS as well and are coordinated by the container engine. The difference is, that the containers are sharing the resources of the OS. Every container can access every binary and library it needs. Every single piece of a container has an own layer. These layers can be shared among the containers. The apps to be executed are then running inside of those containers.  For this the containers are able to directly access the resources of the system OS. [@DockerDocumentation] [@Lipke2017]

With this technology, several of the 12 factors described above are fulfilled. One factor is the explicitly declared and isolated dependency management. Within the files, with which the containers are defined, every dependency needs to be explicitly declared to fulfill all the requirements of the application. [@NoahZoschke]

For security reasons containers are strictly seperated cannot communicate with each other directly but need to communicate externally with backing services over the network [@NoahZoschke]

Additionally, containers are executed as stateless processes with ephemeral storage only.  [@NoahZoschke]

The development and production parity is given because containers standardize the way of delivering applications as well as its dependencies. [@NoahZoschke]

Admin processes can be run as one-off processes inside the container engine through jumping inside the container and executing all necessary commands.

Still, in a local environment, not each of the 12 factors is fulfilled. Instead, an enabler is needed, which offers a scalable and failure safe way to deploy those containers.

### Kubernetes as an enabler

Kubernetes can serve as such an enabler. Kubernetes was originally developed by Google and evolved out of Project Borg. Borg is a cluster management system, that schedules, starts and monitors applications within a cluster. [@43438] Kubernetes has been built based on knowledge and experiences with Borg and has been open sourced in 2014. [@Lardinois] It has been designed to host Microservices as containers and ensures all of the 12 factors to be met.

In general, Kubernetes is a management platform. It enables an automated deployment, scaling, and management of containers within a cluster of nodes. Thereby a cluster consists of at least one master node and any number of worker nodes. Figure \ref{fig:kubernetes_services} shows the different services owned by master and worker nodes.

![Kubernetes service allocation[@Fricke]](images/chapter2/kubernetes.png){ width=500px #fig:kubernetes_services}

Pods are the smallest unit in Kubernetes. They contain one or more containers, which are deployed together on the same host. There they can work together to perform a set of tasks. [@CoreOS]

On the master node, there are an \acs{API} (\acl{API}) Server, a Controller Manager, a Scheduler and a key-value store like etcd. [@Fricke][@JorgeAcetozi]

The API Server is for clients to run their requests against it. That means the API Server is responsible for the communication between Master and Worker nodes and for updating corresponding objects in the key-value store. [@Fricke][@JorgeAcetozi]

The Controller Manager is a daemon, which embeds all of the Kubernetes controllers. Examples for them are the Replication Controller or the Endpoint Controller. Those controllers are watching the state of the cluster through the API Server. Whenever a specific action happens, it performs the necessary actions to hold the current state or to move the cluster towards the desired state. [@Fricke][@JorgeAcetozi]

The scheduler manages the binding of pods to nodes. Therefore it watches for new deployments as well as for old ones to create new pods if a new deployment is created or recreating a pod whenever a pod gets destroyed. The scheduler organizes the allocation of the pods within the cluster based on available resources. [@Fricke][@JorgeAcetozi]

The key-value store stores the configuration data and the condition of the Kubernetes cluster. [@Fricke][@JorgeAcetozi]

The worker node consists of a Kubelet, a cAdvisor, a Kube-Proxy and - as mentioned before - several Pods. 

The Kubelet needs to be used if a new pod should be deployed. Then it gets the action to create all needed containers. For that, it uses a container engine like Docker to create them. Afterward, it combines some containers into one pod. Containers in one pod are always started and stopped together. This pod will then be deployed on the node, on which the Kubelet is located. [@Fricke][@JorgeAcetozi]

The cAdvisor measures the usage of CPU-resources as well as demanded memory on its node. That information is forwarded to the master node. Based on those measurements, the scheduler allocates the pods within the cluster to ensure the best possible allocation of resources. [@Fricke][@JorgeAcetozi]

The kube-proxy is a daemon that runs as a simple network proxy to provide the possibility of communicating to that node within the cluster.[@Fricke][@JorgeAcetozi]

With this architecture, Kubernetes enables all the factors that are missing in a local deployment of containers.

First, the codebase of the deployment is given as YAML or JSON file and the container in another file, which format is dependent on the used container engine. For Docker for example this file is called a Dockerfile. This way, source control of all the necessary code can be done using git, for example. [@MichaelD.Elder]

Also, the dependencies for one Microservice can be checked easily with the functions *readinessProbe* and *livenessProbe*. While the *readinessProbe* tests whether there are backing services, the *livenessProbe* tests if the backing services are all healthy. In case of a missing or failed Microservice, the appropriate pod is automatically restarted. [@MichaelD.Elder]

For storing all the necessary configurations in the process environment table, Kubernetes provides ConfigMaps. With these, the containers can retrieve the config details at runtime. [@MichaelD.Elder]

Stage separation is achieved through artifact management. Once the code is committed, a build occurs, and the container image is built and published to an image registry. These releases are then deployed across multiple environments. [@MichaelD.Elder]

The port binding is guaranteed through Kubernetes services. These are objects to declare the network endpoints of a service and resolve endpoints of other services specified to a port of the cluster. [@MichaelD.Elder]

The concurrency is a factor, which is handled especially extensively. It allows the services to scale at runtime depending on the replica sets defined in the declarative model. Also, Kubernetes has introduced autoscaling based on compute resource thresholds. [@MichaelD.Elder]

Also, disposability is fulfilled because every pod can be destroyed or started quickly. Additionally, Kubernetes will automatically destroy unhealthy pods. [@MichaelD.Elder]

Last, logs are written to *stdout* and *stderr*  and can be easily accessed. They are not stored and managed as internal files. [@MichaelD.Elder]

This way, a container engine like Docker and Kubernetes are fulfilling each of the 12-factors, which shows that it is an excellent way to provide Microservices. This is the reason why many big companies decided to use Kubernetes as an enabler for big platforms like Google Cloud to give just one example.

## Machine Learning {#sec:ml}

Machine Learning evolves as another leading technology in IT as big players focus their work more and more on AI. For example, IBM announced the *Cognitive Era* and Google changed its focus from *Mobile First* to *AI first* a few years ago. This helped AI to a new hype and opened several new possibilities and improvements to software development. Because of the exponential growth of computation power and data, Machine Learning has become one of the most important tools when it comes to Artifical Intelligence.

Even tough it is not necessary to know the details of Machine Learning for this work, some insights will be given in this chapter to understandt how and why Machine Learning influences Development and Operation of Software significantly. In doing so, some tasks, that can be handled with ML, as well as the different training approaches will be described before the ML technique of Neural Nets will be introduced. 

First, a general overview of ML needs to be given. The advantage of Machine Learning compared to traditional software development is, that it eliminates the need to write the code by oneself. Instead, the developer enters some input data to the Machine Learning system. This system then figures out mathematical functions, which describes the given collection of data points best. The process of finding these function is called Machine Learning, and the resulting function is mostly referred to as model.

This results in a system, which continuously improves the more data it is fed with because this leads to a more accurate function. Based on this assumption, Tom Mitchell defined Machine Learning in 1997 as follows: [@Mitchell:1997:ML:541177]

\begin{definition}

A computer program is said to learn from experience E with respect to some class of tasks T and performance measure P, if its performance at task in T, as measured by P, improves with experience E. 

\end{definition}

To give one example - the experience Mitchell mentioned can be input data like pictures of trees, with which it gets trained with the task to identify those trees on that picture. If the systems frequency of successfully detected trees increases, the system can be considered as a Machine Learning system.

### Tasks

For fulfilling such a task, it is necessary to define this task before. In the book "Deep Learning" by Ian Goodfellow, Yoshua Bengio, and Aaron Courville this have been done and the definitions below will be based on the definitions from this book. [@Goodfellow-et-al-2016]

In general, tasks are described in terms of how the Machine Learning system should process an example. An example is a collection of quantitative measurements, called features. This set can be written as a vector $x \in \mathbb{R}^n$ with each $x_i$ being one of the features. [@Goodfellow-et-al-2016, 97]

Some of the most important and most common tasks in computer science are [@Goodfellow-et-al-2016, 98-101]

- Classification
- Regression
- Structured Output
- Anomaly detection

In *classification*, the objective is to figure out the category of an example out of a data set by given features. Mathematically this can be described as a function, that takes an example with all its features. Then it assigns a category out of an appropriate set. This set of categories is limited to k so that it can be described as ${1,...,k}$. [@Goodfellow-et-al-2016, 98] This function can be represented as follows:

\begin{equation}\label{eq:classification }
f: \mathbb{R}^n \rightarrow {1, .., k}
\end{equation}

An example of this is character recognition. It gets an image of a character as input. Then, the task is to assign this image to one element of the set of characters.

The objective of a *Regression* is to predict a numeric value by given input data. This can be formulated as [@Goodfellow-et-al-2016, 99]

\begin{equation}\label{eq:regression}
f: \mathbb{R}^n \rightarrow \mathbb{R}
\end{equation}

When the function that has to be learned is of the form $y=f(x)$ with $y \in \mathbb{R}$ and $x \in \mathbb{R}^n$ then $x$ should be a set of independent variables and $y$ should be a dependent variable on $x$. [@Goodfellow-et-al-2016, 99]

An example of a Regression is a prediction of the costs for a new apartment based on features like size, location, and the number of rooms.

*Structured Output* tasks ask a learning algorithm to figure out the probability distribution that has produced the data set. This value is then used to give an estimation of the relationship between single examples from the data set. [@Goodfellow-et-al-2016, 99f]

A well-known example of this is to recommend products based on previously bought products. For that, the learning algorithm figures out the similarity between the products and recommends those with the highest consistency.

*Anomaly detection* works similar to Structured Output, but instead of looking for elements with a great relationship, it uses the probability distribution to check for irregularities within the dataset. [@Goodfellow-et-al-2016, 100]

This is an excellent way to anticipate a fraud in a banking account through checking every transaction and hold back those, which are looking too irregular.

### Training approaches

As mentioned above, in Machine Learning, all those tasks are not solved by explicitly coding algorithms and formulas, but by training a system with given input data. For training those systems, different approaches are existing, each used for different requirements. These approaches have also been explained In the book "Deep Learning". This chapter will be oriented to the according descripitions in this book. [@Goodfellow-et-al-2016]

One approach is called supervised learning. Supervised learning requires an additional value for each example representing the optimal solution for it. Formally the data set can be described as $\mathbb{D} \in 2^{\mathbb{R}^n}$. For every example vector $x \in \mathbb{D}$ there exists a $y \in \mathbb{R}$ such that $y=f(x)$ with $f:\mathbb{R}^n \rightarrow \mathbb{R}$ being the function that describes the task to be learned. This additional feature is mostly referred to as label or target. Usually, the tasks are accomplished by approximating the conditional probability distribution $p(x|y)$. [@Goodfellow-et-al-2016, 103]

Supervised learning algorithms are often used for classification or regression tasks.

Unsupervised learning, on the other hand, does not have any additional features but has to work with the pure, raw data set. Usually, the data points have many features, and the task is to figure out some useful property about the relationship between these data points. This is usually done by using the probability distribution function $p(x)$ of the data set.[@Goodfellow-et-al-2016, 103]

Common tasks for unsupervised learning are clustering or anomaly detection.

In figure \ref{fig:training_comparison}, a comparison between supervised and unsupervised data sets used for clustering and classification can be seen. The data shown is not of a particular use case and just for demonstration purposes. In both representations, the examples of the data set have only two features, one corresponding to the x-axis and the other on the y-axis. The task is to identify clusters in the data . [@AmnahKhatun]

![Comparison of unsupervised and semi supervised data sets used for clustering[@AmnahKhatun]](images/chapter2/training_comparison.png){ width=600px #fig:training_comparison}

The missing labels on the left side force the unsupervised learning algorithm to only use the features $x$ and $y$ and look for similarities to determine its association with a group. In the second example, the algorithm can use the labels as well to determine a function, which assigns a class to every data point. [@AmnahKhatun]

The difference is that some of the data points of the right graph are labeled with either 'Class 1' or 'Class 2'. In the figure, this can be seen by the coloration of the data points. Even though in this example there are only some data points labeled, which is the reason why the applied learning approach is called semi-supervised learning, it is still functioning as an example for supervised learning and demonstrates the differences to the unsupervised model. [@AmnahKhatun]

In the figure on the left side, two clusters can be seen, which are circled in a group. This is done with the unsupervised learning algorithm. On the right side, the supervised learning algorithm calculated a line, which marks the function splitting the dataset into two groups. It is noticeable that the first approach leads to some examples, which cannot be assigned to either of the classes. [@AmnahKhatun]

Additionally, there is another approach called reinforcement learning. In reinforcement learning, a model is built and then iteratively improved by taking in further examples. For that, it needs to get some feedback on how good the built model is. For example, this can be a reward or punishment function. [@Goodfellow-et-al-2016, 104]

### Models {#sec:nnmodels}

With the approaches mentioned above the objective is to create and train a model, with which the tasks can be fulfilled. In modern Machine Learning, the most important type of such models are \acl{ANN}s (\acs{ANN}s).

Neural Networks are inspired by biological neural networks like animal brains. According to that, \acs{ANN}s are based on a collection of nodes called artificial neurons. Each neuron gets one or more input values and one output value. To generate the output value, the neuron does some mathematical computations with the input values. [@Stroetmann2018]

A network of such neurons usually persists out of at least three layers. The first layer is the input layer of the data, with which the neural network should be fed. Those values are then sent to every neuron of the hidden layer. Those are doing the necessary calculations described below and send their output to the output layer. [@Stroetmann2018]

On the hidden layer the neurons are combining the inputs and calculating a new value with them. For that three parameters need to be given to generate the output $y$ with the input vector $x$: [@VictorZhou]

- A weight vector $w$
- A bias $b$
- An activation function $f(x)$ 

The weight vector is used to weight the different inputs. This means, that each input is multiblied by a weight as can be seen in the equation below [@VictorZhou]

\begin{equation}
x_1 \rightarrow x_1 * w_1
\end{equation}

After that, all the weighted inputs are added together. Additionally the bias $b$ is added to this formula: [@VictorZhou]

\begin{equation}
(x_1 * w_1) + (x_2 * w_2) + b
\end{equation}

Finally, the activation function is being used to generate the output. For that it takes the sum calculated in the above equation as input: [@VictorZhou]

\begin{equation}
y = f((x_1 * w_1) + (x_2 * w_2) + b
\end{equation}

A typical activation function is the sigmoid function, which outputs numbers in the range (0,1). The higher the input, the closer the result gets to 1. The lower the input, the closer it gets to 0. The sigmoid function can be seen below [@VictorZhou]

\begin{equation}
y = \frac{1}{1 + e^{-x}}
\end{equation}

A neural network can consist of more than one hidden layer. In that case, these networks are called deep neural network. In figure \ref{fig:deep_nn} such a deep neural network with three hidden layers and two output values can be seen. [@Stroetmann2018]

![Deep neural network with 3 hidden layers](images/chapter2/deep_neural_net.png){ width=350px #fig:deep_nn}

When training a network, the objective is minimizing the loss function. The loss function is a function, which provides information about how good the neural network is. One common loss function is the Mean Squared Error: [@VictorZhou]

\begin{equation}
MSE = \frac{1}{n}\sum*{i=1}^{n}{(y*{true}-y_{pred})^2}
\end{equation}

With $n$ as the number of samples, $y_{true}$ as the true value of the variable and $y_{pred}$ as the predicted value of it. To minimize this loss, the neural network uses the partial derivative to change the weights and biases accordingly. This is done over and over again for every sample until the network is well-trained with the given inputs.

Still, the developer does not only have to give some input data, train the neural network, and think all his work is done. Instead, other challenges have to be faced like preparing the data, choosing the right architecture of the neural net as well as its parameters and amount of input data to get the best results and avoid problems like over- or underfitting the network. How the developer handles these difficulties and what the necessary steps are in this new kind of development will be described in chapter \ref{sec:aicycle}

## Artificial Intelligence lifecycle {#sec:aicycle}

The new possibilities opened by Machine Learning, as described in chapter \ref{sec:ml} force developers to change their development lifecycle in a drastic way. This lifecycle will be described and explained in the following chapter.

Important to mention is, that instead of code the developers have to produce for a specified objective, in Machine Learning the developers get some data as input and must train a model with this data to meet the objective. This objective can not be evaluated by common methods of verifying the functionalities of a software. Instead it has to be evaluated by measuring the accordance of the calculated output with the true output with explicit testing data.  

To simplify the process described in this chapter an example data set will be given and in the process of explaining the single steps this data will be used to exemplify these. This dataset can be seen below.

\begin{table}[htb]
\centering
\small
\rowcolors{2}{gray!25}{white}
\caption{Example dataset to predict the price of real estate}
\begin{tabular}{ c | c | c | c | c | c | c  }
\rowcolor{gray!50}
\textbf{square meters} &\textbf{year built} &\textbf{year bought} &\textbf{age of buyer} &\textbf{type} &\textbf{\# of rooms} &\textbf{price} \\ \hline
50 & 2000 & 2005  & 33 & Appartm. & 3 & 250.000€ \\
20 &  & 2010 & 26 & Appartm. & 1 & 100.000€ \\
160 & 2004 & 2004 & 38 & House & 5 & 500.000€ \\
300 & 2010 & 2016 & 41 & House & 7 & 680.000€ \\
80 & 2018 & 2018 & 29 & Appartm. & 3 & 290.000€ \\
48 & 1999 & 2008 & 24 & Appartm. & & 220.000€ 
\end{tabular}
\end{table}

With this data the developer has to go through several steps to build a useful system based on them. These steps are defined in an open standard process model called \acl{CRISP-DM} or \acs{CRISP-DM}. This model can be seen in figure \ref{fig:crisp_dm}.

Following this standard model, the first step is Business Understanding. During this step, the project team has to determine overall goals and tasks for what to do with these data. For that, the team has to access the situation, which means that the team has to include possible risks, costs, benefits, and requirements for every possible objective in their evaluation process. After the overall objective is defined, this can be partitioned into several data mining goals what to do specifically with this data. Also, success criteria should be defined, and a project plan should be established, which will be followed in the next steps. [@Wirth2000]

![CRISP-DM standard[@WolfRiepl]](images/chapter2/crisp_dm.png){ width=350px #fig:crisp_dm}															

In the example, there are far too little data for a real model, and much more would be needed in a real project. Even in this small dataset, some problems can be detected. The first one is the missing entry for the second object in the column "year built" as well as for the last object in the column "# of rooms". Also, the type of estate is categorical instead of numerical, which could cause problems when training the model.

The next step is probably the one that needs the most time effort of the developer - data preparation. First, the data, which will be used for building the model, needs to be selected. Then the data need to be preprocessed.  [@Wirth2000]

This preprocessing step includes detecting and removing noisy and redundant data. Noisy data means data that are irrelevant to the chosen business objective. In the given example, the age of the buyer is an unnecessary information because it does not change the price of the estate. This circumstance is why this column can be removed. Also, wrongly labeled data should be removed. 

Additionally, in the preprocessing step, unbalanced datasets should be balanced. This means that if one specific class of data is overrepresented and another one underrepresented, the dataset should be balanced so that the distribution of the different data classes are representative. In the example, apartments could be overrepresented, because there are twice as many apartments in the selected data than houses. The solution would be to add some more houses in the dataset or remove some apartments.

Last, missing values have to be handled because null values could negatively influence the model. A better way would be to fill the missing cells with average values for this type of data. To choose the average value is not always the right way - it could be better to choose the minimum, for example. To decide the method of handling missing values is one challenging task for the developer. [@article]

After the preprocessing, the dataset could be improved by feature engineering. The objective of this task is to improve the features such that the model better understand the coherences and improves its production function. [@article] For example, new features could be created based on the knowledge of the data. A condition for that is to have an excellent data understanding. In the example above the developers could combine the column 'year built' and 'year bought' to 'age at date of purchase' with a simple subtraction, which could give an essential insight of the price. Another meaningful feature could be some relation between the size of the real estate and the number of rooms. 

Additionally, there can be features in a dataset that are not numerical but categorical. This data need to be encoded before training the model. The encoding technique depends on the context of the categorical data.  One simple technique is label encoding, with which for every different category tha column gets a different number. For example every 'Appartment' gets a 1 and every 'House' a 2 in the 'type' column. This could cause trouble, because the learning algorithm could interprete the numbers as sequence. That's why another technique is One-Hot-Encoding. In this technique every possible category gets an own column and for every entry in the dataset the value is set to either 1 or 0 for all of the columns. In the example this would mean, that the column 'type' would be replaced with the columns 'appartment' and 'house'. For every appartment the column 'appartment' would then be set to 1 and the column 'house' to 0. For every house it would be exactly the other way round.[@SunnySrinidhi]

In the next step all collected and cleaned data should be integrated and merged. After that the feature values should be normalized, because there is usually a significant difference between the minimum and the maximum value of a feature. To increase the performance of a model it could be helpful to scale the values down to, for example, a range from 0 to 1. [@article] One approach for this is called MinMax and converts the numbers through the following equation [@MicrosoftDocsb]:

\begin{equation}
z = \frac{x-\min(x)}{[\max(x) - \min(x)]}
\end{equation}

In the end the example above could look like this:

\begin{table}[htb]
\centering
\small
\rowcolors{2}{gray!25}{white}
\caption{Example dataset to predict the price of real estate}
\begin{tabular}{ c | c | c | c | c | c | c  }
\rowcolor{gray!50}
\textbf{square meters} &\textbf{year built} &\textbf{year bought} &\textbf{age at purchause} &\textbf{type} &\textbf{\# of rooms} &\textbf{price} \\ \hline
0.11 & 0.05 & 0.07  & 0.56 & 0.00 & 0.33 & 0.26 \\
0.00 & 0.50 & 0.43 & 0.22 & 0.00 & 0.00 & 0.00 \\
0.50 & 0.26 & 0.00 & 0.00 & 1.00 & 0.67 & 0.69 \\
1.00 & 0.58 & 0.86 & 0.67 & 1.00 & 1.00 & 1.00 \\
0.21 & 1.00 & 1.00 & 0.00 & 0.00 & 0.33 & 0.33 \\
0.10 & 0.00 & 0.29 & 1.00 & 0.00 & 0.50 & 0.21
\end{tabular}
\end{table}

This data set has then to be splitted into three different sets - training, validation and testing. This is done to ensure that the model does not overfit to the training data. The model will be trained with the training set. Then the hyperparameters, which are used to improve the model with some different parameters dependent on the used model, are tuned with the help of the validation set. The test set is used to test the models actual performance at the end.

After this, the next step is the development of the model. For this, first, a training technique, as well as a pretrained model, has to be selected. Usually, different models are tested several times, so that the best model can be chosen in the end. During this progress the models architecture needs to be adjusted, parameters needs to be tuned and the results have to be evaluated several times. Often, there are already models with pretrained weights for specific use cases existing. [@Wirth2000] One example is the \acs{YOLO} (\acl{YOLO}) object detection system, which is pretrained with the ImageNet classification task. This helps for having a good basic model, which is already quite capable. On the other hand it is not bias-free any more, because it can be fitted with specific prejudices, which can influence a model in a negative way. [@DBLP:journals/corr/RedmonDGF15]

If using such models they can be adjusted by tuning the parameters and optimizing its architecture. Then they can get fitted with the existing use-case-specific data and tested afterwards. The model, that is considered to fit the best, will then be used to train it with the training set. As already mentioned above the hyperparameters are then tuned with the help of the validation set. This prevents, for example, over- and underfitting the model with the training data.  [@Wirth2000]

Then the model has to be evaluated with the test set. There are several indicators defined to measure the performance of a model. One is the accuracy, which divides the correct classified results by all tested samples:

\begin{equation}
Accuracy := \frac{\mbox{number of correct predictions}}{\mbox{number of all predictions}}
\end{equation}

Another indicator is a confusion matrix. A confusion matrix shows the number of *True Positives* and *True Negatives*, which states correctly predictes positive or negative values, as well as *False Positives* and *False Negatives*, which states falsely predicted values. An example can be seen below:

\begin{table}[htb]
\centering
\small
\caption{Example confusion matrix}
\begin{tabular}{ c | c | c  }
n=165 &\textbf{Predicted Positive} &\textbf{Predicted Negative} \\ \hline
\textbf{Actual Negative} & 50 & 10  \\
\textbf{Actual Positive} & 5 & 100 \\
\end{tabular}
\end{table}
[@AdityaMishra]

A third indicator is the F1 score, which first calculates the precision as well as the recall of a model. Precision is the number of correctly predicted positive results divided by the number of predicted positive results. Recall on the other hand is the number of correctly predicted positive results divided by the number of all samples. The F1 scores combines those two values to find a balance between them. The greater the F1 score, the better the performance of the model:

\begin{equation}
\begin{aligned}
Precision &= \frac{\mbox{TruePositives}}{\mbox{TruePositives} + \mbox{FalsePositives}}\\
Recall &= \frac{\mbox{TruePositives}}{\mbox{TruePositives} + \mbox{FalseNegatives}}\\
F1 &= 2 * \frac{1}{\frac{1}{Precision}+\frac{1}{Recall}}
\end{aligned}
\end{equation}

Last, also the mean squared error can be used as a measure for the performance of a model. The mean squared error calculates the average of the differences between the real value and the predicted value:

\begin{equation}
MSE := \frac{1}{N} * \sum*{j=1}^{N}{(y_j - \hat{y}*j)^2}
\end{equation}

There are still several other indicators that can be used for measuring the performance. The developer should decide which indicators to us to evaluate the performance of a model after the automated tests have been driven.

After that, the whole process needs to be reviewed and improved if possible. Dependent on the resulting model and the satisfaction of all stakeholders, the steps can be repeated starting from the Business Understanding with deeper knowledge. 

This is how a model can be continuously improved until all stakeholders are satisfied by tuning the hyperparameters, choosing different models or improved data and features, or applying different training methods. [@Wirth2000]

This process from preparing the data and adjusting the parameters can be seen in figure \ref{fig:ml_cycle} from a more technical perspective. First, the developer gets the raw dataset, then he preprocesses this dataset and applies feature engineering to improve it. After it, the dataset is split into different sets, and the parameters get tuned. At the same time, a model is getting implemented and trained with the training set and the given parameters. This step is repeatable until the developer is satisfied with the created model. In the end, the model's predictions will be evaluated against the test data.

![Iterative Machine Learning lifecycle](images/chapter2/training_cycle.png){ width=400px #fig:ml_cycle}																

Last, the model needs to be deployed. For that, the monitoring and maintenance of the product need to be clarified. This is how the model can be applied to its business case. The objective is an easy and stable way to access the new product. The cycle will then be finalized with a final report and review of the product as well as the process. [@Wirth2000]

With this standardized process of Artificial Intelligence development, the basics for applying DevOps to them are already existing. In chapter \ref{sec:devopsai} will be described how these steps can be automated while simplifying the work for the developer and increasing the efficiency at the same time based on the principles and practices of DevOps described in chapter \ref{sec:devops}.

## DevOps for Artificial Intelligence {#sec:devopsai}

The new steps described in chapter \ref{sec:aicycle} forces developers to change not only their development cycle but also the operation. Additionally, new architectural models like microservices, cloud technologies like containerization or Kubernetes as well as \acs{SaaS} as a new Software model as described in chapter \ref{sec:ms12} opens new possibilities. Scalable, flexible and reliable deployments of products are enabled by the described technologies.
All this changes the way of DevOps, including DevOps specialized on Machine Learning / AI. 
For this new type of DevOps a holistic approach has to be made to transform existing principles and practices and some may have been created from scratch. Based on the common set of practices and principles of DevOps described in chapter \ref{sec:devops} in this chapter these principles will be adapted and extended for applying it to AI development. The new technologies presented in chapter \ref{sec:ms12} will serve as possibility to implement these practices.

First, DevOps for Machine Learning has to follow the principles named in chapter \ref{sec:devops} [@Sharma2017]

- Develop and test against production-like systems
- Deploy with repeatable processes
- Monitor and validate operational quality
- Amplify a feedback loop 

The four stages - steer, develop, deploy, and operate - also apply for Machine Learning. To adapt existing principles, these stages will be passed through, and necessary changes or additions will be made.

The first set - **steer** - was about management and planning, which includes Continuous Business Planning, Continuous Improvement, and Release Planning. All this includes: Tracking the status and the needs of a project,  monitoring a product and getting feedback from the users as well as tracking the progress of the project to minimize the risks and be able to react on trends as quickly as possible. 

All this also applies to the development of AI and overlaps with the CRISP-DM process described in chapter \ref{sec:aicycle}. This process defines *Business Understanding* as the first stage, in which business goals and objectives should be defined. During this step, the same practices and tools can help as in traditional software development as there is no difference in planning and managing the objectives and release plan of a Machine Learning or a traditional software project. 

The difference in the steer phase is that there is an additional step, which includes understanding the data. This understanding needs a deeper insight into the business correlations, necessary information, and context of the data. So, there are two significant differences -

The first critical difference is in the roles of the people who handle these steps. This profound insight of the business data needs experts on this field instead of programmers with a lack of understanding all the correlations and meanings. Instead, usually, data scientists or data analysts are needed for defining the needed data, evaluating the quality and detecting problems. They got a unique skill set when it comes to the preparation of data, feature engineering. Additionally, they need to have a deep knowledge of Neural Networks for being able to figure out the right architecture, parameter, learnings algorithms etc. to being used for building the model. In exchange they sometimes lack in experience with operation tools such as pipelines. That is why a more natural way to build and operate a pipeline is necessary, which can be easily handled and reused so that the process of development is as easy as possible and the Data Scientist can focus on his main work with the data. This approach will be delighted at the end of this chapter.

A second difference is a need for a tool to visualize these data. For that, the data scientists or analysts need a possibility for creating visualized data as quickly as possible. A widespread tool for this is *Jupyter Notebooks*, with which an easy preparation and plotting of the data are possible with the help of Python.

Most differences are in the **development and testing** stage. While in traditional software development this step consists mainly of coding and testing the single components with unit tests as well as integration tests, in ML development this stage is split into two stages - data preparation and the building of the model. The code is not the only input the developers have to deal with, but there is data as a second, valuable input. [@Dillon] The development of the model itself is also slightly different from traditional development. The developer has to test and compare different learning algorithms and adjust the belonging parameters to figure out which model best to use for the specific use case. Usually, there are already models existing with pretrained weights. They can serve as basic model, on which the developer can build on. These models have to be adjsuted, retrained and even the architecture might have to be changed to get the best results. All this leads to several differences in the practices and tools.

Starting with the *Collaborative development* and *Continuous integration*, the main point is to integrate and share not only the code between all participators but also the data. Usual source control software like git sets limitations to the file size and are not designed for handling other data than code. This results in need of another tool to handle big data samples when developing an AI product so that developers can share and integrate their work and not only the code. This is necessary to share the results with the client and keep the product reproducible. 

For Machine Learning, also IDEs, programming languages and paradigms have to be extended, or new ones need to be created to visualize and especially prepare data. This includes, for example, possibilities to label images or videos and preprocess the data. Currently, for this, different tools have to be used. As long as there is no standardized way for labeling data, teams should agree on one tool for guaranteeing the correctness and uniformity.

Another important piece in traditional Software development is called *Continuous testing*. This practice includes automatically build the software and run unit tests on every single component as well as automated integration tests of the application as a whole. In AI development, a completely different form of testing is necessary: 

First, a Machine Learning model can only be tested as a whole instead of its single components. Machine Learning models work more like a black box because it is difficult to look at how the inner components are working and evaluate its actions. This means that only an input can be given and the output can be classified as true or false without a valuation of the single components.

For this approach, the data needs to be split automatically into a training and a test set before training the model. After the training step is done, the test set is used to compare the predicted outcome with the real value. Applying this approach can give valuable insights into the model, which can be expressed as different indicators. Thore are explained in chapter \ref{sec:aicycle}.

During the modeling stage, another important difference occurs: The urgent need for resources, especially of computing units and memory. In opposite to traditional Software development, this use does not equal the need for resources while running the application in production, but it needs far more resources to train the model. Usually, \acs{GPU}s or specialized Hardware are used to build models because their design fits the need for model training better. These hardware resources are not very common in traditional Software development, so teams would have to purchase one just for this purpose. Additionally, these resources are only needed during the modeling stage, and the rest of the time, they would be unused, which is a waste of resources. This is where the advantages of Cloud Computing can be utilized. With the capability of flexible resource allocation, the resources can be used more efficiently, and cost can be saved because of the pay-per-use model of Cloud Computing. This approach of saving cost and resources through training the model within a Cloud can be called *Dynamical resource demand*.

The next stage is the **delivery**, in which the practice *Continuous delivery* applies. This practice deals with the automation of the deployment of the software to different environments. This demand also applies to Machine Learning development. Only the implementation differs slightly. In common Software development, the trigger for starting the building and deployment process is usually a newly committed code in the master repository. In Machine Learning, it could also be necessary or recommended to rebuilt and deploy the model when new or changed data occurs, which forces a second trigger. If this data changes continuosly, a sequential execution of the pipeline could be recommended instead. Additionally, the built of the project requires more steps than just compiling the code like training the model, which takes some time. This is described in more detail below when it comes to delivery pipelines.

An essential practice during the delivery stage to guarantee the principle of developing and testing against production-like systems is to containerize the ML applications and its contents. This guarantees a consistent environment during all stages, because the containers provide their environments on their own. The containers can then be deployed in any system, whether local or Cloud, and the results should stay the same. This is already pretty common for traditional software but is often avoided with Machine Learning applications because of missing Cloud computing options. This is why Cloud providers are forced to build Cloud platforms, that enable the use of \acs{GPU}s on a cluster so that containerized ML applications can become a reality. This would speed up the development of ML applications as well as it would increase its efficiency and reduce costs due to more comfortable ways of building, testing, and deploying these applications.

Last, there is the **operation** stage. During this stage, the use of the application should be monitored, and feedback should be collected. That information should then be used to improve future products and support the current version with updates and bugfixes. 

For ML applications, this monitoring and feedback get one more, significant role - through the collection of more data, the model can be continuously improved through *Refitting of the model*. This is an exclusive feature for ML applications because, in the opposite of traditional software, these are adaptive. This demands a clean collection of the data as well as automated processing of these. Then this data can be used to retrain the model and redeploy it periodically. This offers the users to experience a significant improvement of the app's performance, and that way increases the User experience due to better results.

An essential part of a solution is to provide an easy-to-use delivery pipeline for the Data Scientists, which combines every step of the development and automates all the operations as far as possible so that the Data Scientist can focus on his main work. 

An example draft of such a pipeline can be seen in figure \ref{fig:devopsaipipeline}.

![Example devops pipeline](images/chapter2/devops_ai_pipeline.png){ width=500px #fig:devopsaipipeline}

There the first difference to traditional DevOps pipelines is, that there are other inputs than only the code. This is the data and eventually a base model, which can be adjusted and then trained with the data. Both of them can optionally serve as a trigger for starting the delivery process. Alternatively, the process can be sequentially executed or bumped by the developers by purpose.

Then there are a preprocessing as well as a feature engineering step. These two steps are realized by some scripts of the developers, which take over the preprocessing and feature engineering automatically. The cleaning and every other necessary step to be made with the data has to be done manually before pushing the data to its repository.

After this, the dataset is split into three sets - training, validation, and test. The training and validation sets are then used for the training of the model, while the test set is only used to test the finished model at the end. 

Before the training of the model, the pipelines scales up the used infrastructure, so that enough resources for the training step are available. Also, the hyperparameter tuning can be done by automated scripts here. Alternatively, those hyperparameters can be given by input parameters before the pipeline is executed.

For the training of the model, which takes a large part of the time, the pipeline usually uses a model with pretrained weights, adjusting the architecture of the model and train this model with new data. This is done because building a completely new model from scratch needs much time and huge amounts of data, which is the reason why most models are based on some models with a specific ground truth and only some are built from scratch.

After this is being done, the infrastructure can scale down again, and the model can be tested. If the results are satisfying, the model and its application can get containerized and deployed on the cluster. The developer can define the way of how the application should be published and accessible from the cluster for the end-users. In case the model does not meet the requirements the data, parameters, or the code needs to be adjusted or cleaned, so that a better model will be built next time.

Last it is to mention, that through feedback given by the users and generated by applying data analytics to its behavior during the operation stage, the dataset is continuously extended by new data. This is why the pipeline should repeat the model building sequentially so that these new data can be used to improve the application continuously.

With these adjusted and complemented practices above as well as with a delivery pipeline similar to the described one, the principles of DevOps can be applied to an AI enriched software development ecosystem. Through the automated containerization and deployment on a cluster, every environment can look exactly like the production environment. If the whole pipeline and application should be tested first locally before deploying it on a Cloud, it can be tested on a local Kubernetes cluster like Minikube, which will be described in chapter \ref{sec:minikube}.

Also, the delivery pipeline guarantees a repeatable and reliable deployment, in which almost every step can be automated, and the Data Scientist can focus on his work with the data. The only thing the developers need to do is providing scripts for an automated preprocessing and feature engineering if necessary.

The monitor and feedback principle has an higher importance because through this, the application can be continuously improved through feeding the system with the gained knowledge. In the next chapters, two different approaches to building such a pipeline will be presented and evaluated with previously defined criteria.

