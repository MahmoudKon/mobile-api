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