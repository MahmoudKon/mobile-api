<table class="table">
    <thead>
        <tr>
            <th scope="col" style="width: 50px;  text-align: center">م</th>
            <th scope="col" style="width: 100px; text-align: center">التاريخ</th>
            <th scope="col" style="width: 100px; text-align: center">صادر له</th>
            <th scope="col" style="width: 100px; text-align: center">مدفوع منه</th>
            <th scope="col" style="width: 100px; text-align: center">الرصيد</th>
            <th scope="col" style="width: 200px; text-align: center">الرصيدالبيان</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($transactions as $transaction)
            <tr>
                <td scope="col" style="text-align: center"> {{ $loop->iteration }} </td>
                <td scope="col" style="text-align: center"> {{ $transaction->pay_day }} </td>
                <td scope="col" style="text-align: center"> {{ $transaction->git }} </td>
                <td scope="col" style="text-align: center"> {{ $transaction->pay }} </td>
                <td scope="col" style="text-align: center"> {{ $transaction->balance }} </td>
                <td scope="col"> {{ $transaction->installment_id > 0 ? "سداد قسط" : $transaction->details }} </td>
            </tr>
        @endforeach
    </tbody>
</table>
