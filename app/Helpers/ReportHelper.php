<?php

function itemReport($transaction)
{
    $case = "..... $transaction->type ......";

    switch ($transaction->type) {
        case '0': //مردود  مبيعات
            $case = "مردود مبيعات {$transaction->invoice->bill_no}";
            break;
        case '1': // فاتورة بيع
            $case = "فاتورة مبيعات {$transaction->invoice->bill_no}";
            break;
        case '2': //عملية سداد من العميل
            $case = "عملية سداد";
            break;
        case '4': //رصيد جديد
            $case = "رصيد جديد";
            break;
        case '8': //تعديل مباشر للرصيد
            $case = "تعديل مباشر للرصيد";
            break;
        case '9': //مردود نقدى للعميل
            $case = "مردود نقدي";
            break;
    }
    return $case;
}

function prepareTransactions($transactions)
{
    foreach ($transactions as $transaction) {
        if (in_array($transaction->type, [1, 5, 2])) {
            $transaction->git = $transaction->bill_net_total;
            $transaction->pay = $transaction->amount;
        } else {
            $transaction->pay = $transaction->bill_net_total;
            $transaction->git = $transaction->amount;
        }
        $transaction->details = itemReport($transaction);
    };
    return $transactions;
}