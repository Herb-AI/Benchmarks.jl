[![codecov](https://codecov.io/gh/Herb-AI/HerbBenchmarks.jl/graph/badge.svg?token=VUK6MXLCU4)](https://codecov.io/gh/Herb-AI/HerbBenchmarks.jl)
[![Build Status](https://github.com/Herb-AI/HerbBenchmarks.jl/actions/workflows/CI.yml/badge.svg?branch=master)](https://github.com/Herb-AI/HerbBenchmarks.jl/actions/workflows/CI.yml?query=branch%3Amaster)
[![Dev-Docs](https://img.shields.io/badge/docs-latest-blue.svg)](https://Herb-AI.github.io/Herb.jl/dev)


# HerbBenchmarks.jl

A collection of useful program synthesis benchmarks. 

## Benchmark structure

Each benchmark has its own folder, including:
- A README with relevant resources for the benchmark (papers, code repos, etc.) and a brief description of the data structure used in the data set.
- `data.jl`: Contains the benchmark data set. A data set consists of one or more problems (or tasks). Each problem is made up of one or more input-output examples. For more details on how a data set should look like, see [Benchmark data](#benchmark-data). 
- `citation.bib`: Reference to cite the benchmark.
- `grammar.jl`: One or more program grammar(s).
- `<benchmark_name>_primitives.jl`: Implementation of all primitives and the custom interpret function (if exists).

## Benchmark data

In `data.jl`, a data set follows a specific structure:
- Each data set is represented by  `Problem`s.
- A problem has a unique **identifier**, e.g., `"problem_100"`.
- A problem contains a list of `IOExample`s. The input `in` is of type `Dict{Symbol, Any}`, with `Symbol`s following the naming convention `_arg_1_`, `_arg_2_`, etc.

```julia
# Example 
problem_100 = Problem("problem_100", [
	IOExample(Dict{Symbol, Any}(:_arg_1_ => StringState("369K 16 Oct 17:30 JCR-Menu.ppt", 1)), StringState("16 Oct", nothing)), 
	IOExample(Dict{Symbol, Any}(:_arg_1_ => StringState("732K 11 Oct 17:59 guide.pdf", 1)), StringState("11 Oct", nothing)), 
	IOExample(Dict{Symbol, Any}(:_arg_1_ => StringState("582K 18 Oct 12:13 make-01.pdf", 1)), StringState("18 Oct", nothing))
])

```

## How to use:
HerbBenchmarks is still not yet complete and is lacking crucial benchmarking functionality. However, if you want to test on a single problem and grammar, you can do the following

Select your favourite benchmark, we use the string transformation benchmark from the SyGuS challenge:
```Julia
using HerbSpecification, HerbGrammar

using HerbBenchmarks.String_transformations_2020

# The id has to be matching
grammar = String_transformations_2020.grammar_string
problem = String_transformations_2020.problem_100

# Print out the grammar and problem in readable format
println("grammar:", grammar)
println("problem:", problem.examples)
```

Some benchmarks there is only a single grammar for all problems. 
