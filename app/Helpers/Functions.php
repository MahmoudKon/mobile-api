<?php

if ( !function_exists( 'authUser' ) ) {
    function authUser(): ?\App\Models\User {
        return auth()->user();
    }
}

if ( !function_exists( 'authId' ) ) {
    function authId(): ?int {
        return auth()->id();
    }
}

if ( !function_exists( 'shopId' ) ) {
    function shopId(): ?int {
        return authUser()->shop_id ?? null;
    }
}

if ( !function_exists( 'salePointId' ) ) {
    function salePointId(): ?int {
        return authUser()->sale_point ?? null;
    }
}

if ( !function_exists( 'shop' ) ) {
    function shop(): \App\Models\Badrshop {
        return authUser()->shop ?? new \App\Models\Badrshop();
    }
}

if ( !function_exists( 'format_price' ) ) {
    function format_price(float $price): float {
        return $price;
        return number_format($price, shop()->decimal_num_price ?? 2);
    }
}

if (!function_exists( 'day_now' )) {
    function day_now(int $type): string {
        if ($type == 1) \Carbon\Carbon::setLocale('ar');
        return \Carbon\Carbon::now()->format('Y-m-d H:i:s');
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


if (! function_exists( 'getTypeName' )) {
    function getTypeName (int $type): string {
        $types = [
            0 => "مردود  مبيعات",
            1 => "فاتورة بيع",
            2 => "عملية سداد من العميل",
            3 => "فاتورة مشتريات",
            4 => "رصيد جديد",
            5 => "فاتورة مرتجع مشتريات",
            6 => "دفع للشركة",
            7 => "مردود  نقدى من  الشركة",
            8 => "تعديل مباشر للرصيد",
            9 => "مردود نقدى للعميل",
            10 => "تسجيل مصروفات",
            11 => "تحويل خزينة",
            12 => "تحويل مخزن",
            13 => "صرف على مقايسة",
            14 => "تسوية مقايسة",
            15 => "تسوية مقايسة",
            22 => "تم الحذف من قاعدة البيانات",
            24 => "تسجيل إيرادات",
            25 => "مدفوع بلاغات",
            27 => "تعديل  للكمية",
            30 => "حذف صنف من فاتورة المبيعات",
            31 => "إضافة صنف على الفاتورة",
            32 => "إضافة صنف جديد لفاتورة الشراء",
            33 => "حذف صنف من فاتورة الشراء",
            34 => "تعديل فاتورة مبيعات",
            40 => "حافز على المرتب",
            41 => "خصم من  المرتب",
            42 => "سلفة",
            43 => "صرف مرتب",
            50 => "تصنيع",
            51 => "حذف امر تصنيع",
            60 => "خصم رصيد عميل",
            61 => "خصم رصيد مورد",
            62 => "إهلاك",
            101 => "رصيد سابق",
        ];

        return $types[$type] ?? "....";
    }
}
