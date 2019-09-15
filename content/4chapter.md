

# Result - Pipeline Creation {#sec:result}

In chapter \ref{sec:devopsai}, the basics of DevOps for ML have been discussed and explained. One crucial point of this is a pipeline, which supports the development of AI product during the whole development lifecycle. The goal is to automate the single steps and to build reusable components so that the focus of work can lay on the main work with the data. Different approaches are existing for such a pipeline. In this chapter, two of these will be explained and implemented. The first one will be a visual interface of the Machine Learning Service by Microsoft Azure. With this interface, the single components can be selected and linked together, so that the single steps to build an AI model can be automated with this pipeline. The second approach is called Kubeflow. Kubeflow is an open-source framework running directly on Kubernetes, with which components can be written in Python and linked together within a pipeline with the Kubeflow \acs{SDK} (\acl{SDK})  for Python. 

## Azure pipeline {#sec:azurepip}

With the Azure Machine Learning service, Microsoft offers different ways for automating Machine Learning. One of these is a visual interface for building the single development steps as components and connect them such, that an automated pipeline is enveloping. 

The only requirement for this is an activated account on Microsoft Azure. Then the user can create a new Machine Learning Service workspace directly on the dashboard. From this workspace, the user can launch the visual interface for building a pipeline.

In this workspace, a bunch of different components is selectable. They are split into several categories:

- Saved Datasets for selecting the dataset to be used
- Data Format Conversions for convert the type of the dataset
- Data Input and Output for manually importing or exporting data
- Data Transformation for manipulating, sampling, splitting and scaling datasets
- Machine Learning for building, training and evaluating models
- Python/R Language Models for adding scripts that deal with the datasets or models
- Text Analytics for processing and preparing texts for Machine Learning
- Web Service for connecting web services

For the described objective above, first, the dataset created in \ref{sec:objective} has to be imported. For that, this dataset has to be uploaded via the New Dataset dialog. Then this dataset can be selected from the category `Saved Datasets/My Datasets`. The component can then be dragged to the workspace.

First, the columns, with which the work will be done, has to be chosen. With the component `Select columns in Dataset,` this can be done quickly. The dataset output has to be connected to its input, and then the columns can be selected in the configs of this component. By clicking on a component, some configurations can be made. For this component, all the columns to be worked with can be selected as can be seen in \ref{fig:selcols}. The output will then be connected to the next step.

In this case, this is the cleaning of the data. For this, there is a corresponding component in the category `Data Transformation / Manipulation`. After dragging it to the workspace, it has to be chosen, which columns should be tested for missing data. Because in the used dataset, every single cell is required to have a value, every column is being selected. Then it has to be set, what should happen with faulty rows. There are six options that can be performed: Removing the entire row when a missing value occurs within this row; Removing the entire column when a missing value occurs within this column; Replacing it with the mean, median or mode value or replacing it with a user-specified value.

There are not many missing values within this huge dataset so that the removing rows influence the overall performance of the creating model noticeably. Because of this and for simplicity reasons, the method to remove rows with missing values has been chosen.

Next, the data need to be normalized, which means that the values of the single pixels, which lay between 0 and 255, should be transformed into a value between 0 and 1. This can be done with the `Normalize Data` component. There the *MinMax*  transformation method has been chosen, which has been described in chapter \ref{sec:sec:aicycle}.

Other possibilities would have been Zscore, Logistic, LogNormal, or TanH.

After that, the data has been prepared. However, the features can be improved with Feature Engineering. One example is to encode the categories so that they are given as numbers instead of strings. For that, there is no specific component existing, so it can only be done by writing and adding a Python script. The Python Script component can get three inputs - two datasets and a script bundle as *zip*  for providing necessary methods. The script to encode the data can look as follows:

```
import pandas as pd
from sklearn import preprocessing 

def azureml_main(df = None, df2 = None):
    label_encoder = preprocessing.LabelEncoder() 
  
    df['label']=label_encoder.fit_transform(df['label']) 
    df['label'].unique() 
        
    return df
```

The encoding is being done with the help of Scikit-Learn and assigns every category a number. Then the new data frame is returned and is used as output. A second data frame could have been returned as well and function as a second output of the component, but in this case, there is only one data frame necessary as input as well as output.

