<?php

namespace App\Http\Controllers\Api\Rep;

use App\Http\Controllers\BasicApiController;
use App\Http\Controllers\Controller;
use App\Http\Requests\Api\LocationRequest;
use App\Http\Resources\LocationsResource;
use App\Models\Location;
use Illuminate\Http\Request;

class LocationController extends BasicApiController
{
    public function index()
    {
        $rows = Location::select('id', 'lat', 'lon', 'time', 'shop_id', 'user_id')->with('user')->get();
        return $this->returnData(LocationsResource::collection($rows));
    }

    public function store(LocationRequest $request)
    {
        $rows = [];
        foreach ($request->validated('details') as $row) {
            $rows[] = array_merge($row, ['shop_id' => shopId(), 'user_id' => auth()->id()]);
        }
        Location::insert($rows);
        return $this->returnData($rows);
    }

    public function show($id)
    {
        $row = Location::select('id', 'lat', 'lon', 'time', 'shop_id', 'user_id')->with('user')->find($id);
        return $row
            ? $this->sendResponse(result: ['data' => new LocationsResource($row)])
            : $this->sendError('This location not found');
    }

    public function update(LocationRequest $request, $id)
    {
        $row = Location::find($id);
        if (!$row) $this->sendError('This location not exists');
        $row->update($request->validated());
        return $this->sendResponse('Location updated successfully', ['data' => new LocationsResource($row)]);
    }

    public function destroy($id)
    {
        return Location::where('id', $id)->delete() > 0
                    ? $this->sendResponse('Location deleted successfully')
                    : $this->sendError('This location not found');
    }
}
