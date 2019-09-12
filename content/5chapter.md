

# Discussion {#sec:discussion}

In this chapter, the results described in chapter \ref{sec:result} will be compared and discussed. In doing so, the criteria defined in chapter \ref{sec:catalogue} will serve as a basis to evaluate the scope, usability, flexibility, and simplicity of the different approaches for building a pipeline. After that, an outlook will be given, in which future opportunities with such technologies and potential for improvement will be discussed.

## Pipeline comparison {#sec:pipelineeval}

During this work, two frameworks - Azure Machine Learning service and Kubeflow - has been used to build an example pipeline. Additionally, these frameworks have been evaluated and tested for additional required functionalities for fulfilling the needs of DevOps for Machine Learning described in chapter \ref{sec:devopsai}. The results of these tests will be evaluated in this chapter on the basis of chapter \ref{sec:catalogue}.

The first factor is the simplicity of the frameworks so that Data Scientists can focus on their main work instead of infrastructural setups and coding. For that, the Azure Machine Learning service offers an easy way to build a working pipeline from scratch quickly. The workbench is easily created via the Azure dashboard. For the most basic steps of AI development, there are preexisting components defined, which can be added to the pipeline by simply dragging and dropping them to the workbench. The in- and outputs can be connected by connecting the input of one component with the output of another. Also, the configurations can be made directly on the visual interface. So there is no need for coding experience at all, and the interface is easy to use.

Kubeflow, on the other hand, needs some knowledge of Kubernetes deployments to deploy the Kubeflow framework on Kubernetes. This can cause several problems, for example with the DNS resolution, some crashing pods or unavailable ports as the preparation of this project pointed out. After the preparations are done or an available Kubeflow deployment can be used, it offers some predefined pipelines, which can be used for similar tasks as its original purpose. However, if the developer wants to build an individual pipeline, this pipeline needs to be built from scratch. This requires coding skills because the pipelines are written in Python with the Python SDK. If the developer also needs specific components as Docker containers, which are not publicly available, these need to be coded as well. Additionally, Docker skills are required to build the containers of these components. Compared to the Azure Machine Learning service, all this is more complicated and time-consuming.

Another factor to be included in the evaluation was the option to adapt it to new frameworks and technologies enveloping over time. In the case of the Azure Machine Learning service, this completely depends on Microsoft's support for these, because the whole environment depends on the Microsoft Azure cloud. This means that the developer does not have to care about its deployment, technologies, security, and efficiency, but can not decide what to use for himself. 

Kubeflow mainly depends on two technologies - Kubernetes and Containerization. Which technologies, ML frameworks or tools to use beyond that is free choosable by the developer, because the components can be created completely independent from Kubeflow, so every upcoming technology can be used without worrying about compatibility.

Both frameworks have the possibility of using an IDE to handle the necessary code. In case of Azure ML service, this can be either done on the visual interface itself or via the Visual Studio SDK for Azure ML service. Kubeflow offers the opportunity to directly integrate and collaborate with Jupyter Notebooks running on Jupyter Hub. Alternatively, the components can be coded as containers in whatever IDE the developer prefers.

Another point is the support of data collaboration platforms so that it can be worked together on data as it is already possible with code. In Azure, the datasets are usually stored directly on their servers and can be uploaded. However, it is also possible to create nodes, which connects to data services like Hive Query or Azure Blob storage. With some of these tools, versioning and collaborating on the data is possible.

Because of Kubeflow components can be written flexible, it is also possible, that it accesses data from every online data collaboration platform, like Quilt or Git LFS. This also enables the possibility to versionize the data.

Also, both approaches offer the opportunity to pass on some parameters to influence the data preparation, building, and training of the model. In case of Kubeflow, these parameters can be defined by the developer, in case of Azure ML service these are predefined, so not everything is configurable.

The factor of scalability is met in both cases as well. Azure ML services run on a scalable cluster on the Azure Cloud. This cluster scales automatically depending on the necessary resources for each step. Kubeflow, on the other hand, runs directly on any Kubernetes cluster. This enables scalability, as well. The resources can even be specified by the users if need be.

The visualization of the results is good in both cases. Azure ML pipelines offer a visualization directly on the interface and give every necessary information as can be seen in chapter \ref{sec:azurepip}. The visualization of Kubeflow has to be enabled by adding an artifact to the corresponding stage. The way of visualizing the results is then up to the developer.

Last, the scope of functionality has to be compared. Azure ML pipeline offers some predefined components, which makes it very easy to use. However, in exchange for its simplicity, there are not enough components to fulfill every possible need. For this Azure ML offers the possibility to insert Python scripts as a component. Still, the usage of those is not as flexible as it has to be to enable the developer to build the pipeline flexibly. Also, the in- and output of the components is very strict, and the model architecture can not be chosen freely. This can lead to some trouble, for example, because the Classifier model is not compatible with multiple columns as labels. This eliminates the opportunity to encode the categories with *One-Hot-Encoding* and aggravates the performance of the resulting model.

Kubeflow, on the other hand, offers full flexibility and functionality, because the components can be created in the way the developer chooses. This requires some coding skills of the developer but enables a flexible pipeline without any compromise of functionalities compared to local building and training a model. 

The result of the Fashion-MNIST dataset is an accuracy of 89% 

All in all, these two frameworks are built for different use-cases, and both serve their purposes well. Azure ML service is for a quick building of a pipeline, which only supports the most basic steps. So it is a good way to choose if some uncomplicated model should be built, which does not need a lot of special configurations. 

Kubeflow, on the other hand, offers the developer a free choice of tools and frameworks being used, so that there is no loss in functionality. Additionally, it offers the user to set a period of time, in which the pipeline will be triggered automatically. This enables a good way to continuously improve the model by continuously updating the dataset and automatically rebuild the model sequentially. 
In return, the building effort is even a bit higher compared to local development. This is why using Kubeflow pays off if some components can be reused, and not everything has to be built from scratch over and over again. However, if a long term project needs similar components for several models, which should be continuously improved, the effort to build this pipeline may be worth it.

## Outlook {#sec:outlook}

In the future, Machine Learning will be more and more important, and more and more complex systems will be built. This requires automated development and delivery processes, which is the reason why DevOps for Machine Learning will arise even more over time. 

ML projects in the future need to be even more scalable because the demand and the complexity of AI will rise, which needs even more resources. At the same time, the development of such models will be getting more complex because of the rising possibilities of AI. This needs practices to keep up with collaborative, organized, and flexible development as there is already for common software development.

Kubeflow or Azure Machine Learning service can be a part of the solution in the future to automate the development and delivery processes. However, both do not offer a complete solution because things like a collaborative data platform are supported but note directly integrated. Additionally, both systems have their problems to deal with. In case of Azure Machine Learning service, this is missing functionality and flexibility, in case of Kubeflow flexibility and functionality is given but in return, the development of such a pipeline is still comparatively complex, and the system is not too easy to handle. 

This is why there is no final solution for DevOps for Machine Learning yet. There are still a lot of things to do, like combining good data and model versioning with an easy way to automate the development and deployment. Kubeflow is on a good way to handle most of the things, but the system is still pretty complex. However, Kubeflow is still in development and far from finished, so there is a good chance, that it will evolve as a good possibility to support big Machine Learning projects in the future.