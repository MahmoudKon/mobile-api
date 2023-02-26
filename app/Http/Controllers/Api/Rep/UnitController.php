<?php

namespace App\Http\Controllers\Api\Rep;

use App\Http\Controllers\BasicApiController;
use App\Http\Controllers\GeneralApiController;
use App\Http\Requests\Api\UnitRequest;
use App\Http\Resources\UnitsResource;
use App\Models\Unit;
use Illuminate\Database\Eloquent\Builder;

class UnitController extends GeneralApiController
{
    public function __construct()
    {
        parent::__construct(Unit::class, UnitsResource::class);
    }

    public function store(UnitRequest $request)
    {
        $row = $this->model::create($request->validated());
        return $row
                ? $this->sendResponse('Unit created successfully', ['data' => new $this->resource($row)])
                : $this->sendError('Error try again');
    }

    public function update(UnitRequest $request, $id)
    {
        $row = $this->model::find($id);
        if (!$row) return $this->sendError('This unit not exists');
        $row->update($request->validated());
        return $this->sendResponse('Unit updated successfully', ['data' => new $this->resource($row)]);
    }

    public function query(?int $id = null): \Illuminate\Database\Eloquent\Builder
    {
        return $this->model::query()->select('id', 'name')->when($id, fn($q) => $q->where('id', $id));
    }
}
