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

In this chapter the used frameworks for creating such a pipeline will be introduced. Also Tensorflow, a Machine Learning framework, will be described shortly, with which the resulting models will be trained. Then it will be described how to create the necessary environment for using these frameworks, locally as well as on a Cloud.
Last, a concrete use case will be described, which will be implemented in chapter \ref{sec:result}.

### Tensorflow

To perform modern Deep Learning operations there is no need to program a complete Neural Network on his own. There are several frameworks available, many of them are open sourced. One of the most popular ones is Tensorflow.

Developed by Google as the successor of DistBelief, it has been open sourced in 2015. Tensorflow is a large scale Machine Learning framework. Compared to DistBelief, the first generation of Googles ML frameworks, it offers a more flexible platform with better performance, which also supports a broader range of models and heterogenerous hardware platforms, so that it supports mobile, \acs{GPU}s or clusters among others. This makes Tensorflow to one system for all scales, which leads to significant less maintenance burdens in the operation cycle.
Additionally Tensorflow achieves parallelism through replication and parallel execution, which raises the performance significantly.

Tensorflow supports a very diverse range of tasks, starting with inference of computer vision models on mobile phones to large-scale training of deep neural networks with hundreds of billions of parameters on hundreds of billions example records using many hundreds of machines. [@paper]

For the model building Tensorflow offers the possibility to use high level \acs{API}s like Keras. Keras is written in Python and supports different Machine Learning frameworks like Tensorflow, \acs{CNTK} or Theano. It work on CPUs as well as on GPUs and offers an easy and fast prototyping. 

For building a model, Tensorflow uses a programming model with directec graphs composed of a set of nodes. A graph represents a dataflow computation. Each node of a graph has zero or more inputs as well as zero or more outputs. It represents the instantiation of an operation. 
The values, that flow along normal edges in the graph, are called tensors. This can be compared to weights of the Neural Networks explained in chapter \ref{sec:nnmodels}.

To create a model, Tensorflow offers APIs for several programming languages like Python, Java, C++, Swift, JavaScript or Golang. To use this API, first, TensorFlow needs to be imported. Also, the dataset has to be prepared and loaded into the application. Assume this dataset is stored into the variable `data`, the dataset can be splitted into training and validation set as can be seen below:

```
(x_train, y_train), (x_test, y_test) = dist.load_data()
```

The epithet `x` datasets are for the input, the `y` datasets for the labels. After that, keras can be used to build a model. For this, first, there need to be added some layers. In this example 

```
model = tf.keras.Sequential([
    tf.keras.layers.Flatten(input_shape=(28, 28)),
    tf.keras.layers.Dense(128, activation='relu'),
    tf.keras.layers.Dense(10, activation='softmax')
])

model.compile(optimizer=tf.keras.optimizers.RMSprop(),
                loss=tf.keras.losses.SparseCategoricalCrossentropy(),
                metrics=[tf.keras.metrics.SparseCategoricalAccuracy()])
```

### Kubeflow

As mentioned in chapter \ref{sec:aicycle} Machine Learning development consists out of more than just building a model. It also includes preparing and cleaning data, testing, scaling and deploying the model. An automation of those steps would lead to a significant performance increasement.

However, the different steps of Machine Learning often require completly different environments, which complicate the portability. Additionally the used hardware differs a lot from step to step, which is the reason why scalability is an emminent point of efficient ML. All this makes the automation process much harder.

These problems can be solved by using Kubernetes. The reliability and performance, that Kubernetes offers, fits Machine Learning development perfectly, so the community started to utilize these benefits. 

In doing so there are several challenges that need to be faced while trying to bring Machine Learning applications to Kubernetes - the creation of the deployments as well as the managing of the services introduced huge barriers of complexity for data scientists, whose main work should be working with the data instead of caring about the delivery process.

For facing these challenged Kubeflow has been created 2017. Kubeflow is an open-source platform for Machine Learning with the objective to enable composable, postable and scalable ML on Kubernetes. The features offered by Kubeflow include a Jupyter Hub for collaborative and interactive training, a TensorFlow training ressource and serving deployment as well as delivery pipelines with Argo Workflows.

