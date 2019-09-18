
# Appendix

## Azure pipeline{#sec:azurepipeline}

![Microsoft Azure Machine Learning Service pipeline](images/chapter4/Azure_pipeline.png){ width=500px #fig:azurepipeline}\newpage

## Kubeflow pipeline implementation{#sec:kfpipelineimpl}

\begin{lstlisting}[caption={Python: Kubeflow Fashion-MNIST pipeline}, captionpos=b]
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
\end{lstlisting}

\newpage

## Kubeflow pipeline{#sec:kfpipeline}

![Kubeflow pipeline](images/chapter4/kf_pipeline.png){ width=400px #fig:kfpipeline}

## Kubeflow parameter{#sec:kfparameter}

![Kubeflow parameter](images/chapter4/kf_parameter.png){ width=250px #fig:kfparameter}