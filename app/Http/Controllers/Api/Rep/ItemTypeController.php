<?php

namespace App\Http\Controllers\Api\Rep;

use App\Http\Controllers\Controller;
use App\Http\Controllers\GeneralApiController;
use App\Http\Resources\ItemTypesResource;
use App\Models\ItemType;
use App\Http\Requests\Api\ItemTypeRequest;
use Illuminate\Http\Request;

class ItemTypeController extends GeneralApiController
{
    public function __construct()
    {
        parent::__construct(ItemType::class, ItemTypesResource::class);
    }

    public function store(ItemTypeRequest $request)
    {
        $row = $this->model::create($request->validated());
        return $row
            ? $this->sendResponse('Type created successfully', ['data' => new $this->resource($row)])
            : $this->sendError('Error try again');
    }

    public function update(ItemTypeRequest $request, $id)
    {
        $row = $this->model::find($id);
        if (!$row) return $this->sendError('This Type not exists');
        $row->update($request->validated());
        return $this->sendResponse('Type updated successfully', ['data' => new $this->resource($row)]);
    }

    public function query(?int $id = null): \Illuminate\Database\Eloquent\Builder
    {
        return $this->model::query()->select('id', 'name', 'upload_img')->when($id, fn($q) => $q->where('id', $id));
    }
}
