# Introduction - Software Development Trends {#sec:intro}

The upcoming trends of \acl{AI} (\acs{AI}) and Cloud Computing are changing the world of \acl{IT} (\acs{IT}) as a whole. One very important aspect is the way applications are developed and operated. These processes can be summarized under the term \acl{DevOps} (\acs{DevOps}). This work will deal with how AI and Cloud force DevOps to transform and will discuss different approaches to adopt and realize those principles for AI applications. The following chapter will introduce the terms of AI and Cloud computing and will describe how these innovations force DevOps to transform.

In doing so the terminology of *traditional* or *classical* software will be used to describe programming based software, which is described in a set of explicit instructions to tell a computer how to perform a task.

## Changes in Software Development caused by AI{#sec:devchanges}

First discussed in the 1940s, Artificial Intelligence has made great progress in recent years thanks to advances in computing capacity as well as Deep Neural networks and the accessibility of huge amounts of data. [@JanakiramMSV] This leads to companies investing in AI about 32€ Billion in 2019 according to a forecast by IDC, which makes it one of the most important fields of businesses. [@MichaelShirer] 

These progresses do not only impact the products itself, but also their development. In contrast to a traditional software development process in which the business logic is explicitly encoded in rules, solutions that rely on \acl{ML} (\acs{ML}) are fed with huge amounts of data that contains the business logic only implicitly.

This leads to a completely different development cycle. Classical software development is focused on the design and the development of the code. This is followed by testing and deployment. A Machine Learning  lifecycle on the other hand consists out of data collection, preparation, the training of the model with those data as well as the deployment of this model. [@MariyaYao] The differences between both is described in more detail in chapter \ref{sec:devopsaitime}.

The type of software development described above is getting more and more important. AI pioneers like Andrej Karpathy, Director of AI at Tesla, even predict, that these new type of software will replace traditional software development as a whole. [@AndrejKarpathy] This can have some advantages, e.g. that it is easier to learn and to manage, more homogeneous and very well portable. In return it can be harder to understand for humans, so that IT is still discussing if AI can be classified as turing complete. [@MariyaYao]

In this work, all the progresses that have led to this transformation will be explained in more detail. Additionally, it will be described which difficulties and challenges come along with it, focused on necessary changes for operations of the development cycle, called DevOps. 

