
# Result - Pipeline Creation {#sec:result}

In chapter \ref{sec:devopsai} the basics of DevOps for ML have been discussed and explained. One eminent point of this is a pipeline, which supports the development of AI product during the whole development lifecycle. The goal is to automate the single steps and to build reusable components, so that the focus of work can lay on the main work with the data. For such a pipeline there exists different approaches. In this chapter two of these will be explained and implemented. First a visual interface of the Machine Learning Service by Microsoft Azure. With this interface the single components can be selected and linked together, so that the single steps to build an AI model can be automated with this pipeline. The second approach is called Kubeflow. This is an open source framework running directly on Kubernetes, with which components can be written in Python and linked together within a pipeline with the Kubeflow \acs{SDK} (\acl{SDK})  for Python. 

## Azure pipeline {#sec:azurepip}

With the Azure Machine Learning service Microsoft offers different ways for automating Machine Learning. One of this is a visual interface for building the single development steps as components and connect them such, that a automated pipeline is enveloping. 

The only requirement for this is an activated account on Microsoft Azure. Then the user can create a new Machine Learning Service workspace directly on the dashboard. From this workspace the user can launch the visual interface for building a pipeline.

There a bunch of different components is selectable. They are splitted in several categories:

- Saved Datasets for selecting the dataset to be used
- Data Format Conversions for convert the type of the dataset
- Data Input and Output for manually importing or exporting data
- Data Transformation for manipulating, sampling, splitting and scaling datasets
- Machine Learning for building, training and evaluating models
- Python/R Language Models for adding scripts that deal with the datasets or models
- Text Analytics for processing and preparing texts for Machine Learning
- Web Service for connecting web services

For the described objective above, first the dataset created in \ref{sec:sec:objective} has to be imported. For that this dataset has to be uploaded via the New Dataset dialog. Then this dataset can be selected from the category `Saved Datasets/My Datasets`. The component can then be dragged to the workspace.

First the columns, with which the work will be done, has to be chosen. With the component `Select columns in Dataset` this can be done quickly. The dataset output has to be connected to its input and then the columns can be selected in the configs of this component. By clicking on a component, some configurations can be made. For this component all the columns to be worked with can be selected as can be seein in \ref{fig:selcols}. The output will then be connected to the next step.

In this case this is cleaning of the data. For this there is an according component in the category `Data Transformation / Manipulation`. After dragging it to the workspace it has to be chosen, which columns should be tested for missing data. Because in the used dataset every single cell is required to have a value, every column is being selected. Then it has to be set, what should happen with faulty rows. There are six options that can be performed: Removing the entire row when a missing value occurs within this row; Removing the entire column when a missing value occurs within this column; Replacing it with the mean, media or mode value or replacing it with a user-specified value.

There are not many missing values within this huge dataset, so that the removing rows influence the overall performance of the creating model noticeably. Because of this as well as for simplicity reasons the method to remove rows with missing values has been chosen.

Next the data need to be normalized, which means, that the values of the single pixels, which lay between 0 and 255, should be transformed to a value between 0 and 1. This can be done with the `Normalize Data` component. There the *MinMax*  transformation method has been chosen, which converts the numbers through following equation:

\begin{equation}
z = \frac{x-\min(x)}{[\max(x) - \min(x)]}
\end{equation}

Other possibilities would have been Zscore, Logistic, LogNormal or TanH.

After that, the data has been prepared. However, the features can be improved with Feature Engineering. One example is to encode the categories, so that they are given as numbers instead of strings. For that there is no specific component existing, so it can only be done by writing and adding a Python script. The Python Script component can get three inputs - two datasets and a script bundle as zip for providing necessary methods. The script to encode the data can look as follows:

```
import pandas as pd
from sklearn import preprocessing 

def azureml_main(df = None, df2 = None):
    label_encoder = preprocessing.LabelEncoder() 
  
    df['label']=label_encoder.fit_transform(df['label']) 
    df['label'].unique() 
        
    return df
```

The encoding is being done with the help of Scikit-Learn and assigns every category a number. Then the new dataframe is returned and is used as output. A second dataframe could have been returned as well and function as second output of the component, but in this case there is only one dataframe necessary as input as well as output.

Now the data needs to be split to a training dataset and a testing dataset. The `Split Data` component provides this functionality and only needs to be connected to a dataframe as input. Then the size of the training set can be configured and it gives both datasets - traing and testing - as output. 