Argo Workflows is an open-source container-native workflow engine with the objective to orchestrate parallel jobs on Kubernetes. With Argo workflows can be defined. Each step of such a workflow is designed as a container. This way Argo can run CI/CD pipelines on Kubernetes.

With the help of Argo Workflow Kubeflows offers a pipeline, which enables managing and tracking experiments, jobs and runs in an multi-step ML workflow. In such a all of the components of a ML workflow are included. This also requires the definition of the input parameters and delivers an output for each component. This component is a set of a containerized code and performs one single step in th epipeline.

For creating such a pipeline each single component has to be created as a container and then the pipeline can be defined with the help of the Python SDK. Such a pipeline can look as below:

```
def gcs_download_op(url):
    return dsl.ContainerOp(
        name='GCS - Download',
        image='google/cloud-sdk:216.0.0',
        command=['sh', '-c'],
        arguments=['gsutil cat $0 | tee $1', url, '/tmp/results.txt'],
        file_outputs={
            'data': '/tmp/results.txt',
        }
    )


def echo_op(text):
    return dsl.ContainerOp(
        name='echo',
        image='library/bash:4.4.23',
        command=['sh', '-c'],
        arguments=['echo "$0"', text],
    )


@dsl.pipeline(
    name='Exit Handler',
)
def download_and_print(url=''):

    exit_task = echo_op('exit!', is_exit_handler=True)

    with dsl.ExitHandler(exit_task):
        download_task = gcs_download_op(url)
        echo_task = echo_op(download_task.output)
```

There, first, the two components has been defined. Within these components some parameters are defined. First, the input parameters need to be given. In this example the first step is to download an image, so the `url` has to be given as input parameter. Then the component needs to be defined with several parameters. Except for the name these are the used Docker image, commands and arguments to be executed and the output of this step. In this example, the given file is downloaded and the component forwards the output file to the next step. In this step the content of this fill will be printed.

Then the pipeline itself is defined. The input of this function represents all the values the user has to enter as inputs for the pipeline. In this example this is only the url of the file to be downloaded. Then the different steps are defined and the inputs are forwarded. The output is stored in the variable `task_name.output`, so that other components can access and use it. 

Last the pipeline needs to get compiled with the Python SDK. Then the pipeline is created and can be uploaded to and executed with Kubeflow. How this works will be explained in detail with the help of an example in chapter \ref{sec:kubeflowpip}

### Azure pipeline

An alternative to an open-source solution like Kubeflow are Cloud integrated solutions. Every Cloud provider is developing an own solution for this problem, which becomes more and more important through time. So is Microsoft providing a Cloud based environment to develop, train, test, deploy, manage and track ML models with its Azure Machine Learning service.

Azure Machine Learning service supports different ML frameworks like PY Torch, TensorFlow and Scikit Learning for any kind of Machine Learning. To offer support over the whole ML development cycle, it offers the use of different tools like a visual interface for building experiments and deploying models, a jupyter notebook to write the code or a Visual Studio Code extension to integrate the service directly into an IDE.

This extension offers the user to create a team workspace which enables the possibility of Collaborative Development. The experiment can then linked to the Cloud, on which this can then be run, computed and monitored. The resulting model can then be registered to the Workspace, so that it is persisted and can be used from other team members.

The Azure Machine Learning service also provides a Python SDK, with which the user can start training his model locally and then scale out to the Cloud.

With building a pipeline with the Azure ML service it allows the user to automate the end-to-end ML process in the Cloud and reuse components. Also the user can use different compute resources in each step, which increases the efficiency and lowers the cost of ML tasks, because not every step in the ML workflow requires the same amount of resources. 

An example how this service can be used will be described in chapter \ref{sec:azurepip}.

## Use case of this work

## Creating the necessary environment {#sec:environment}

To use Cloud integrated solutions the installation and access process can be done easily by clicking through the Cloud console. However, the installation of an open-source tool like Kubeflow can be more complicated.

