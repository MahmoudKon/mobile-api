<?php

if ( !function_exists( 'shopId' ) ) {
    function shopId() {
        return auth()->user()->shop_id ?? null;
    }
}

if ( !function_exists( 'salePoint' ) ) {
    function salePoint() {
        return auth()->user()->sale_point ?? null;
    }
}

if (!function_exists( 'similarWords' ) ) {
    function similarWords(string $text): string
    {
        $replace = [
            "أ",
            "ا",
            "إ",
            "آ",
            "ي",
            "ى",
            "ه",
            "ة",
            "٩",
            "٨",
            "٧",
            "٦",
            "٥",
            "٤",
            "٣",
            "٢",
            "١",
            "٠",
            "9",
            "8",
            "7",
            "6",
            "5",
            "4",
            "3",
            "2",
            "1",
            "0",
        ];
        $with = [
            "(أ|ا|آ|إ)",
            "(أ|ا|آ|إ)",
            "(أ|ا|آ|إ)",
            "(أ|ا|آ|إ)",
            "(ي|ى)",
            "(ي|ى)",
            "(ه|ة)",
            "(ه|ة)",
            "(9|٩)",
            "(8|٨)",
            "(7|٧)",
            "(6|٦)",
            "(5|٥)",
            "(4|٤)",
            "(3|٣)",
            "(2|٢)",
            "(1|١)",
            "(0|٠)",
            "(9|٩)",
            "(8|٨)",
            "(7|٧)",
            "(6|٦)",
            "(5|٥)",
            "(4|٤)",
            "(3|٣)",
            "(2|٢)",
            "(1|١)",
            "(0|٠)"
        ];

        $new = array_combine($replace, $with);
        $return = "";
        $len = strlen(utf8_decode($text));
        for ($i = 0; $i < $len; $i++) {
            $current = mb_substr($text, $i, 1, 'utf-8');
            if (isset($new[$current])) {
                $return .= $new[$current];
            } else {
                $return .= $current;
            }
        }
        return $return;
    }
}
