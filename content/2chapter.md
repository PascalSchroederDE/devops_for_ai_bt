# Theory {#sec:theory}

In this chapter the theoretical basics, that are needed for creating DevOps principles for AI, will be given. For that it will be started with an explanation of what DevOps is in general. Then it will be shown, which new possibilites came with Cloud and 12-factor-apps in chapter \ref{sec:ms12}. After that the basics of Machine Learning and AI will be given in chapter \ref{sec:ml}, specializing on the lifecycle of AI development in chapter \ref{sec:aicycle}. Last in chapter \ref{sec:devopsai} all these knowledges will be combined to adopt the DevOps principles explained in chapter \ref{sec:devops} to the new world of AI with the help of new Cloud technologies.

## Development Operations {#sec:devops}

Since people started manufacturing products on a mass scale, the goal is to increase the efficiency of this manufacturing process and reduce waste of time and material. 

One early set of best pracitces for manufacturing was the concept of "Lean manufacturing", which tries to reduce the waste of ressources and time of a production cycle as much as possible. With the upcoming use of Software as commercial product in the 1970s [@wikipedia] a desire came on to create best practices for developing and operating products the same way as it was already usual in common manufacturing. [@leanmanufacturing]

In 2009 two Flickr employees - John Allspaw and Paul Hammond, presented their way of combining Development and Operations. Inspired by this presentation a belgian consultant named Patrick Debois formed a new conference - the "Devopsday" in Ghent. This is how the term "DevOps" has been created and prevailed. [@devops.com]

Since then DevOps has been established or at least planned in 91% of all companies as an important way to increase their efficiency of Software development. [@statista] For almost every stage of development there are principles and practices defined and continiuously improved. But before those practices will be explained, a further insight in the business need will be given.

Every process or product need a business value that cover the costs caused by it. For that there must be either an outcome for the customer or reduced producing costs.

For DevOps it is usually even both - on the one hand an enhanced customer experience can be guaranteed and on the other hand the efficiency of the production cycle can be increased.

One example for an enhanced customer experience are practices to get fast feedback from all stakeholders. This feedback can then be used to improve the designed product. One of such practices is the so called "A-B testing". There two different sets of features are enrolled to two groups of randomly chosen users. Both can give their feedback to the producer and the set with the better feedback will then later be enrolled for every user. 

The efficiency can be increased through reduced waste and rework because of practices to write reusable components. Another example are tools for planning a product or fast ways to deliver a product without the need to redeploy everything step by step. In this chapter the advantages of DevOps will be delighted in more detail and some of the practices will be described and explained.

### Principles

The DevOps movement is generally based on four principles. The first one is to *develop and test against production like systems* to move operations concerns earlier in the life cycle. The purpose of this is to see how th esystem behaves and performs before it gets deployed. This is also advantageous from an operations perspective, because it can be seen, how the system behaves when it supports the application. 

The second principle is to *deploy with repeatable and reliable processes*. The objective is to create a delivery pipeline, that enables continuous, automated deployment and testing of the product.

Third, it is important to *monitor and validate operational quality.* This means, that applications and systems should not only be monitored in production, but already earlier. This forces automated testing to be done early and often to monitor the application. Metrics should alwways be captured and analyzed to provide an early warning system about potential issues and risks.

The last principle is to *amplify feedback loops* with the goal to enable a quick reaction to issues. For this organizations need to create a communication channel to its users, so that they can give feedback and the developers can react to it accordingly.

### Practices

The DevOps practices, that have become commonplace, can be splitted in four different sets based on the different periods of a product lifecycle. To each set there are several pracices, standards and tools available, which help to achieve the best possible result. The four different sets and some example practices can be seen in figure \ref{devops_architecture}. 