Another challenge can be to create a local Kubernetes cluster to test the development processes on your local system first.

How these installations can be done is described in this chapter.

### Minikube

One important principle of DevOps is to design the environemnts in a way, that they behave as similar to the production environemnt as possible. Because of the decision to deploy the product inside of containers on a Kubernetes cluster, it is necessary to setup such a cluster on a local system.  Currently there are two popular solutions for this - Minikube and microk8s.

Minikube can start a Kubernetes cluster on the local device either within a \acs{VM} or without a VM directly on the system. Microk8s always start the cluster directly on the system.

The advantage of a cluster running on the VM is the isolated environment. Additionally the available ressources can be precisely defined by the developer, so that the cluster can not request too much ressources needed for the system itself. On the other hand it can be more difficult to access the systems resources such as GPU and it is more static in resource allocation.

An advantage of microk8s compared to Minikube is the easy possibility to configure the cluster for the use of GPU with a single command. In case of Minikube the Docker environment has to be changed for doing so.

However, microk8s is still in development and unstable, which lead to some trouble with deploying Kubeflow on it during the implementation process of this work. This is the reason why Minikube has been used to realize the local creation of a cluster.

For doing so, first, Minikube has to be downloaded. This can be done on Linux Ubuntu by executing following commands:

```
$ curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
$ chmod +x minikube
$ sudo cp minikube /usr/local/bin && rm minikube
```

First it downloads the latest minikube version for Linux. Then it changes the execution privileges and moves the downloaded sources to the`usr/local/bin` directory.

Then a special version of Docker must be downloaded to support the use of nVidia GPUs. This version is called nvidia-docker2 and be installed like this:

```
$ curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | \
sudo apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
sudo tee /etc/apt/sources.list.d/nvidia-docker.list

$ sudo apt-get update
$ sudo apt-get install -y nvidia-docker2
```

First the gpgkey is added to the Linux packaging tool. Then the packaging tool has to be updated before nvidia-docker can finally be installed.

After this the default Docker runtime has to be changed in the file `/etc/docker/daemon.json`. In there the line 

```
"default-runtime": "nvidia",
```

has to be added at the beginning of the file. Afterwards Docker needs to be restarted:

```
$ service docker restart
```

Last Minikube can be started with GPU support through executing following command:

```
$ minikube start --vm-driver=none --apiserver-ips=127.0.0.1 --apiserver-name localhost --cpus 4 --memory 4096 --disk-size=15g
```

The vm-driver is set to none and the apiserver is set to localhost. Then the needed resources are defined. In this example 4 cpu cores, 4GB f memory and 15GB of disk space are sufficient.

With this setup Minikube can run on a local system similar to a Kubernetes Cloud deployment, which enables the possibility to develop and test against a system, which looks very much like the production system.

### Kubeflow

No matter if using a local Kubernetes cluster or one on Cloud Kubeflow needs to be deployed on the cluster. For the purposes described in chapter \{sec:usecase} only the pipeline part of Kubeflow is needed, which is why in this chapter only the installation of this part will be explained.

This installation can be done by applying the YAML manifest provided inside the Kubeflow Github repository to your Kubernetes cluster. For that, first, the wished version needs to be defined before it can get applied

```
$ export PIPELINE_VERSION=master
$ kubectl apply -f https://raw.githubusercontent.com/kubeflow/pipelines/$PIPELINE_VERSION/manifests/namespaced-install.yaml
```

Then the namespace is created and every service and deployment gets installed and deployed. The status of the pod creation can be checked by executing 

```
$ kubectl get pods -n kubeflow
```

As soon as every pod is up and running, the port of the pipeline \acs{UI} (\acl{UI}) needs to be forwarded:

```
$ kubectl port-forward -n kubeflow svc/ml-pipeline-ui 8080:80
```

Finally, the Kubeflow UI can be accessed by opening `localhost:8080` on the browser. Now pipelines can be uploaded and experiments with them can be executed on Kubeflow.