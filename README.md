# Think Big, Teach Small: Do Language Models Distil Occam’s Razor?

Software related to the paper "Think Big, Teach Small: Do Language Models Distil Occam’s Razor?"

## Experiments

### GPT-2

The experiment is fully performed on Google Colab. When opening the [Notebook](https://drive.google.com/file/d/129lmj6Eszqra6BuHxTLe21x4zQgdZ8nf/view?usp=sharing), just follow the code sections to run the experiment.

### GPT-3

There are different [Google Colab notebooks](https://drive.google.com/drive/folders/1tTOsREBfWHSBzpBakLvvKWaUBtkOkb9U?usp=sharing) which post-process the outputs returned by GPT-3 in the experiment. The use of GPT-3 requires of an API key which cannot be provided with the code. However, the [prompts](https://drive.google.com/file/d/1iW0zQcTm-gADFqg11Z8Bj1mfJW7EH9JJ/view?usp=sharing) used in the experiment are included in the repository.

### MagicHaskeller

MagicHaskeller must be previously [installed](http://nautilus.cs.miyazaki-u.ac.jp/~skata/MagicHaskeller.html). To run the experiment, execute the [Python script](https://drive.google.com/file/d/15mdS3g3Gn9zFUcSsZCZ2c_cK74TNTAF6/view?usp=sharing). The returned functions will be written in the corresponding file depending on the path provided in the script. From the list of functions, we take the first in the list and use it as a solution, querying the test examples using Haskell. The summary of the results can be found in "MHResults.txt". 

### Louise

Louise must be previously [installed](https://github.com/stassa/louise). Once running Louise using "final_test.pl" as the script file including the different examples (depending on the concept) in "pos_neg_ex.txt", the evaluation of the test examples (using the predicates returned by the system) is performed in the [Google Colab notebook](https://drive.google.com/file/d/1D-ngkUiR_NakPkrXJm0CoUEP6QjBdWLd/view?usp=sharing).

## Additional Material

A [Python script](https://drive.google.com/file/d/1izHmMOJW_YO8QwEyzNvwP1pPOc1Qhe2Z/view?usp=sharing) is provided to test the [P3](https://en.wikipedia.org/wiki/Brainfuck) functioning.

Finally, an [R script](https://drive.google.com/file/d/1bxuk2-yvAxEIB3FZvm1DSFOe4MaTacsC/view?usp=sharing) for the generation of the paper plots is included, alongside the [fonts](https://drive.google.com/file/d/12iNCofQUKnnUAMlPzRGy4zMfQTVudqpF/view?usp=sharing) required.