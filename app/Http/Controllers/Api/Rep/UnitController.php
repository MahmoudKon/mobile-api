<?php

namespace App\Http\Controllers\Api\Rep;

use App\Http\Controllers\BasicApiController;
use App\Http\Resources\UnitsResource;
use App\Models\Unit;
use Illuminate\Http\Request;

class UnitController extends BasicApiController
{
    public function index()
    {
        $rows = Unit::select('id', 'name')->get();
        return $rows->count()
                    ? $this->sendResponse(result: ['data' => UnitsResource::collection($rows)])
                    : $this->sendError('no data');
    }

    public function store(Request $request)
    {
        $validation = $this->validateRequest($request->all());
        if (count($validation['errors'])) {
            return $this->sendError('no data', $validation['errors']);
        }
        $row = Unit::create($validation['validated']);
        return $row
                ? $this->sendResponse('Save Done successfully', ['data' => new UnitsResource($row)])
                : $this->sendError('Error try again');
    }

    public function show($id)
    {
        $row = Unit::find($id);
        return $row
                ? $this->sendResponse('Save Done successfully', ['data' => new UnitsResource($row)])
                : $this->sendError('This unit not found');
    }

    public function update(Request $request, $id)
    {
        $validation = $this->validateRequest($request->all(), $id);
        if (count($validation['errors'])) {
            return $this->sendError('no data', $validation['errors']);
        }

        $row = Unit::where('id',$id)->first();
        if (!$row) $this->sendError('This unit not exists');
        $row->update($validation['validated']);
        return $this->sendResponse('Save Done successfully', ['data' => new UnitsResource($row)]);
    }

    public function destroy($id)
    {
        $row = Unit::find($id);
        if ($row) {
            $row->delete();
            return $this->sendResponse('Unit Deleted successfully');
        }
        return $this->sendError('This unit not found');
    }

    protected function validateRequest(array $data, null|int $id = null): array
    {
        $errors = [];
        $validation = validator()->make($data, ['name' => "required|unique:units,name,$id,id,shop_id,$this->shop_id"]);

        if ($validation->fails()) {
            foreach ($validation->errors()->all() as $error)  array_push($errors, $error);
        }
        return ['validated' => $validation->validated(), 'errors' => $errors];
    }
}
