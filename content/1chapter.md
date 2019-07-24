# Introduction {#sec:intro}
[//]: # (![Titel [@BibtexQuelleName]](test.com/img.png){ width=400px #fig:img})

## Changes in Software Development caused by AI{#sec:devchanges}

First discussed in the 1940s, Artificial Intelligence has made great progress in recent years thanks to advances in computing capacity as well as Deep Neural networks and the accessibility of huge amounts of data. [1] This leads to companys investing in AI about 32€ Billion in 2019 according to a forecast by IDC, which makes it one of the most important fields of businesses. [2] 

These progresses do not only impact the products itself, but also their development. In contrast to a traditional software development process in which the business logic is explicitly encoded in rules, solutions that rely on machine learning are fed with huge amounts of data that contains the business logic only implicitly.

This leads to a completly different development cycle. While classical software development is focused on the design and the development of the code, which is followed by testing and deployment, the machine learning lifecycle consists out of data collecton, preparation, the training of the model with those data as well as the deployment of this model. [3]

This new type of software development is getting more and more important. Some people like Andrej Karpathy, Director of AI at Tesla, even predict, that these new type of Software will replace traditional software development as a whole. [4] This has some advantages, e.g. that it is easier to learn and to manage, more homogeneous and very well portable. In return it is harder to understand for humans, so that those systems appear to us as "black boxes", and debugging can be very difficult as well, because usually, there is no real error message. [3]

In this work all the progresses that have lead to this transformation will be explained in more detail. Additionally it will be described which difficulties and challenges come along with it, focused on necessary changes for operations of the development cycle, called DevOps. 

[//]: # (https://www.forbes.com/sites/janakirammsv/2018/05/27/here-are-three-factors-that-accelerate-the-rise-of-artificial-intelligence/#4349a30badd9)
[//]: # (https://www.idc.com/getdoc.jsp?containerId=prUS449114199)

[//]: # (https://www.forbes.com/sites/mariyayao/2018/04/18/6-ways-ai-transforms-how-we-develop-software/#a67a11026cf8)

## Cloud Computing  {#sec:cloud}

In 2009 the university of Berkeley published a paper, in which the potential of Cloud Computing has been discussed. In doing so Cloud Computing has been defined as both - the applications delivered as services over the Internet, referred to as Software as a Service (SaaS), as well as the hardware and the systems software in the datacenters that provide those services. []

Thereby a distinction is made between a Public Cloud and a Private Cloud. A Cloud is called public when the Cloud is made available in a pay-as-you-go manner to the public. This means, that you pay for a service in advance and then you can only use what you have paid for. Private Cloud on the other hand refers to internal datacenters of business or other organizations unavailable to the public. []

SaaS in general has advantages for both end users as well as service providers. While the service provider can install, maintain and control their services more easily, the user can access the service anytime, anywhere, collaborate more easily and keep their data in the infrastructure.

Cloud Computing enables this possibility to more application providers and additionally also the possibility to scale their applications on demand. Based on this possibility there are some more advantages identified in the described paper for Cloud Computing in particular:

- The illusion of infinite computing resources on demand 
- The elimination of an up-front commitment by Cloud users 
- The ability to pay for use of computing resources []

The first point eliminates the need to plan far ahead how much resources are needed, but enables the user to buy as much resources as necessary as soon as it is really needed.

Also Cloud users are allowed to change their need of resources any time, so they can scale up their application and don't have to commit to their need beforehand as described in point two.

The last point is about saving money when the resources are no longer needed. As it is possible to scale up, it is also possible to scale down, which eliminates the need to pay for the resources. This releases the Cloud users from taking too much risk when paying for resources they may not need for a long time. 

For realizing those advantages there were different approaches competing with each other - one looking similar to a phsyical hardware with the ability to control the entire software stack similar to a low-level Virtual Machine (VM) and on the other hand a clean separation between a stateless computation tier and a stateful storage tier. In this competition the first option has become established, because users mostly wanted to recreate their local environment instead of writing new programs solely for the cloud.

But this solution still forced the User to manage their environment themselves. Especially for simpler applications it is desirable to have an easier path to deploy their applications to the cloud.

Amazon provisioned a new solution for those needs in 2015 called AWS Lambda. Lambda offered the possibility to simply write the code to be executed and leaves all server provisioning and administration tasks to the cloud provider. 

This is known as serverless computing, because - even though there are still servers being used for the computation tasks - the user does not have to care about any tasks on serverside and can focus on writing the code. Serverless services must scale and bill automatically based on usage without any need to explicit provisioning. 

Machine Learning


## Development Operations in time of AI

The traditional software development has continuously been improving for years, defining standards and principles to increase the efficiency, portability and quality of the development cycle. Those principles and practices are called DevOps. In the new type of software development described in chapter 1.1 not all of those are applicable any more and new ones need to be defined.

Starting with development itself and ending with maintaining and improving the product, there are DevOps principles for every single stage of the development cycle. This is described in more detail in chapter 2.1. In the new world of AI those stages are different, some new stages have been added, others have become unnecessary 

Additionally Cloud Computing and especially containerization changed the way of how products are deployed and managed as described in chapter 1.2.

Also, AI tools are enabling new possibilities for improving the IT operations functions like monitoring, analysis, service management and automation.

All those progresses lead to two big trends in the DevOps area. The first one is using Artificial Intelligence for DevOps. In doing so machine learning functionalities are used to enhance all IT operations. Gartner calls this "AIOps" and predicts, that the use of AIOps will rise from 5% in 2018 to 30% in 2023. []

The second trend is using DevOps for the development of AI. This means adopting existing principles and practices for the traditional development cycle to the development cycle of AI tools. The objective of this is to upheld existing standards and maximize the efficiency of the development processes.

In this work this second trend will be analyzed, the influences leading to it will be described and possible solutions will be shown, compared and discussed.



