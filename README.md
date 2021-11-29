# Think Big, Teach Small: Do Language Models Distil Occam’s Razor?

Software related to the paper "Think Big, Teach Small: Do Language Models Distil Occam’s Razor?"

Authors: Gonzalo Jaimovitch-López, David Castellano-Falcón, Cèsar Ferri, José Hernández-Orallo

# Experiments

## GPT-2

The experiment is fully performed on a single [Notebook](https://github.com/gonzalojaimovitch/think-big-teach-small/blob/main/GPT-2%20Experiments/GPT_2_Experiments.ipynb).

When opening the Notebook, just follow the code sections to run the experiment. Note that a [file](https://github.com/gonzalojaimovitch/think-big-teach-small/blob/main/GPT-2%20Experiments/GPT2results.txt) with the experiment results is provided. The results are printed in the corresponding section.

## GPT-3

There are different [Notebooks](https://github.com/gonzalojaimovitch/think-big-teach-small/tree/main/GPT-3%20Experiments/notebooks) which post-process the outputs returned by GPT-3 in the experiment.

You can find two folders: [main](https://github.com/gonzalojaimovitch/think-big-teach-small/tree/main/GPT-3%20Experiments/notebooks/main) (for the experiments presented in the main paper) and [additional](https://github.com/gonzalojaimovitch/think-big-teach-small/tree/main/GPT-3%20Experiments/notebooks/additional) (for the experiments included in the supplementary material).

The use of GPT-3 requires of an API key which cannot be provided with the code. However, the [prompts](https://github.com/gonzalojaimovitch/think-big-teach-small/blob/main/GPT-3%20Experiments/prompts.zip) used in the experiment are included in the repository.

If you would like to run the [prompt queries](https://github.com/gonzalojaimovitch/think-big-teach-small/tree/main/GPT-3%20Experiments/prompts) in GPT-3, visit the [OpenAI´s API Webpage](https://beta.openai.com/). Make sure you adjust the temperature depending on the experiment you would like to test. Furthermore, note that results obtained with the use of the API from the webpage and the use of the API from the Python environment might differ based on the different encodings.

### Main experiments

1. [Temperature = 0](https://github.com/gonzalojaimovitch/think-big-teach-small/blob/main/GPT-3%20Experiments/notebooks/main/GPT3_NO_TEMP.ipynb)

2. [Temperature = 1](https://github.com/gonzalojaimovitch/think-big-teach-small/blob/main/GPT-3%20Experiments/notebooks/main/GPT3_TEMP.ipynb)

Run the lines of code in order. Note that you will have to choose (using the following cell at the top of the notebooks) the desired model to obtain the results.
```
#Choose between {'ada', 'babbage', 'curie', 'davinci'}
MODEL = 'davinci'
```

### Additional experiments

1. [Alternative alphabet (Apple, Banana)](https://github.com/gonzalojaimovitch/think-big-teach-small/blob/main/GPT-3%20Experiments/notebooks/additional/GPT3_NO_TEMP_davinci_alt.ipynb)

2. [Separator between characters in input / output](https://github.com/gonzalojaimovitch/think-big-teach-small/blob/main/GPT-3%20Experiments/notebooks/additional/GPT3_NO_TEMP_davinci_sep.ipynb)

3. [Concepts with loops](https://github.com/gonzalojaimovitch/think-big-teach-small/blob/main/GPT-3%20Experiments/notebooks/additional/GPT3_NO_TEMP_LOOPS_davinci.ipynb)

4. [Many more concepts / Not using machine teaching](https://github.com/gonzalojaimovitch/think-big-teach-small/blob/main/GPT-3%20Experiments/notebooks/additional/GPT3_LARGE_EVALUATION.ipynb)

     Run the lines of code in order. Note that you will have to choose (using the following cell at the top of the notebooks) the desired experiment to obtain the results.
  ```
  #Choose complete_EXPERIMENT.csv being EXPERIMENT {'ada', 'babbage', 'curie', 'davinci', 'EXP_A', 'EXP_B'}
  EXPERIMENT = 'ada'
  ```
5. [Baselines]((https://github.com/gonzalojaimovitch/think-big-teach-small/blob/main/GPT-3%20Experiments/notebooks/additional/BASELINES.ipynb))


## MagicHaskeller

MagicHaskeller must be previously [installed](http://nautilus.cs.miyazaki-u.ac.jp/~skata/MagicHaskeller.html).

To run the experiment, execute the [Python script](https://github.com/gonzalojaimovitch/think-big-teach-small/blob/main/MH%20Experiments/script.py). The returned functions will be written in the corresponding file depending on the path provided in the script.

From the list of functions (you can find the outputs in this [folder](https://github.com/gonzalojaimovitch/think-big-teach-small/tree/main/MH%20Experiments/MHOutputs)), we take the first function from the top of the list and use it as a solution, querying the test examples using Haskell. The summary of the results can be found in [MHResults.txt](https://github.com/gonzalojaimovitch/think-big-teach-small/blob/main/MH%20Experiments/MHResults.txt).

## Louise

Louise must be previously [installed](https://github.com/stassa/louise).

First you should run Louise and execute the dedicated [script](https://github.com/gonzalojaimovitch/think-big-teach-small/blob/main/Louise%20Experiments/final_test.pl) including the different examples where indicated depending on the concept (you can find them in [pos_neg_ex.txt](https://github.com/gonzalojaimovitch/think-big-teach-small/blob/main/Louise%20Experiments/pos_neg_ex.txt)).

Subsequently, the evaluation of the test examples (using the predicates returned by the system) is performed in the [Notebook](https://github.com/gonzalojaimovitch/think-big-teach-small/blob/main/Louise%20Experiments/louise_experiments.ipynb).


## Humans

We provide a [PDF](https://github.com/gonzalojaimovitch/think-big-teach-small/blob/main/Human%20Experiments/Learning_Test.pdf) with the questionnaire performed by the human participants in this experiment. Note that the headlines mark the start of each screen that was presented to the participants, as this is not clearly reflected in the PDF version of the form. This can be observed when opening the HTML file, stored in the source code [folder](https://github.com/gonzalojaimovitch/think-big-teach-small/tree/main/Human%20Experiments/Learning_Test).

## Additional Material

A [Python script](https://github.com/gonzalojaimovitch/think-big-teach-small/blob/main/P3%20Simulator/p3_sim.py) is provided to test the [P3](https://en.wikipedia.org/wiki/Brainfuck) functioning.

Finally, the [R scripts](https://github.com/gonzalojaimovitch/think-big-teach-small/tree/main/Plots) for the generation of the paper plots are included.