Now the data needs to be split to a training dataset and a testing dataset. The `Split Data` component provides this functionality and only needs to be connected to a data frame as input. Then the size of the training set can be configured, and it gives both datasets as output - training as well as testing.

After that, every necessary step has been completed to start the training of the model. However, for this, a model needs to be built before. Because this model-building needs no input, it can be done parallel to preparing the data. For the model building, there are several components with different models. For this image classification task, a `Multiclass Neural Network` is the component to use.

There, the number of hidden nodes, the learning rate, the number of learning iterations, and the momentum can be configured. For this example, 128 hidden layers have been used, and 100 iterations have been made. The learning rate, so the size of the step taken at each iteration, has been set to 0.1. The momentum, which is a weight to apply to nodes, has been set to 0 because there are no previous iterations to take this information from.

Then the `Train Model` node can be added to train the model. For this, it needs the model on the one hand and the dataset on the other hand as input. Additionally, the target column has to be chosen, which should be predicted by the model. In this dataset, this target column is the *label* column.

After the training is finally done, it can be evaluated. For that, first, it needs to get scored via the `Score Model` node with the model and the test data as input. The result of this can then be visualized with the `Evaluate Model` component. 

The resulting pipeline then looks as can be seen in Appendix \ref{sec:azurepipeline}. 

This can be run on an Azure cluster by clicking Run. After it has been completed, the result of the evaluation can be seen by right-clicking the output of the `Evaluate Model` component and selecting *Visualize*. This looks like below:

![Microsoft Azure Machine Learning Service evaluation](images/chapter4/azure_evaluation.png){ width=500px #fig:azureevaluation}

As can be gathered from figure \ref{fig:azureres}, the accuracy of the resulting model is about 89%. If this is considered good enough, it can now be connected to a Web Service or similar. Otherwise, some parameters can be edited, or additional steps can be added to improve the model further. This makes this pipeline very easy to use to build models with existing data quickly.

## Kubeflow pipeline {#sec:kubeflowpip}

Another approach is to build a pipeline with an open-source framework like Kubeflow. Kubeflow provides a Python \acs{SDK} for building pipelines and a visual interface running on Kubernetes for starting and controlling them.

The creation of a pipeline is broken down into two steps - the definition of the single components and the assembling of those to the pipeline.

For every component, there must be a Docker container, which performs the necessary calculations and actions. Data can be forwarded to these data by parsing arguments to it.

To explain the process of building pipelines, first, the single components will be shown and explained. Then the creation of the pipeline, including the definition of the components as well as the assembling, will be described.

First, the whole AI development process has to be split into several steps. Every single step needs its own container. For the described objective from chapter \ref{sec:objective}, the steps of AI development described in chapter \ref{sec:devopsai} will be applied. This means that the process can be split into the following steps:

- Data preparation
- Feature Engineering
- Data Split
- Model building 
- Model Training
- Model evaluation

These will be investigated and described first before the creation of the pipeline itself will be explained.

### Components

During the preparation steps the initial dataframe gets loaded and manipulated such, that there are no missing or faulty values and, that the data has been normalized. This has been realized with following Python script:

```
def main():
    parser = argparse.ArgumentParser(description="Preprocessing")
    [...]
    args = parser.parse_args()

    df = load_data(args.dataset_location)

    df = unify_datatypes(df)

    df = remove_mis_values(df)

    df = remove_faulty_values(df)

    df = normalize_values(df)

    df.to_csv(args.output, index=False)

    write_file("/prepdf_output.txt", args.output)
```

There the main function gets started when the file is executed. This function first adds some input parameter. In this, there are two - the location of the original dataset, on which the transformations should be done, and the output location of where to store the resulting, cleaned dataset.

After that, first, the dataset is being loaded into the script. Then the datatype gets unified because some columns are recognized as Integer and some as Floats. For this, every column being recognized as Integer is converted to a Float and the appropriate field gets overwritten.

```
def load_data(path):
    return pd.read_csv(path)
    
def unify_datatypes(dataset):
    for col in dataset.select_dtypes("int64"):
        dataset[col] = dataset[col].astype("float64")
    return dataset
```

Next, rows with missing values are being removed. For this, every empty cell is being replaced with a missing value sign. Then all of them gets removed by the `dropna` function provided by the *pandas* library.

```
def remove_mis_values(dataset):
    dataset.replace('', np.nan, inplace=True)
    dataset = dataset.dropna()
    return dataset
```

Also, rows with faulty values have to be removed. For this, the rows have to be removed, in which the label does not equal one of the valid categories. These have been defined in the `CATEGORIES` array. This is done by only keeping the rows which label is included in this array::

```
CATEGORIES = ['top', 'trouser', 'pullover', 'dress', 'coat', 'sandal', 'shirt', 'sneaker', 'bag', 'ankle_boot']

def remove_faulty_values(dataset):
    dataset = dataset[dataset.label.isin(CATEGORIES)]
    return dataset
```

The last step is to normalize the data. For this over every cell excluding the label cell is being iterrated and every value is divided by 255.0:

```
def normalize_values(dataset):
    for col in (col for col in dataset.columns if col not in ["label"]):
        dataset[col] = dataset[col] / 255.0
    return dataset
```

This can be done because every value lays between 0 and 255, so that the MinMax equation results in:

\begin{equation}
z = \frac{x-\min(x)}{[\max(x) - \min(x)]} = \frac{x-0}{[255 - 0]} = \frac{x}{255}
\end{equation}

Last, the dataframe is saved as *CSV* and the output location is stored to the given output file:

```
def write_file(path, content):
    f = open(path, "w")
    f.write(content)
    f.close()
```

This needs to be done because Kubeflow uses txt files to transfer the location of stored files to the next component.

The next component should deal with the feature engineering to optimize the features and labels for the training process. For example, in the described case it could be helpful to transform the label of the cateogory to a numerical value. The performance of the resulting model can be further improved by applying One-Hot-Encoding described in chapter \ref{sec:aicycle}. This can be done with following script:

```
def main():
    parser = argparse.ArgumentParser(description="Feature engineering")
    [...]
    args = parser.parse_args()

    df = load_data(args.dataset_location)

    df = one_hot_encoding(df)    

    df.to_csv(args.output, index=False)

    write_file("/findf_output.txt", args.output)
```

First, the arguments are added. These are once again the location of the dataset and the output location of the resulting dataset. Then the data gets loaded the same way as in the data processing component.  Afterward, the one-hot encoding is being executed.

For this the *pandas* library can be used to grab the different categories, building an own column for each of them and filling the cells with either 1 or 0, dependent on whether the cell had equalled the according value before. Then the original label column gets dropped and the resulting columns of the described operations are joined to the dataset:

```
def one_hot_encoding(dataset):
    one_hot = pd.get_dummies(dataset['label'])
    dataset = dataset.drop('label',axis = 1)
    dataset = dataset.join(one_hot) 
    return dataset
```

Afterward, the dataset is stored into a *CSV* file and its location to a *txt* file the same way as at the end of the data preparation component.

The last part of handling the data is to split it into different sets - training and testing. Following scripts takes over that task:

```
def main():
    parser = argparse.ArgumentParser(description="Feature engineering")
    [...]
    args = parser.parse_args()

    df = load_data(args.dataset_location)

    image_df, label_df = split_label_and_img(df)

    images_train, images_test, labels_train, labels_test = train_test_split(image_df, label_df, test_size=args.test_size, random_state=args.random_state)

	images_train.to_csv(args.output_train_img, index=False)
    labels_train.to_csv(args.output_train_label, index=False)
    images_test.to_csv(args.output_test_img, index=False)
    labels_test.to_csv(args.output_test_label, index=False)

    write_file("/trainimg.txt", args.output_train_img)
    write_file("/trainlabel.txt", args.output_train_label)
    write_file("/testimg.txt", args.output_test_img)
    write_file("/testlabel.txt", args.output_test_label)
```

In this script, first, the required arguments are defined. On the one hand, these are the locations of the input as well as the resulting datasets. On the other hand, also the size of the testing set and a random state, with which different compositions of the datasets can be created, has to be given as a parameter.

Then the dataset is being loaded as described above, before the labels and the image informations are split. For this, two datasets are created - one, which consists of all columns, that includes the keyword *'pixel'*, and one of all columns, that does not include this keyword:

```
def split_label_and_img(df):
    images = df.drop([col for col in df.columns if 'pixel' not in col ], axis='columns')
    labels = df.drop([col for col in df.columns if 'pixel' in col ], axis='columns')

    return images, labels
```

Next, the `train_test_split` function included in the *Scikit-Learn* library can be used to split those datasets into testing and training sets. These are then stored as four different files - the training images, the training labels, the testing images, and the testing labels. The output location is then written to a *txt* file once again.

Parallel to this data preparation, also the model has to be prepared. The layers has to be defined and the model needs to be compiled. Following script offers such functionalities:

```
def main():
    parser = argparse.ArgumentParser(description="Feature engineering")
    [...]
    args = parser.parse_args()

    model = build_model((args.input_shape_height, args.input_shape_width), args.num_units, args.num_outputs, get_activation_func(args.activation_l2), get_activation_func(args.activation_l3))

    model.compile(optimizer=args.optimizer,
        loss=args.loss,
        metrics=[args.metrics])

    model.save(args.output)

    write_file("/model.txt", args.output)
```

First, several arguments are passed. These are the input shape of the images, the number of units in the hidden layer, the number of output categories, the activation functions for the different layers and optimizer, loss and metrics parameters for compiling the model. Then the model needs to be built. For this, Keras is being used to define the single layers and enters all the parameters:

```
def build_model(input_shape, num_units, num_outputs, activation_l2, activation_l3):
    return keras.Sequential([
        keras.layers.Flatten(input_shape=input_shape),
        keras.layers.Dense(num_units, activation=activation_l2),
        keras.layers.Dense(num_outputs, activation=activation_l3)
    ])
```

To get the activation functions, the `get_activation_func` function gets a string of the functions name and returns the function itself. After that, the model needs to be compiled with the loss function, the optimizer, and the metrics to be used. This model is then saved and its location stored into a *txt* file.

Alternatively a prexisting and possibly pretrained model can be downloaded. One example for this can be found in the following script:

```
def main():
    parser = argparse.ArgumentParser(description="Feature engineering")
    [...]
    args = parser.parse_args()

    model = download_model((args.input_shape_height, args.input_shape_width))

    model.save(args.output)

    write_file("/model.txt", args.output)
```

There, only the input shape and the location of where the downloaded model should be stored has to be parsed as a parameter. Then the model can be downloaded with the given input shape and gets stored afterward.

No matter if the model has been built from scratch or a preexisting model has been downloaded, the next step is to train the model by feeding it with some data.

```
def main():
    parser = argparse.ArgumentParser(description="Feature engineering")
    [...]
    args = parser.parse_args()

    train_img_raw = load_data(args.input_train_img)
    train_label = load_data(args.input_train_label)

    train_img = prepare_image_shape(train_img_raw, args.input_shape_height, args.input_shape_width)

    model = load_model(args.model_location)
    model.fit(train_img, train_label, epochs=args.epochs)

    model.save(args.output)

    write_file("/trained_model.txt", args.output)
```

For doing this, the script needs the location of the image as well as the label dataset and of the basic as well as the resulting model. Additionally, it needs to know about the input shape for the images and the number of epochs, which means the number of iterations of feeding the model with data to complete for the training. Afterward, the data gets loaded, and the images get shaped correctly:

```
def prepare_image_shape(imageset, shape_height, shape_width):
    return np.array([img.reshape(shape_height,shape_width) for img in imageset.values])
```

For this, the `reshape` method for arrays of the *numpy* library can be used. Then the model is loaded too, and it can be fitted with the loaded and prepared data. Last, this model gets stored, and its output location is written into a *txt* file.

The last step is then to evaluate this model. For this it needs the same parameters as for training the model with the only difference, that it gets the location of the testing datasets instead of the training datasets:

```
def main():
    parser = argparse.ArgumentParser(description="Feature engineering")
    [...]
    args = parser.parse_args()

    test_img = load_data(args.input_test_img)
    test_label = load_data(args.input_test_label)

    test_img = prepare_image_shape(test_img.values, args.input_shape_height, args.input_shape_width)

    model = load_model(args.model_location)

    loss, acc = model.evaluate(test_img, test_label)

    store_loss_acc(args.output, loss, acc)

    write_file("/result.txt", args.output)
```

Then all the data gets loaded, the images prepared and the model evaluated. During this operation, the accuracy, as well as the loss, are getting calculated. After the evaluation has been finished, these information are written to an artifact, so that it can be visualized in the pipeline:

```
def store_loss_acc(file, loss, acc):
    metadata = {
        'outputs' : [
        {
            'storage': 'inline',
            'source': '# Results\n Accuracy: {} \n Loss: {}'.format(acc, loss),
            'type': 'markdown',
        }]
    }
    with open (file,'w') as f:
        json.dump(metadata, f)
```

For this a \acs{JSON} is being created, which stores the results in markdown format. This is then written to the output file, which can be used by the pipeline to visualize this markdown.

With all these components being created, these need to be packed into a Docker container. For this, a Dockerfile is necessary, which has to look similar to the one below:

```
FROM Python:3

COPY ./requirements.txt .

RUN pip install -r requirements.txt

COPY ./data_preparation.py .

ENTRYPOINT ["python", "/data_preparation.py"]
```

The base image of the Docker containers is a plain Python image. On top of it, the requirements are getting installed, which includes every necessary library and framework, and then the script itself is being loaded into the Docker container. This file then represents the entrypoint of the container with the possibility to pass additional arguments to it, so that every necessary information can be provided.

The Docker container of every component looks similar with the only difference that the components using Tensorflow are not built on a plain Python image, but on the latest Tensorflow image.

Then these Docker containers are build and finally pushed to a repository, from where they can be accessed by the pipeline.

### Building pipeline

With every container build and pushed the creation of the pipeline itself can start. For this, first, several components of the Kubeflow Python SDK needs to be imported:

```
import kfp
from kfp import components
from kfp import dsl
from kfp import onprem
```

Then the single steps or operations to be executed during the development have to be defined as functions. Such a function looks like below:

```
def data_prep_op(dataset_location, output):
  return dsl.ContainerOp(
    name='Data preparation',
    image='pascalschroeder/kf-dataprep',
    arguments=[
      '--dataset_location', dataset_location,
      '--output', output
    ],
    file_outputs={
      'output': '/prepdf_output.txt'
    }
  )
```

The function gets the necessary parameters as input. Then it returns a ContainerOperation, defined in the Kubeflow Python SDK, with a given name, the docker image to be used and arguments as well as file outputs.

The arguments have to equal the arguments, that have been parsed during the creation of the components. By defining these arguments in the definition of the operation, these arguments can be given to the pipeline and forwarded directly to the component, that needs this information. 

The file outputs represent the files being created, in which the information needed for the following steps are being stored.

Each of the components needs to have an operation defined looking like this or similar. Then these operations can be connected as can be seein in Appendix \ref{sec:kfpipelineimpl}

This pipeline first needs to define every parameter that will be used for one of the components. It also declares a default value in case the user will not change the information on the startup of the pipeline.

Then the single operations are being called. By calling these operations, every needed information is being forwarded as a parameter. To use an output of a previous step as new input, the according parameter of the outputs array of the previous step can be called.

In the example case, both should be tested - a new model built from scratch as well as a pretrained one downloaded from the internet. Different paths can be defined for these conditions depending on the results obtained.

After every step is defined and called the pipeline can be compiled with the Kubeflow SDK like this:

```
if __name__ == '__main__':
  kfp.compiler.Compiler().compile(pipeline, __file__ + '.tar.gz')
```

This only needs the file to be started usually and then created an archive, which can be imported to the Kubeflow dashboard.

After this have been done the created pipeline looks like can be seen in Appendix \ref{sec:kfpipeline}

The user can then start this pipeline. When starting it, the user can enter or change all the parameters defined above, as can be seen in Appendix \ref{sec:kfparameter}.

Finally, the pipeline gets started, and every single step will be gone through automatically. With the manipulated *Fashion-MNIST* dataset created in chapter \ref{sec:objective} the accuracy can be measured and lays at about 98% while a loss of about 5%. This result can be visualized with an artifact. This artifact file replaces the `file_outputs` field of the defined operation:

```
output_artifact_paths={
            'mlpipeline-ui-metadata': '/mlpipeline-ui-metadata.json',
    },
```

This output artifact then creates a visualization on the pipeline looking like below:

![Kubeflow artifact visualization](images/chapter4/visualization_kf.png){ width=400px #fig:kf_visualization}

This proves that the pipeline has been finished and can be used over and over again until a satisfying result comes out. Also continously improvement is enabled, because Kubeflow has a function integrated to sequentially repeat a run. When the data is continuosly updated this repeating run of the pipeline also improves the model with every new run, because of new data. The developer does not have to care about anything with that, because the model training is fully automated with Kubeflow.