![DevOps reference architecture[@devopsdummies]](images/chapter2/delivery_pipeline.png){ width=400px #fig:devops_architecture}

The first set is called **Steer**, which is about managing and planning the development and lifecycle of a product. This includes establishing and continuously adjusting business goals. The process resolving this issue is called *Continuous Business Planning*. 

This includes three major points - the acceleration of software delivery, a good balance between speed, cost, quality and risk and the reduction of the time it needs to get customer feedback. [@ibmsummit] 

This is mainly done via tools and practices to track the status, feedback and needs of a project in an efficient way. First, a vision of the projects overall objective should be created and every action should be guided by it. [@ibmsummit]

The strategy, which should lead to this vision, has to be monitored and agjusted continiuously based on new information and feedbacks. This is called *continuous improvment*. For that a good dialog between a Business and IT is necessary for defining good scopes and priorities. [@ibmsummit]

Then a good plan can be built,for example with a release roadmap, which determines which feature should be completed at what time. This is called *release planning* and helps to track the progress of the project and makes it easier to react on new trends, feedback or issues and adjust the single steps based on this. The status of each release as well as each single feature has to be continuously tracked, so that risks will be recognized as early as possible to increase the available time to react. [@ibmsummit]

The second set of practices is for the time of **development and testing**. Two eminent practices for this are *collaborative development* and *continuous testing*.

*Collaborative development* enables different practictioners - architects as well as analysts, developers, specialists etc. - to work together on one project. For that it provides a common set of practices and a common platform to create and deliver the software. 

One core capability is a practice called *continuous integration*, in which developers continuously or frequently integrate their work with the other developers. For that a shared platform or repository is necessary, on which the developers can frequently commit their changes in the code. Usually this is done using a version control system like Git. How a Git workflow looks like can be seen in figure \ref{fig:git}.

![Git workflow](images/chapter2/git_flow.png){ width=600px #fig:git}

There the project is splitted into several branches, which are represented by a rectangular box. The circles represent single commits of new code. Arrows are representing the push of a new version and dashed arrows are representing the base version, on which the new commit was built and to which it will be merged.

The most important branch is the master branch. On the master branch every finished version is pushed and from this branch it can be released.  The development branch is for ongoing changes. Small changes can be done directly on the development branch. Bigger changes like added features should get an own branch. Every developer can create an own branch for a new version, so that the developers don't interfere with each other. When all code changes are done the new version will be merged to the development branch. Sometimes some conflicts in the code have to be fixed for a clean merge in case two different commits changed the same code piece. As soon as the new version is working on the development branch and everything is tested and ready it can be merged to the master branch, so that this new version can be rolled out. In case an error occurs it can be fixed in a hotfix branch directly descendend from the master branch.

Additionally, the application should be tested and verified continuously. For that the developer can run local unit tests to verify their changes before integrating. But this doesn't verify that the integrated code performs as designed. [@AWSCI] A continous integration service linke Jenkins can relieve the developer of this task and automatically builds and runs unit tests on the newly commited and integrated code. [@Jenkins] This process is called *continuous testing*.

Another important point is to shorten the delivery cycles through an end-to-end integration, so that it needs less time to enroll a new feature or similar. This leads to quickly given feedback and enables a faster reaction to this. [@ibmsummit] This is done in the **Deployment** stage of a product lifecycle and one of the root capabilities of DevOps. It deals with the automation of the deployment of the software to the different environments, which is called *continuous delivery*. 

After the deployment follows the **Operation**. During this stage the performance of an application should be montoried and feedback should be collected. The results of this should be used to improve the product as well as other products, that will be developed in the future. For this there are two practices defined - *continuous monitoring* and *continuous feedback and optimization*. 

*Continuous monitoring* provides data and metrics to the performance of an application as well as its running server, the development cycle, the production and other stakeholders.

*Continuous feedback* on the other hand provides data coming directly from the customer. This includes the behavior how they are using the system as well as feedback that the users provide.

Based on those retrieved data businesses may adjust their plans and priorities, improve the development cycle and features and enhance the environment in which the application is deployed in a more agile and responsive way. The objective of this is to improve the product and satisfy the users as well as use this knowledge for new products, that will be developed in the future.

### Technologies

One technology to allow developers to follow above practies is **Infrastructure as code**, which enables organizations to deploy their environments faster and on a higher scale. This is done with machine readable definitions and configurations. Based on them the machine can provide the necessary environment automatically to enable continuous delivery.

The most important technology for DevOps may be a **delivery pipeline**. A delivery pipeline controls the product cycle of an application from development to production. Typically there are four or more stages - development, test, stage and production. This can be seen in figure \ref{fig:del_pipeline}.

![Delivery pipeline[@devopsdum]](images/chapter2/devops_architecture.png){ width=400px #fig:del_pipeline}

For every stage there is usually one specific environment. Those are represented as box. The dark boxes represent a production like environment.

In the development environment all the code updates are being done. There are tools provided like \acs{IDE}s (\acl{IDE}) to write the code as well as tools that enable collaborative development like source control management or project planning.

Source control management is typically combined with version control. This enables the developer to also store previous versions of his application and reduces the risk of issues in new updates, because it can roll them back in case of an error.[@overops]

After the development the delivery pipeline must care for the application to be built.

Second there is the testing environment, in which single components can be tested. For that it has to manage test data, scenarios, scripts and associated results. Similar to the development environment it must not look like the production environment. 

The next one is the staging environment, in which the system can be tested as a whole. The staging environment should be as much production like as possible, so that as many as possible required services, databases and configurations can be connected and applied without touching the production environment. The stage environment is for testing the application before rolling out a major update. 

The last one is the production environment, in which the application will be running live and accessible for the users. [@devto][@plesk]

The delivery pipeline consists out of all those stages and manages an automated transition from one stage to the next one starting directly after the development.

For this deployment automation tools are necessary, which perform the deployments and track which version is deployed on which node. It also manages changes that need to be performed for the middleware components and configurations as well as database components or the environment. 

Last there should also be a tool for **release management**, which provides a single collabiration portal for all stakeholders participating in a project to plan and track the releases of an application and its components across all stages. 

With such technologies most of the defined practices can be performed with the help of accordingly educated people and well thought-out processes. But DevOps is no static set of practices and tools, but it changes with the changes in the world IT, such as Cloud or AI. In the next chapters these technologies will be reflected and the impact those have on DevOps will be analyzed.

[//]: # "Figures, sources?, abbreviations?"

[//]: # "https://en.wikipedia.org/wiki/Commercial_software#cite_note-5"
[//]: # "https://www.statista.com/statistics/673505/worldwide-software-development-survey-devops-adoption/"
[//]: # "https://devops.com/the-origins-of-devops-whats-in-a-name/"
[//]: # "https://dev.to/flippedcoding/difference-between-development-stage-and-production-d0p"
[//]: # "https://www.plesk.com/blog/product-technology/staging-environment-vs-test-environment/"
[//]: # "https://blog.overops.com/3-reasons-why-version-control-is-a-must-for-every-devops-team/"
[//]: # "IBM Tech Summit"
[//]: # "https://aws.amazon.com/devops/continuous-integration/"
[//]: # "https://blog.overops.com/3-reasons-why-version-control-is-a-must-for-every-devops-team/"

## Microservices and 12 factor apps {#sec:ms12}

## Machine Learning {#sec:ml}

Another eminent movement in IT is Machine Learning which helped AI to a new hype and opened several new possibilities and improvements to software development. In the meantime Machine Learning has become one of the most important tools when it comes to Artifical Intelligence.

The advantage of Machine Learning compared to traditional software development is, that it eliminates the need to write the code by yourself. Instead the developer has to enter some input data to the Machine Learning system. This system then figures out mathematical functions, which describes the given collection of data points best. The process of finding these function is called Machine Learning and the resulting function is mostly referred to as model.

This results in a system, which continuosly improves the more data it is fed with, because this leads to a more accurate function. Based on this assumption Tom Mitchell defined Machine Learning in 1997 as follows:

\newtheorem{definition}{Definition}
\begin{definition}
A computer program is said to learn from experience E with respect to some class of tasks T and performance measure P, if its performance at task in T, as measured by P, improves with experience E.
\end{definition}

This means, that a computer program learns if it is improving its performance at some task through experience. This experience could be input data like pictures of trees, with which it gets trained with the task to identiy those trees on that picture.

### Tasks

For fullfilling such a task it is necessary to define this task before. In general tasks are described in terms of how the Machine Learning system should process an example. An example is a collection of quantitative measurements, called features. This set can be written as a vector $x \in \mathbb{R}^n$ with each $x_i$ being one of the features.

The most important and most common tasks in computer science are

- Classification
- Regression
- Structured Output
- Anomaly detection
- Missing Values

In *Classification* the objective is to figure out the category of an example out of a data set by given features. Mathematically this can be described as a function, that takes an example with all its features and assigns a category out of an appropriate set . This set of categories is limited to k, so it can be described as $\{1,...,k\}$. This can be represented as follows:

\begin{equation}\label{eq:classification }
f: \mathbb{R}^n \rightarrow \{1, .., k\}
\end{equation}

An example for this is character recognition. With a given input of a picture of a character the task is to assign this image to one element of the set of characters.

The objective of a *Regression* is to predict a numeric value by given input data. This can be formulated as

\begin{equation}\label{eq:regression }
f: \mathbb{R}^n \rightarrow \mathbb{R}
\end{equation}

When the function that has to be learned is of the form $y=f(x)$ with $y \in \mathbb{R}$ and $x \in \mathbb{R}^n$ then $x$ should be a set of independent variables and $y$ should be a dependent variable on $x$.

An example of a Regression is a prediction of the costs for a new appartment based on features like size, location and the amount of rooms.

*Structured Output* tasks ask a learning algorithm to figure out the probability distribution that has produced the data set. This is then used to provide the relationship between single examples from the data set.

A well known example of this is to recommend products based on previously bought products. For that the learning algorithm figures out the similarity of the products with each other and recommends those with the highest consistency.

*Anomaly detection* works similar to Structured Output, but instead of looking for elements with a high relationship it uses the probability distribution to check for irregularities within the dataset.

This is a good way to anticipate a fraud in a banking account through checking every transaction and hold back those, which are looking too irregular.

For *Missing Values* the probability distribution is used to infer what value should most likely be set at a specific position of a given, incomplete set of examples. This means, that a set $x \in \mathbb{R}$ with some $x_i$ missing. The objective is to figure out the best values for these missing entries..

An example for this is to predict a logical sequence of numbers without the need to know the exact formula of the sequence.

### Training approaches

As mentioned above, in Machine Learning all those tasks are not solved by explicitily coding algorithms and formulas, but with training a system with given input data. For training those systems there are different approaches existing, each used for different requirements.

A first approach is called supervised learning. Supervised learning requires an additional value for each example representing the optimal solution for it. Formally the data set can be described as $\mathbb{D} \in 2^{\mathbb{R}^n}$. For every example vector $x \in \mathbb{D}$ there exists a $y \in \mathbb{R}$ such that $y=f(x)$ with $f:\mathbb{R}^n \rightarrow \mathbb{R}$ being the function that describes the task to be learned. This additional feature is mostly referred to as label or target. Usually the the tasks are accomplished by approximating the conditional probability distribution $p(x|y)$.

Supervised learning algorithms are often used for classification or regression tasks.

Unsupervised learning on the other hand does not have any additional features, but has to work with the pure, raw data set. Usually the data points have many features and the task is to figure out some useful property about the relationship between these data points. This is usually done by using the probability distribution function $p(x)$ of the data set.

Semi supervised learning uses both - unlabeled examples as well as labeled examples - to predict the outcome. This faciliates the task for the developer, because not every data point has to be labeled, but decreases the size of labeled examples, which could worsen the resulting model.

Common tasks for unsupervised learning are clustering or anomaly detection.

In figure \ref{fig:training_comparison} a comparison between supervised and unsupervised data sets used for clustering and classification can be seen. The data shown is not of a particular use case and just for demonstration purposes. In both representations the examples of the data set have only two features, one corresponding to the x-axis and the other ont the the y-axis. The task is to identify clusters in the data.

![Comparison of unsupervised and semi supervised data sets used for clustering[@khatun]](images/chapter2/training_comparison.png){ width=600px #fig:training_comparison}

The difference is, that some of the data points of the second data set are labeled with either 'Class 1' or 'Class 2'. In the figure this can be seen by the coloration of the data points. Even tough in this example there are only some data points labeled, which is the reason why the applied learning approach is called semi-supervised learning, it is still functioning as an example for supervised learning and demonstrates the differences to the unsupervised model.

The missing labels forces the first example to only use the features $x$ and $y$ and look for similarities to determine its association with a group. In the second examples the algorithm can use the labels as well to determine a function, which assigns a class to every data point.

In the figure on the left side two clusters can be seen, which are circled in a group. On the right side there is a line, which marks the function splitting the dataset into two groups. It is noticeable, that the first approach leads to some examples, which can't be assigned to either of the classes. 

Both approaches has different situations, in which they should be the preferred way to go. MISSING PART

Additionally there is another approach called reinforcement learning. In reinforcement learning a model is built and then iteratively improved by taking in further examples. For that it needs to get some feedback of how good the built model is. For example this can be a reward or punishment function.

### Models

With the approaches mentioned above the objective is to create and train a model, with which the tasks can be fullfilled. In modern Machine Learning the most important type of such models are \acl{ANN}s (\acs{ANN}s).

Neural Networks are inspired by biological neural networks like animal brains. According to that, \acs{ANN}s are based on a collection of nodes called artificial neurons. Each neuron has gets one or more input values and one output value. To generate the output value the neuron does some mathematical computations with the input values. 

A network of such neurons usually persists out of at least three layers. The first layer is the input layer of the data, with which the neural network should be fed. Those values are then sent to every neuron of the hidden layer. Those are doing the necessary calculations described below and sending their output to the output layer. This can be seen in figure \ref{fig:neural_net}.

![Simple neural network](images/chapter2/neural_net.png){ width=400px #fig:neural_net}

On the hidden layer the neurons are combining the inputs and calculating a new value with them. For that three parameters need to be given to generate the output $y$ with the input vector $x$:

- A weight vector $w$
- A bias $b$
- An activation function $f(x)$

The weight vector is used to weight the different inputs. This means, that each input is multiblied by a weight as can be seen in equation \ref{eq:weight}

\begin{equation}
x_1 \rightarrow x_1 * w_1
\end{equation}

After that, all the weighted inputs are added together. Additionally the bias $b$ is added to this formula:

\begin{equation}
(x_1 * w_1) + (x_2 * w_2) + b
\end{equation}

Finally, the activation function is being used to generate the output. For that it takes the sum calculated in \ref{eq:weighted_sum} as input:

\begin{equation}
y = f((x_1 * w_1) + (x_2 * w_2) + b)
\end{equation}

A typical activation function is the sigmoid function, which outputs numbers in the range (0,1). The higher the input, the closer the result gets to 1. The lower the input, the closer it gets to 0. The sigmoid function can be seen in \ref{eq:sigmoid}

\begin{equation}
y = \frac{1}{1 + e^-x}
\end{equation}

In figure \ref{fig:neuron} this whole process that happens within the artificial neuron can be seen in a simplified way. It takes the inputs $x_1$ and $x_2$, multiplies them with their belonging weights, sums up the results and add a bias. Last it takes the result of this calculation as input for the activation function. The result of this is the output $y$.

![2 input Neuron[@towardsdatascienceNN]](images/chapter2/neuron.png){ width=400px #fig:neuron}

A neural network can consist out of more than one hidden layer. In this case they are called deep neural network. In figure \ref{fig:deep_nn} such a deep neural network with three hidden layers and two output values can be seen.

![Deep neural network with 3 hidden layers](images/chapter2/deep_neural_net.png){ width=500px #fig:deep_nn}

When training a network the objective is to minimize the loss. The loss is  a function, which provides information about how good the neural network is. One common loss function is the Mean Squared Error:

\begin{equation}
MSE = \frac{1}{n}\sum_{i=1}^{n}{(y_{true}-y_{pred})^2}
\end{equation}

with $n$ as the number of samples, $y_true$ as the true value of the variable and $y_pred$ as the predicted value of it. To minimize this loss the neural network uses the partial derivative to change the weights and biases accordingly. This is done over and over again for every sample until the network is well trained with the given inputs.

Still the Developer does not only have to give some input data, train the neural network and think all his work is done. Instead other challenges has to be faced like preparing the data, choosing the right parameters and amount of input data to get the best results and avoid problems like over- or underfitting the network. Overfitting means, that a network is trained with too many irrelevant features, called noise. This leads to a perfect working system for the known data, which however doesn't work at all for unknown data, because it is too specialized on the data on which it was trained on. Underfitting on the other hand occurs if the neural network was informed by too few features or regularized too much, which prevents the neural network from learning from the dataset. How the developer handles this difficulties and what the necessary steps are in this new kind of development will be described in chapter \ref{sec:aicycle}.

[//]: # "https://towardsdatascience.com/machine-learning-for-beginners-an-introduction-to-neural-networks-d49f22d238f9"
[//]: # "Stroetmann Skript"

## Artificial Intelligence lifecycle {#sec:aicycle}

## DevOps for Artificial Intelligence {#sec:devopsai}
