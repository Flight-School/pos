# pos

`pos` is a command-line utility for tagging
<dfn>part of speech</dfn> (<abbr>POS</abbr>) for words in text.

```terminal
$ echo "The quick brown fox jumps over the lazy dog." | pos
DETERMINER	The
ADJECTIVE	quick
ADJECTIVE	brown
NOUN	fox
VERB	jumps
PREPOSITION	over
DETERMINER	the
ADJECTIVE	lazy
NOUN	dog
```

---

For more information about natural language processing,
check out Chapter 7 of the
[Flight School Guide to Swift Strings](https://flight.school/books/strings).

---

## Requirements

- macOS 10.12+

## Installation

Install `pos` with [Homebrew](https://brew.sh) using the following command:

```terminal
$ brew install flight-school/formulae/pos
```

## Usage

Text can be read from either standard input or file arguments.
Tagged words are written to standard output on separate lines.

### Reading from Piped Standard Input

```terminal
$ echo "Designed by Apple in California." | pos
VERB	Designed
PREPOSITION	by
NOUN	Apple
PREPOSITION	in
NOUN	California
```

### Reading from Standard Input Interactively

```terminal
$ pos
This text is being typed into standard input.
DETERMINER	This
NOUN	text
VERB	is
VERB	being
VERB	typed
PREPOSITION	into
ADJECTIVE	standard
NOUN	input
```

### Reading from a File

```terminal
$ cat german-pangram.txt
Falsches Üben von Xylophonmusik quält jeden größeren Zwerg

$ pos german-pangram.txt
ADJECTIVE	Falsches
NOUN	Üben
PREPOSITION	von
NOUN	Xylophonmusik
VERB	quält
DETERMINER	jeden
ADJECTIVE	größeren
NOUN	Zwerg
```

## Advanced Usage

`pos` can be chained with
[Unix text processing commands](https://en.wikibooks.org/wiki/Guide_to_Unix/Commands/Text_Processing),
like `cut`, `sort`, `uniq`, `comm`, `grep` `sed`, and `awk`.

### Filtering Tags

```terminal
$ pos german-pangram.txt | grep NOUN | cut -f2
Üben
Xylophonmusik
Zwerg
```

## Additional Details

Tagged words are written to standard output on separate lines.
Each line consists of
the part of speech tag (see table below),
followed by a tab (`\t`),
followed by the token:

```regexp
^(?<tag>([A-Z]+)\t(?<token>.+)$
```

`pos` uses
[`NLTagger`](https://developer.apple.com/documentation/naturallanguage/nltagger)
when available,
falling back on
[`NSLinguisticTagger`](https://developer.apple.com/documentation/foundation/nslinguistictagger)
for older versions of macOS.

### Part of Speech Tags

- `ADJECTIVE`
- `ADVERB`
- `CLASSIFIER`
- `CONJUNCTION`
- `DETERMINER`
- `IDIOM`
- `INTERJECTION`
- `NOUN`
- `NUMBER`
- `PARTICLE`
- `PREPOSITION`
- `PRONOUN`
- `VERB`

## License

MIT

## Contact

Mattt ([@mattt](https://twitter.com/mattt))
