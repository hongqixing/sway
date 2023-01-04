script;

fn main() -> u64 {
    let s = "foo \t bar";
    f(s, s)
}

fn f(a: str[10], b: str[10]) -> u64 {
    // There are 2 strings.
    2
}

// This test is pretty broken, but only because our string support is pretty broken.  So this is
// really just snapshotting the current situation, but string support in the compiler needs to
// improve.

// check: local string<10> s

// check: $(s_var=$VAL) = get_local string<10> s
// check: $(str_lit=$VAL) = const string<10> "foo \x5ct bar"
// check: store $str_lit to $s_var

// check: $(l_var=$VAL) = get_local string<10> s
// check: $(r_var=$VAL) = get_local string<10> s
// check: $(res=$VAL) = call $ID($l_var, $r_var)
// check: ret u64 $res
