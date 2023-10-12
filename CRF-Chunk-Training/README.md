# Here the chunker depends only on the POS tags
# If data type is conll where the common format of each line is pos_tag\tchunk_tag
# How to train a crf using CRF++ toolkit (https://taku910.github.io/crfpp/), requires a template for reading features
## crf_learn -c 1.5 -f 3 -p 6 template-for-chunking.txt input-file.txt model-chunk-odia.m
