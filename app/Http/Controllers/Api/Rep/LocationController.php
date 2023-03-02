<?php

namespace App\Http\Controllers\Api\Rep;

use App\Http\Controllers\GeneralApiController;
use App\Http\Requests\Api\LocationRequest;
use App\Http\Resources\LocationsResource;
use App\Models\Location;

class LocationController extends GeneralApiController
{
    public function __construct()
    {
        parent::__construct(Location::class, LocationsResource::class);
    }

    public function store(LocationRequest $request)
    {
        $rows = [];
        foreach ($request->validated('details') as $row)
            $rows[] = array_merge($row, ['shop_id' => shopId(), 'user_id' => auth()->id()]);
        $this->model::insert($rows);
        return $this->returnData($rows);
    }

    public function update(LocationRequest $request, $id)
    {
        $row = $this->model::find($id);
        if (!$row) return $this->sendError('This location not exists');
        $row->update($request->validated());
        return $this->sendResponse('Row updated successfully', ['data' => new $this->resource($row)]);
    }

    public function query(?int $id = null): \Illuminate\Database\Eloquent\Builder
    {
        return $this->model::query()->select('id', 'lat', 'lon', 'time', 'shop_id', 'user_id')->when($id, fn($q) => $q->where('id', $id));
    }
}
