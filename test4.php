<?php
function en2($arg1, $arg2) {
    $g = "";
    while (strlen($g) < strlen($arg1)) {
        $arg2 = pack("H*", md5($g.$arg2."q1w2e3r4"));
        $g .= substr($arg2, 0, 8);
    }
    return $arg1^$g;
}
echo en2("?kgwLXze2:Wn@l.jS'", "str_replace");
?>