After that the every necessary step has been completed to start the training of the model. However, for this a model needs to be built before. Because this model building needs no input, it can be done parallel to preparing the data. For the model building there are several components with different models. For this image classification task, a `Multiclass Neural Network` is the component to use.

There, the number of hidden nodes, the learning rate, the number of learning iterations, and the momentum can be configured. For this example 128 hidden layers have been used and 100 iterations have been made. The learning rate, so the size of the step taken at each iteration, has been set to 0.1. The momentum, which is a weight to apply to nodes, has been set to 0, because there are no previous iterations to take this from.

Then the `Train Model` node can be added to train the model. For this it needs the model on the one hand and the dataset on the other hand as input. Additionally, the target column has to be chosen, which should be predicted by the model. In this dataset this target column is the *label* column.

After the training is finally done, it can be evaluated. For that, first, it needs to get scored via the `Score Model` node with the model and the test data as input. The result of this can then be visualized with the `Evaluate Model` component. 

The resulting pipeline then looks as can be seen in figure \ref{fig:azurepipeline}. 

![Microsoft Azure Machine Learning Service pipeline](images/chapter4/Azure_pipeline.png){ width=500px #fig:azurepipeline}

This can done be run on an Azure cluster by clicking Run. After it has been completed, the result of the evaluation can be seen by right-clicking the output of the `Evaluate Model` component and selecting *Visualize*. This looks like below:

![Microsoft Azure Machine Learning Service evaluation](images/chapter4/azure_evaluation.png){ width=500px #fig:azurepipeline}

As can be gathered from figure \ref{fig:azureres} the accuracy of the resulting model is about 89%. If this is considered good enough, it can now be connected to a Web Service or similar. Otherwise some parameters can be edited or additional steps can be added to further improve the model. This makes this pipeline a very easy to use interface to quickly build models with existing data.

## Kubeflow pipeline {#sec:kubeflowpip}

Another approach is to build a pipeline with an open source framework like Kubeflow. Kubeflow provides a Python \acs{SDK} for building pipelines and a visual interface running on Kubernetes for starting and controlling them.

The creation of a pipeline is broken down into two steps - the definition of the single components and the assembling of those to the pipeline.

For every component there must be a Docker container, which performs the necessary calculations and actions. Data can be forwarded to these data by parsing arguments to it.

To explain the process of building pipelines, first, the single components will be shown and explained. Then the creation of the pipeline, including the definition of the components as well as the assembling, will be described.

Frist, the whole AI development process has to be splitted into several steps. Every single step needs its own container. For the described objective from chapter \ref{sec:objective} the steps of AI development described in chapter \ref{sec:devopsai} will be applied. This means, that the process can be split into following steps:

- Data preparation
- Feature Engineering
- Data Split
- Model building 
- Model Training
- Model evaluation

These will be investigated and described first, before the creation of the pipeline itself will be explained.

### Components

During the preparation steps the initial dataframe gets loaded and manipulated such, that there are no missing or faulty values and, that the data has been normalized. This has been realized with following Python script:

```
def main():
    parser = argparse.ArgumentParser(description="Preprocessing")
    parser.add_argument('--dataset_location' , type=str, help='Location of dataset to be used')
    parser.add_argument('--output' , type=str, help='Target location of dataset to be generated')
    args = parser.parse_args()

    logging.getLogger().setLevel(logging.INFO)

    logging.info("Loading data...")
    df = load_data(args.dataset_location)

    logging.info("Unify dataset (Integers to Float)...")
    df = unify_datatypes(df)

    logging.info("Remove rows with missing values...")
    df = remove_mis_values(df)

    logging.info("Remove rows with faulty values...")
    df = remove_faulty_values(df)

    logging.info("Normalize values (every cell should have a value between 0 and 1)")
    df = normalize_values(df)

    logging.info("Writing resulting dataframe to csv")
    df.to_csv(args.output, index=False)

    write_file("/prepdf_output.txt", args.output)
```

There the main function gets started when the file is executed. This function first adds some input parameter. In this there are two - the location of the original dataset, on which the transformations should be done, and the output location of where to store the resulting, cleaned dataset.

After that, first, the dataset is being load into the script. Then the datatype gets unified, because some columns are recognized as Integer and some as Floats. For this, every column being recognized as Integer is converted to a Float and the appropriate field gets overwritten.

```
def load_data(path):
    return pd.read_csv(path)
    
def unify_datatypes(dataset):
    for col in dataset.select_dtypes("int64"):
        dataset[col] = dataset[col].astype("float64")
    return dataset
```

Next, rows with missing values are being removed. For this every empty cell is being replaced with a missing value sign. Then all of them gets removed by the `dropna` function provided by the *pandas* library.

```
def remove_mis_values(dataset):
    dataset.replace('', np.nan, inplace=True)
    dataset = dataset.dropna()
    return dataset
```

Also, rows with faulty values have to be removed. For this the rows have to be removed, in which the label does not equal one of the valid categories, which are defined in the `CATEGORIES` array. This is done by only keeping the rows which label is included in this array::

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

This needs to be done, because Kubeflow uses txt files to transfer the location of stored files to the next component.

The next component should deal with the feature engineering to optimize the features and labels for the training process. For example, in the described case it could be helpful to transform the label of the cateogory to a numerical value. The performance of the resulting model can be further improved by applying One-Hot-Encoding described in chapter \ref{sec:aicycle}. This can be done with following script:

```
def main():
    parser = argparse.ArgumentParser(description="Feature engineering")
    parser.add_argument('--dataset_location' , type=str, help='Location of dataset to be used')
    parser.add_argument('--output' , type=str, help='Target location of dataset to be generated')
    args = parser.parse_args()

    logging.getLogger().setLevel(logging.INFO)

    logging.info("Loading data...")
    df = load_data(args.dataset_location)

    logging.info("Applying one hot encoding...")
    df = one_hot_encoding(df)    

    logging.info("Writing resulting dataframe to csv")
    df.to_csv(args.output, index=False)

    write_file("/findf_output.txt", args.output)
```

First, the arguments are added. These are once again the location of the dataset and the output location of the resulting dataset. Then the data gets loaded the same way as in the data processing component.  Afterwards the one hot encoding is being executed.

For this the *pandas* library can be used to grab the different categories, building an own column for each of them and filling the cells with either 1 or 0, dependent on whether the cell had equalled the according value before. Then the original label column gets dropped and the resulting columns of the described operations are joined to the dataset:

```
def one_hot_encoding(dataset):
    one_hot = pd.get_dummies(dataset['label'])
    dataset = dataset.drop('label',axis = 1)
    dataset = dataset.join(one_hot) 
    return dataset
```

Afterwards the dataset is stored into a *CSV* file and its location to a *txt* file the same way as at the end of the data preparation component.

The last part of handling the data is to split it into different sets - training and testing. Following scripts takes over that task:

```
def main():
    parser = argparse.ArgumentParser(description="Feature engineering")
    parser.add_argument('--dataset_location' , type=str, help='Location of dataset to be used')
    parser.add_argument('--test_size', type=float, help='Size of test set')
    parser.add_argument('--random_state', type=int, help='Random state of train-test-split')
    parser.add_argument('--output_train_img' , type=str, help='Target location of dataset to be generated')
    parser.add_argument('--output_train_label' , type=str, help='Target location of dataset to be generated')
    parser.add_argument('--output_test_img' , type=str, help='Target location of dataset to be generated')
    parser.add_argument('--output_test_label' , type=str, help='Target location of dataset to be generated')
    args = parser.parse_args()

    logging.getLogger().setLevel(logging.INFO)

    logging.info("Loading data...")
    df = load_data(args.dataset_location)

    image_df, label_df = split_label_and_img(df)

    images_train, images_test, labels_train, labels_test = train_test_split(image_df, label_df, test_size=args.test_size, random_state=args.random_state)
    logging.info("Writing resulting dataframes to csvs")
    images_train.to_csv(args.output_train_img, index=False)
    labels_train.to_csv(args.output_train_label, index=False)
    images_test.to_csv(args.output_test_img, index=False)
    labels_test.to_csv(args.output_test_label, index=False)

    write_file("/trainimg.txt", args.output_train_img)
    write_file("/trainlabel.txt", args.output_train_label)
    write_file("/testimg.txt", args.output_test_img)
    write_file("/testlabel.txt", args.output_test_label)
```

In this script, first, the required arguments are defined - besides the locations of the input as well as the resulting datasets these are the size of the testing set and a random state, with which different compositions of the datasets can be created.

Then the dataset is being load as described above, before the labels and the image infos are split. For this two datasets are created - one, which consists of all columns, that includes the keyword *'pixel'*, and one of all columns, that doesnt include this keyword:

```
def split_label_and_img(df):
    images = df.drop([col for col in df.columns if 'pixel' not in col ], axis='columns')
    labels = df.drop([col for col in df.columns if 'pixel' in col ], axis='columns')

    return images, labels
```

Next, the `train_test_split` function included in the *Scikit-Learn* library can be used to split those datasets into testing and training sets. These are then stored as four different files - the training images, the training labels, the testing images and the testing labels. The output location is then written to a *txt* file once again.

Parallel to this data preparation, also the model has to be prepared. The layers has to be defined and the model needs to be compiled. Following script offers such functionalities:

```
def main():
    parser = argparse.ArgumentParser(description="Feature engineering")
    parser.add_argument('--input_shape_height', type=int, help='Heigt of input images')
    parser.add_argument('--input_shape_width', type=int, help='Width of input images')
    parser.add_argument('--num_units', type=int, help='Number of nodes in neural net')
    parser.add_argument('--num_outputs', type=int, help='Number of output nodes in neural ned')
    parser.add_argument('--activation_l2', type=str, help='Activation function for layer 2 as String')
    parser.add_argument('--activation_l3', type=str, help='Activation function for layer 3 as String')
    parser.add_argument('--optimizer', type=str, help='Optimizer function to improve model')
    parser.add_argument('--loss', type=str, help='Loss function which should be minimized')
    parser.add_argument('--metrics', type=str, help='Metrics with which should be measured')
    parser.add_argument('--output', type=str, help='Output location for model to be build')
    args = parser.parse_args()

    logging.getLogger().setLevel(logging.INFO)

    logging.info("Building model...")
    model = build_model((args.input_shape_height, args.input_shape_width), args.num_units, args.num_outputs, get_activation_func(args.activation_l2), get_activation_func(args.activation_l3))

    logging.info("Compile model...")
    model.compile(optimizer=args.optimizer,
        loss=args.loss,
        metrics=[args.metrics])

    logging.info("Saving model...")
    model.save(args.output)

    write_file("/model.txt", args.output)
```

First, several arguments are passed. These are the input shape of the images, the number of units in the hidden layer, the number of output categories, the activation functions for the different layers and optimizer, loss and metrics parameters for compiling the model. Then the model needs to be built. For this Keras is being used to define the single layers and enters all the parameters:

```
def build_model(input_shape, num_units, num_outputs, activation_l2, activation_l3):
    return keras.Sequential([
        keras.layers.Flatten(input_shape=input_shape),
        keras.layers.Dense(num_units, activation=activation_l2),
        keras.layers.Dense(num_outputs, activation=activation_l3)
    ])
``` 

To get the activation functions, the `get_activation_func` function gets a string of the functions name and returns the function itself. After that, the model needs to be compiled with the loss function, the optimizer and the metrics to be used. This model is then saved and its location stored into a *txt* file.

Alternatively a prexisting and possibly pretrained model can be downloaded. One example for this can be found in the following script:

```
def main():
    parser = argparse.ArgumentParser(description="Feature engineering")
    parser.add_argument('--input_shape_height', type=int, help='Heigt of input images')
    parser.add_argument('--input_shape_width', type=int, help='Width of input images')
    parser.add_argument('--output', type=str, help='Output location for model to be build')
    args = parser.parse_args()

    logging.getLogger().setLevel(logging.INFO)

    logging.info("Downloading model...")
    model = download_model((args.input_shape_height, args.input_shape_width))

    logging.info("Saving model...")
    model.save(args.output)

    write_file("/model.txt", args.output)
```

There, only the input shape and the location of where the downloaded model should be stored has to be parsed as parameter. Then the model can be downloaded with the given input shape and gets stored afterwards.

No matter if the model has been build from scratch or a preexisting model has been downloaded, the next step is to train the model by feeding it with some data.

```
def main():
    parser = argparse.ArgumentParser(description="Feature engineering")
    parser.add_argument('--input_train_img' , type=str, help='Target location of dataset to be generated')
    parser.add_argument('--input_train_label' , type=str, help='Target location of dataset to be generated')
    parser.add_argument('--input_shape_height', type=int, help='Heigt of input images')
    parser.add_argument('--input_shape_width', type=int, help='Width of input images')
    parser.add_argument('--model_location', type=str, help='Created model location')
    parser.add_argument('--epochs', type=int, help='Number of epochs to be executed')
    parser.add_argument('--output', type=str, help='Output location for trained model')
    args = parser.parse_args()

    logging.getLogger().setLevel(logging.INFO)

    logging.info("Loading data...")
    train_img_raw = load_data(args.input_train_img)
    train_label = load_data(args.input_train_label)

    logging.info("Preparing images...")
    train_img = prepare_image_shape(train_img_raw, args.input_shape_height, args.input_shape_width)

    logging.info("Loading model...")
    model = load_model(args.model_location)
    logging.info(train_img.shape)
    logging.info(train_label.shape)
    logging.info("Training model...")
    model.fit(train_img, train_label, epochs=args.epochs)

    logging.info("Saving model weights...")
    model.save(args.output)

    write_file("/trained_model.txt", args.output)
```

For doing this, the script needs the location of the image as well as the label dataset and of the basic as well as the resulting model. Additionally it needs to know about the input shape for the images and the number of epochs, which means the number of iterations of feeding the model with data to complete for the training. Afterwards the data gets loaded and the images get shaped correctly:

```
def prepare_image_shape(imageset, shape_height, shape_width):
    return np.array([img.reshape(shape_height,shape_width) for img in imageset.values])
```

For this the `reshape` method for arrays of the *numpy* library can be used. Then the model is loaded too and it can be fitted with the loaded and prepared data. Last, this model gets stored and its output location written into a *txt* file.

The last step is then to evaluate this model. For this it needs the same parameters as for training the model with the only difference, that it gets the location of the testing datasets instead of the training datasets:

```
def main():
    parser = argparse.ArgumentParser(description="Feature engineering")
    parser.add_argument('--input_test_img' , type=str, help='Target location of dataset to be generated')
    parser.add_argument('--input_test_label' , type=str, help='Target location of dataset to be generated')
    parser.add_argument('--input_shape_height', type=int, help='Heigt of input images')
    parser.add_argument('--input_shape_width', type=int, help='Width of input images')
    parser.add_argument('--model_location', type=str, help='Created model location')
    parser.add_argument('--output', type=str, help='Output location for trained model')
    args = parser.parse_args()

    logging.getLogger().setLevel(logging.INFO)

    logging.info("Loading data...")
    test_img = load_data(args.input_test_img)
    test_label = load_data(args.input_test_label)

    logging.info("Preparing images...")
    test_img = prepare_image_shape(test_img.values, args.input_shape_height, args.input_shape_width)

    logging.info("Loading model...")
    model = load_model(args.model_location)

    logging.info("Evaluate model...")
    loss, acc = model.evaluate(test_img, test_label)
    logging.info("Evaluation loss: {}".format(loss))
    logging.info("Evaluation accuracy: {}".format(acc))

    logging.info("Saving loss and accuracy...")
    store_loss_acc(args.output, loss, acc)

    write_file("/result.txt", args.output)
```

Then all the data gets loaded, the images prepared and the model evaluated. During this operation the accuracy as well as the loss are getting calculated. After the evaluation has been finished, these information are written to the *result.txt*, so that it can be accessed and read by the developers.

With all these components being created, these needs to be packed into a Docker container. For this a Dockerfile is necessary, which has to look similar to the one below:

```
FROM python:3

COPY ./requirements.txt .

RUN pip install -r requirements.txt

COPY ./data_preparation.py .

ENTRYPOINT ["python", "/data_preparation.py"]
```

The base image of the Docker containers is a plain pythin image. On top of it the requirements are getting installed, which includes every necessary library and framework, and then the script itself is being load into the Docker container. This file then represents the entrypoint of the container with the possibility to pass additional arguments to it, so that every necessary information can be provided.

The Docker container of every component looks similar with the only difference, that the components using Tensorflow are not build on a plain Python image, but on the latest Tensorflow image.

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

The arguments have to equal the arguments , that have been parsed during the creation of the components. By defining these arguments in the definition of the operation, these arguments can be given to the pipeline and forwarded directly to the component, that needs these information. 

The file outputs represent the files being created, in which the information needed for following steps are being stored.

Each of the components needs to have an operation defined looking like this or similar. Then these operations can be connected:

```
def pipeline(
	dataset_location='/mnt/data/manipulated_fashion_mnist.csv', 		
	test_size=0.3, 
	random_state=42, 
	input_shape_height=28, 
	input_shape_width=28, use_pretrained_model='False', 
	model_units_num=128
    model_outputs_num=10, 
    model_activation_func_layer2='relu',
    model_activation_func_layer3='softmax', 
    optimizer='adam', 
    loss='binary_crossentropy', 
    metrics='accuracy', 
    num_epochs=10, 
    location_prepared_dataset='/mnt/data/prep_fashion_mnist.csv', 
    location_improved_dataset='/mnt/data/impr_fasion_mnist.csv', 
    location_training_images='/mnt/data/train_img.csv', 
    location_training_labels='/mnt/data/train_labels.csv', 
    location_test_images='/mnt/data/test_img.csv', 
    location_test_labels='/mnt/data/test_labels.csv', 
    location_base_model='/mnt/model/base_model.h5', 
    location_trained_model='/mnt/model/trained_model.h5', 
    location_result='/mnt/result.txt'):
  
  data_preparation = data_prep_op(dataset_location, location_prepared_dataset).apply(onprem.mount_pvc("fashion-mnist-vol", 'local-storage', "/mnt"))
  feature_engineering = feature_eng_op(data_preparation.outputs['output'], location_improved_dataset).apply(onprem.mount_pvc("fashion-mnist-vol", 'local-storage', "/mnt"))
  data_split = data_split_op(feature_engineering.outputs['output'], test_size, random_state, location_training_images, location_training_labels, location_test_images, location_test_labels).apply(onprem.mount_pvc("fashion-mnist-vol", 'local-storage', "/mnt"))
  
  with dsl.Condition(use_pretrained_model == 'True'):
    model_building = model_download_op(input_shape_height, input_shape_width, location_base_model).apply(onprem.mount_pvc("fashion-mnist-vol", 'local-storage', "/mnt"))
    model_training = model_train_op(data_split.outputs['train_img'], data_split.outputs['train_label'], input_shape_height, input_shape_width, model_building.outputs['output_model_loc'], num_epochs, location_trained_model).apply(onprem.mount_pvc("fashion-mnist-vol", 'local-storage', "/mnt"))
    model_evaluation = model_eval_op(data_split.outputs['test_img'], data_split.outputs['test_label'], input_shape_height, input_shape_width, model_training.outputs['output_model_loc'], location_result).apply(onprem.mount_pvc("fashion-mnist-vol", 'local-storage', "/mnt"))


  with dsl.Condition(use_pretrained_model == 'False'):
    model_building = model_build_op(input_shape_height, input_shape_width, model_units_num, model_outputs_num, model_activation_func_layer2, model_activation_func_layer3, optimizer, loss, metrics, location_base_model).apply(onprem.mount_pvc("fashion-mnist-vol", 'local-storage', "/mnt"))
    model_training = model_train_op(data_split.outputs['train_img'], data_split.outputs['train_label'], input_shape_height, input_shape_width, model_building.outputs['output_model_loc'], num_epochs, location_trained_model).apply(onprem.mount_pvc("fashion-mnist-vol", 'local-storage', "/mnt"))
    model_evaluation = model_eval_op(data_split.outputs['test_img'], data_split.outputs['test_label'], input_shape_height, input_shape_width, model_training.outputs['output_model_loc'], location_result).apply(onprem.mount_pvc("fashion-mnist-vol", 'local-storage', "/mnt"))
```

This pipeline first needs to define every parameter that will be used for one of the components. It also declares a default value in case the user won't change the information on startup of the pipeline

Then the single operations are being called. By calling these operations every needed information is being forwarded as parameter. To use an output of a previous step as new input, the according parameter of the outputs array of this step, that has been stored inside a variable, can be called.

In the example case both should be tested - a new model built from scratch as well as a pretrained one downloaded from the internet. For this conditions can be defined, dependent on whose result different ways can be hit.

After every step is defined and called the pipeline can be compiled with the Kubeflow SDK like this:

```
if __name__ == '__main__':
  kfp.compiler.Compiler().compile(pipeline, __file__ + '.tar.gz')
```

This only needs the file to be started normally and then created an archive, which can be imported to the Kubeflow dashboard.

After this have been done the created pipeline looks like below:



This pipeline can then be started by the user. When starting it, the user can enter or change all the parameters defined above, as can be seen in figure \ref{fig:kfpippar}.



Finally, the pipeline gets started and every single step will be gone through automatically. A finished pipeline looks like \ref{fig:finished_kfpip}.



With the manipulated *Fashion-MNIST* dataset created in chapter \ref{sec:objective} the accuracy can be measured and lays at about 98% while a loss of about 5%.

This proves that the pipeline has been finished and can be used over and over again until a satisfying result comes out. 