[//]: # "https://www.forbes.com/sites/janakirammsv/2018/05/27/here-are-three-factors-that-accelerate-the-rise-of-artificial-intelligence/#4349a30badd9"
[//]: # "https://www.idc.com/getdoc.jsp?containerId=prUS449114199"

[//]: # "https://www.forbes.com/sites/mariyayao/2018/04/18/6-ways-ai-transforms-how-we-develop-software/#a67a11026cf8"

[//]: # "karpathy"

## Cloud Computing  {#sec:cloud}

In 2009 the university of Berkeley published a paper, in which the potential of Cloud Computing has been discussed. In doing so Cloud Computing has been defined as both - the applications delivered as services over the Internet, referred to as \acl{SaaS} (\acs{SaaS}), as well as the hardware and the systems software in the datacenters that provide those services. [@ArmbrustA.FoxandR.Griffith2009]

Except for SaaS there are two more service models for Cloud Computing defined by the National Institute of Standards and Technology defined: \acl{PaaS} (\acs{PaaS}) and \acl{IaaS} (\acs{IaaS}). In case of PaaS the provider controls the whole infrastructure including servers, storage and operating system and offers the customer to deploy its applications on this infrastructure. IaaS means the provisioning of storage, networks and all of the resources, so that the customer can deploy its software, including the operating system and application. [@Mell2011]

SaaS in general has advantages for both end-users as well as service providers. While the service provider can install, maintain and control their services more easily, the user can access the service anytime, anywhere, collaborate more easily and keep their data inside the infrastructure. [@ArmbrustA.FoxandR.Griffith2009]

Cloud Computing enables this possibility to more application providers and additionally also the possibility to scale their applications on demand. Based on this possibility there are some more advantages identified for Cloud Computing in particular:

- The illusion of infinite computing resources on demand 
- The elimination of an up-front commitment by Cloud users 
- The ability to pay for use of computing resources [@ArmbrustA.FoxandR.Griffith2009]

The first point eliminates the need to plan far ahead how many resources are needed but enables the user to buy as many resources as necessary as soon as it is needed. 

Also, Cloud users are allowed to change their need for resources any time, so they can scale up their application and don't have to commit to their need beforehand as described in point two. 

The last point is about saving cost when the resources are no longer needed. As it is possible to scale up, it is also possible to scale down, which eliminates the need to pay for the resources. This relieves the Cloud users from taking too much risk when paying for resources they may not need for a long time. 

For realizing those advantages the different approaches of IaaS with a cloud specific infrastructure and PaaS with a well known environment for the customers were competing with each other. In this competition, PaaS option has become established, because in the beginning most users wanted to recreate their local environment instead of writing new programs solely for the cloud. [@Jonas2019]

But this solution still forced the User to manage their environment themselves. Especially for simpler applications, it is desirable to have an easier path to deploy their applications to the Cloud.

Because of these desires a new service model has been established, which is known as \acl{FaaS} (\acs{FaaS}) or serverless computing, has been established. Even though there are still servers being used for the computation tasks the user does not have to care about any tasks on serverside and can focus on writing the code. Serverless services must scale and bill automatically based on usage without any need for explicit provisioning. [@Jonas2019]

Amazon provisioned such a solution in 2015 called AWS Lambda. Lambda offered the possibility to simply write the code to be executed and leaves all server provisioning and administration tasks to the cloud provider. [@Amazon]

Those new possibilities with the Cloud technology changed the way of how developers can deploy and manage their products. Additionally, also AI development benefit from this very strongly because of several reasons. 

The first one is automated scalability, which eliminates the need to worry about raising workloads. Additionally, when AI models are being trained, there are many resources needed, but besides this task, there are not as many resources necessary. Through serverless computing, this idle time will not be billed. [@BhagyashreeR]

Serverless computing also reduces the interdependence, because the functions can be updated, deleted or invoked any time without having any side effect on the rest of the system. [@BhagyashreeR]

These Cloud options mentioned above forced companies to change their way of developing and operating their products. This change of the DevOps lifecycle will be introduced in chapter \ref{sec:devopsaitime}

[//]: # "https://www2.eecs.berkeley.edu/Pubs/TechRpts/2009/EECS-2009-28.pdf"

[//]: # "https://www2.eecs.berkeley.edu/Pubs/TechRpts/2019/EECS-2019-3.pdf"

[//]: # "https://aws.amazon.com/lambda/"

[//]: # "https://hub.packtpub.com/how-serverless-computing-is-making-ai-development-easier/"


## Development Operations in time of AI {#sec:devopsaitime}

The traditional software development has continuously been improving for years, defining standards and principles to increase the efficiency, portability, and quality of the development cycle. Those principles and practices are called DevOps. In the new type of software development described in chapter \ref{sec:devchanges}, not all of those are applicable any more and new ones need to be defined. Additionally, the upcoming Cloud technology changed the way how products can be deployed and managed as described in chapter \ref{sec:cloud}. In this chapter, the consequences of those changes for DevOps will be examined.

Starting with development itself and ending with maintaining and improving the product, there are DevOps principles for every single stage of the development cycle. This is described in more detail in chapter \ref{sec:devops}. In the era of AI and Cloud, those stages are different, some new stages have been added, others have become unnecessary.

A short, simplified comparison between the required steps of traditional operations and Machine Learning operations can be seen in figure \ref{fig:img}.

![Comparison development lifecycle traditional app and ML pipeline[@Dillon]](images/chapter1/traditional_ml_comp.png){ width=400px #fig:img}

In traditional development, there is one input - the code. This code has to be tested, built and then deployed.

The Machine Learning pipeline looks different. First, there is an additional input - data, which is very important for Machine Learning applications.  The code and the data still need to be tested afterward. 

Also, the model needs to be built. The difference in this stage is, that the resources used for building an ML application are usually different. While traditional applications are usually built on regular \acs{CPU}s (\acl{CPU}), Machine Learning rely on specialized hardware, e.g. \acs{GPU}s (\acl{GPU}), which leads to a more heterogeneous and complex hardware landscape.

A third difference is the training step. ML applications have to be fed with training data. This step can take very long especially when insufficient hardware is being used.

The last differentiator is, that ML data are continuously updated and retrained. This process is called "refitting" the model.

Besides the rise of AI, Cloud Computing also changed the way of how products are deployed and managed. The Cloud can serve as a centralized platform for testing, deployment, and production. Also, it can automatically scale applications and allocate needed resources. Serverless computing even eliminates the need to set up a complete system and offers a simple way to deploy Machine Learning or other functions. [@DavidLinthicum]

AI tools on the other hand are enabling new possibilities for improving the IT operations functions like monitoring, analysis, service management, and automation.

All those progresses led to two big trends in the DevOps area. The first one is using Artificial Intelligence for DevOps. In doing so Machine Learning functionalities are used to enhance all IT operations. Gartner calls this "AIOps" and predicts, that the use of AIOps will rise from 5% in 2018 to 30% in 2023. [@SusanMoore2019]

The second trend is using DevOps for the development of AI. This means adopting existing principles and practices for the traditional development cycle to the development cycle of AI tools. The objective of this is to upheld existing standards and maximize the efficiency of the development processes. [@Dillon] For this the term MLOps - Machine Learnign and Operations - has emerged during the time of this work.

In this work this second trend will be analyzed, the influences leading to it will be described and possible solutions will be shown, compared and discussed.

[//]: # "Gartner"
[//]: # "https://techbeacon.com/app-dev-testing/devops-dictates-new-approach-cloud-development"
[//]: # "https://blog.paperspace.com/ci-cd-for-machine-learning-ai/"






