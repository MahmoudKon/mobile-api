<?php

namespace App\Http\Controllers\Api\Rep;

use App\Http\Controllers\BasicApiController;
use App\Http\Requests\Api\UnitRequest;
use App\Http\Resources\UnitsResource;
use App\Models\Unit;

class UnitController extends BasicApiController
{
    public function index()
    {
        $rows = Unit::select('id', 'name')->get();
        return $rows->count()
                    ? $this->sendResponse(result: ['data' => UnitsResource::collection($rows)])
                    : $this->sendError('no data');
    }

    public function store(UnitRequest $request)
    {
        $row = Unit::create($request->validated());
        return $row
                ? $this->sendResponse('Unit created successfully', ['data' => new UnitsResource($row)])
                : $this->sendError('Error try again');
    }

    public function show($id)
    {
        $row = Unit::find($id);
        return $row
                ? $this->sendResponse(result: ['data' => new UnitsResource($row)])
                : $this->sendError('This unit not found');
    }

    public function update(UnitRequest $request, $id)
    {
        $row = Unit::find($id);
        if (!$row) $this->sendError('This unit not exists');
        $row->update($request->validated());
        return $this->sendResponse('Unit updated successfully', ['data' => new UnitsResource($row)]);
    }

    public function destroy($id)
    {
        $row = Unit::find($id);
        if ($row) {
            $row->delete();
            return $this->sendResponse('Unit deleted successfully');
        }
        return $this->sendError('This unit not found');
    }
}
