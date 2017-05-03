# nedap_matrix_cli

Small CLI app in ruby to print a matrix of N,M dimensions to standard out.

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
