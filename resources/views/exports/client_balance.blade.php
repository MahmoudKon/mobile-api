<table class="table">
    <thead>
        <tr>
            <th scope="col">م</th>
            <th scope="col">التاريخ</th>
            <th scope="col">صادر له</th>
            <th scope="col">مدفوع منه</th>
            <th scope="col">الرصيد</th>
            <th scope="col">الرصيدالبيان</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($transactions as $transaction)
            <tr>
                <td scope="col"> {{ $loop->iteration }} </td>
                <td scope="col"> {{ $transaction->pay_day }} </td>
                <td scope="col"> {{ $transaction->git }} </td>
                <td scope="col"> {{ $transaction->pay }} </td>
                <td scope="col"> {{ $transaction->balance }} </td>
                <td scope="col"> {{ $transaction->installment_id > 0 ? "سداد قسط" : $transaction->details }} </td>
            </tr>
        @endforeach
    </tbody>
</table>
