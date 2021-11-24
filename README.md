# Think Big, Teach Small: Do Language Models Distil Occam’s Razor?

Software related to the paper "Think Big, Teach Small: Do Language Models Distil Occam’s Razor?"

Authors: Gonzalo Jaimovitch-López, David Castellano-Falcón, Cèsar Ferri, José Hernández-Orallo

## Experiments

## GPT-2

The experiment is fully performed on a single [Notebook](https://github.com/gonzalojaimovitch/think-big-teach-small/blob/main/GPT-2%20Experiments/GPT_2_Experiments.ipynb). When opening the Notebook, just follow the code sections to run the experiment. Please, read the instructions at the start of the notebook since they might be helpful to run the experiment.

## GPT-3

There are different [Notebooks](https://github.com/gonzalojaimovitch/think-big-teach-small/tree/main/GPT-3%20Experiments/notebooks) which post-process the outputs returned by GPT-3 in the experiment. 

You can find two folders: [main](https://github.com/gonzalojaimovitch/think-big-teach-small/tree/main/GPT-3%20Experiments/notebooks/main) (for the experiments presented in the main paper) and [additional](https://github.com/gonzalojaimovitch/think-big-teach-small/tree/main/GPT-3%20Experiments/notebooks/additional) (for the experiments included in the supplementary material). 

The use of GPT-3 requires of an API key which cannot be provided with the code. However, the [prompts](https://github.com/gonzalojaimovitch/think-big-teach-small/blob/main/GPT-3%20Experiments/prompts.zip) used in the experiment are included in the repository.

If you would like to run the prompt queries in GPT-3, visit the [OpenAI´s API Webpage](https://beta.openai.com/). Make sure you adjust the temperature depending on the experiment you would like to test. Furthermore, note that results between the use of the API from the webpage and the use of the API from the Python environment might differ based on the different encodings.

## MagicHaskeller

MagicHaskeller must be previously [installed](http://nautilus.cs.miyazaki-u.ac.jp/~skata/MagicHaskeller.html). To run the experiment, execute the [Python script](https://github.com/gonzalojaimovitch/think-big-teach-small/blob/main/MH%20Experiments/script.py). The returned functions will be written in the corresponding file depending on the path provided in the script. From the list of functions (you can find the outputs in this [folder](https://github.com/gonzalojaimovitch/think-big-teach-small/tree/main/MH%20Experiments/MHOutputs)), we take the first function from the top of the list and use it as a solution, querying the test examples using Haskell. The summary of the results can be found in [MHResults.txt](https://github.com/gonzalojaimovitch/think-big-teach-small/blob/main/MH%20Experiments/MHResults.txt).

## Louise

Louise must be previously [installed](https://github.com/stassa/louise). First you should run Louise and execute the dedicated [script](https://github.com/gonzalojaimovitch/think-big-teach-small/blob/main/Louise%20Experiments/final_test.pl) including the different examples (depending on the concept, you can find them in [pos_neg_ex.txt](https://github.com/gonzalojaimovitch/think-big-teach-small/blob/main/Louise%20Experiments/pos_neg_ex.txt)). Subsequently, the evaluation of the test examples (using the predicates returned by the system) is performed in the [Notebook](https://github.com/gonzalojaimovitch/think-big-teach-small/blob/main/Louise%20Experiments/louise_experiments.ipynb).


## Humans

We provide a [PDF](https://github.com/gonzalojaimovitch/think-big-teach-small/blob/main/Human%20Experiments/Learning_Test.pdf) with the questionnaire performed by the human participants in this experiment. Note that the headlines mark the start of each screen that was presented to the participants, as this is not clearly reflected in the PDF version of the form. This can be observed when opening the HTML file, stored in the source code [folder](https://github.com/gonzalojaimovitch/think-big-teach-small/tree/main/Human%20Experiments/Learning_Test).

## Additional Material

A [Python script](https://github.com/gonzalojaimovitch/think-big-teach-small/blob/main/P3%20Simulator/p3_sim.py) is provided to test the [P3](https://en.wikipedia.org/wiki/Brainfuck) functioning.

Finally, an [R script](https://github.com/gonzalojaimovitch/think-big-teach-small/blob/main/Plots/plots.r) for the generation of the paper plots is included, alongside the [fonts](https://github.com/gonzalojaimovitch/think-big-teach-small/blob/main/Plots/Latin-Modern-Roman-fontfacekit.zip) required by the script.
