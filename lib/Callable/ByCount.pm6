unit module Callable::ByCount;
use MONKEY-GUTS;

sub call-by-count (|) is export {
    c |args[lazy ^&c.count]
}
