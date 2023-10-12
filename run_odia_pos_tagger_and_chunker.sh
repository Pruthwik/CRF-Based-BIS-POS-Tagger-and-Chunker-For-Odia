# how to run this
# sh run_odia_pos_tagger_and_chunker.sh input_file_path output_file_path
# for output_file_path, give just a name
input_file=$1
output_file=$2
python tokenizer_for_file.py --input $input_file --output input-tokenized-conll.txt
python create_features_for_crf_from_conll_pos_data.py --input input-tokenized-conll.txt --output input-features.txt
crf_test -m odia-BIS-pos-model.m input-features.txt > input_pos_predicted.txt
cut -f1 input_pos_predicted.txt > tokens.txt
cut -f14 input_pos_predicted.txt > pos.txt
crf_test -m odia-BIS-chunk-model.m pos.txt > pos-with-chunk.txt
paste tokens.txt pos-with-chunk.txt > $output_file
rm -rf input-tokenized-conll.txt input-features.txt input_pos_predicted.txt tokens.txt pos.txt pos-with-chunk.txt
