# Method - State of the Art {#sec:method}

In chapter \ref{sec:devopsai} DevOps practices have been adopted to the new world of AI development. One essential technologie to meet those requirements is a delivery pipeline, which accompanies the entire development and deployment process. In this chapter, first criteria will be defined to measure the success of a pipeline. Then some  exemplary frameworks to create such a pipeline and other basic frameworks necessary for the development process will be introduced before it will be explained how to prepare the necessary environment for such frameworks and how to use them. Last, an exemplary problem will be created, whose solution will be presented in chapter \ref{sec:result}.

## Catalogue of criteria {#sec:catalogue}

For defining the criteria to measure the success of a delivery pipeline framework for AI development this chapter will be oriented on the adopted and extended practices described in chapter \ref{sec:devopsai}. 



First, it is important to mention, that people, who are dealing with these huge amounts of data are usually other people with different skills than those, who are usually dealing with IT operations. These Data Scientists are not mandatory skilled or even experienced with the delivery and operation of Software. This is why a framework for building such a pipeline should be easy to use and standardized as far as possible. The Data Scientists should have an easy time to set up the development environemnt, get familiar to the framework, and learn about the companies culture and working methods.

Besides an easy way to use such a delivery pipeline tool, it is also necessary that it is adoptable to other frameworks and technologies. This should be one of the main objectives, because technologies are changing quickly, especially in the field of AI. What is the most common tool nowadays can be completly outdated in a few weeks when a new innovation breaks through. This is why tools for handling these technologies should be as adoptable as possible, so that only small adjustments are necessary to change the basic framework or similar.

Another essential point for the developers, that is different from traditional software development, is the missing IDE integration. Because of some necessary scripts to handle the data during the delivery process an integrated development environment would be helpful to support the Data Scientist in integrating the script within the delivery pipeline. An example for that would be an integration of Jupyter Notebooks.

Probably the most important point is a collaboration platform for the data, so that an entire team can work on them at the same time as it is already common with code. An additional versioning of the data would be welcomed as well.

Additionally it would be necessary to give along some parameters when starting the delivery process, for example the base model or values for the hyperparameters.

To enable scalability to the delivery process, especially for the training step, the support of a cluster like Kubernetes would be needed. For this every operation has to be containerized, so that it can run on the Cluster. Ideally, the execution on Kubernetes or a similar cluster is directly integrated.

For a good evaluation of the resulting model a good visualization of the testing results is desirable. The developer has to be able to see the results and react accordingly. An configurable, automated decision system would be optimally, so that the developer can adjust the threshold above which the model will be deployed. If the result is below this threshold it will either be rejected or adjusted with different parameters.

Last, also the resulting model should be possible to versionize, so that in case of upcoming errors or issues it is easy to jump back to an older, proven model for the production use. 

With those criteria the success of a framework and an according delivery pipeline will be measured at the end of this work. If every requirement is met it can be considered as successfull framework for applying DevOps principles to the development and delivery process of AI.

## Used frameworks and libraries {#sec:libraries}

### Tensorflow

### Kubeflow

### Azure pipeline

## Creating the necessary environment{#sec:environment}

### Minikube

### Kubeflow