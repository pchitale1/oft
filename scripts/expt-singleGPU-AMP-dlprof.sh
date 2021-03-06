#!/bin/sh

#Experiment for Single GPU with DLProf and AMP enabled one epoch only

# Cleanup
rm -rf nsys*

# Run training
EXPT_TIME=$(date +"%y%m%d-%s-")
EXPERIMENT_NAME=$EXPT_TIME"train-benchmark-1gpu-wDLProf-wAMP"
EXPT_BATCH_SIZE=16
EXPT_NUM_DATA_LOADERS=8
dlprof --mode=pytorch python train.py $EXPERIMENT_NAME --gpu 0 -b $EXPT_BATCH_SIZE -w $EXPT_NUM_DATA_LOADERS --dlprof True --amp True;
mv nsys* experiments/$EXPERIMENT_NAME;
mv event_files/tfdlprof.* experiments/$EXPERIMENT_NAME;
#tensorboard --logdir experiments/$EXPERIMENT_NAME &