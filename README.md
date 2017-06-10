[![Build Status](https://travis-ci.org/zoffixznet/perl6-Callable-ByCount.svg)](https://travis-ci.org/zoffixznet/perl6-Callable-ByCount)

# NAME

Callable::ByCount - Execute Callables with args, based on their .count


# SYNOPSIS

```perl6
    use Callable::ByCount;

    for sub ($, $, $) {}, -> {}, {;}, {@_} -> &callable {
        say call-by-count &callable, 1, 2, 3, 4, 5, :meows, :42foos
    }

    #
    # that ↑ is same as that ↓ except faster
    #

    for sub ($, $, $) {}, -> {}, {;}, {@_} -> &callable {
        callable |(1, 2, 3, 4, 5)[lazy ^&callable.count], :meows, :42foos
    }
```

# DESCRIPTION

Your program takes a [`Callable`](https://docs.perl6.org/type/Callable) from
the user and you need to call it with some args, depending on its
[`.count`](https://docs.perl6.org/type/Callable). Call with no args, if it
doesn't take any args; call with these 2 args if it takes just two args, etc...

So, a buncha nested ternaries is the way to go, amirite? Hell no! Use this
module.

# EXPORTED SUBS

## `call-by-count`

Defined as:

```perl6
    sub call-by-count (&callable, |args)
```

Takes a [`Callable`](https://docs.perl6.org/type/Callable) and a bunch of
args to call it with. All named args will be passed as is. Positionals will
be passed based on the [`.count`](https://docs.perl6.org/type/Callable)
of the [`Callable`](https://docs.perl6.org/type/Callable), starting with the
first arg, if `.count` is `1`, sending two first args if the `.count` is `2`,
etc. If `.count` is `0` no positionals will be given. If `.count` is `Inf`,
all will be.

# LIMITATIONS



----

#### REPOSITORY

Fork this module on GitHub:
https://github.com/zoffixznet/perl6-Callable-ByCount

#### BUGS

To report bugs or request features, please use
https://github.com/zoffixznet/perl6-Callable-ByCount/issues

#### AUTHOR

Zoffix Znet (http://perl6.party/)

#### LICENSE

You can use and distribute this module under the terms of the
The Artistic License 2.0. See the `LICENSE` file included in this
distribution for complete details.

The `META6.json` file of this distribution may be distributed and modified
without restrictions or attribution.
