# nedap_matrix_cli

Small CLI app in ruby to print a matrix of N,M dimensions to standard out.

## Comments and Changes

1. What are the maximum dimensions for your solution?
Simplest solution is memory constraints - the entire matrix is a multidimensional array in memory, and the process of creating the spiral output creates 2 more arrays (1 to hold all of the indices processed, and another with the actual output).

2. Why are these the maximum dimensions?
Limiting factor is memory, and according to [this SO Post](http://stackoverflow.com/a/3688388) 500 million array elements takes up 2GB of memory.  Using that as fact (yeah, not gonna base my career on that info) I could say:

You can at most safely create a matrix of `2M x 2M` if you had 6GB of memory available to processes on the system, which leaves room for the rest of the ruby app and some breathing room.  OS memory and all that would be additional of course.

3. What is good about your solution?
I like the separation of responsibilities and test coverage being easy to understand.  I like the familiarity of the file structure resembling a "real" application, with a console playground as well.

4. What is not good about your solution?
Memory usage could be improved with other means as mentioned above in limiting factors, and implementation does not currently work on a 2x4 matrix :(

## Installation

### Requirements

* ruby 2.3
* bundler

To install:

```shell
$> bundle install
```

## Usage

### Console
To play with an interactive console and inspect the code as you wish:

```shell
$> bin/console
```

### CLI

At the command line:

```shell
$> bin/matrix 2 4
```

## Testing

Tests are written in rspec and can be ran using the standard command:

```shell
$> bundle exec rspec spec
```
