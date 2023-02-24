<?php

namespace App\Http\Controllers\Api\Rep;

use App\Http\Controllers\BasicApiController;
use App\Http\Controllers\Controller;
use App\Http\Resources\LocationsResource;
use App\Models\Location;
use Illuminate\Http\Request;

class LocationController extends BasicApiController
{
    public function index()
    {
        $rows = Location::select('id', 'lat', 'lon', 'time', 'shop_id')->with('user')->get();
        return $this->returnData(LocationsResource::collection($rows));
    }

    public function store(Request $request)
    {
        $validated = $this->validateRequest($request->all());
        if (count($validated['errors']) > 0) return $this->sendError(errorMessages: $validated['errors']);
        $rows = [];
        foreach ($validated['validated']['details'] as $row) {
            $rows[] = array_merge($row, ['shop_id' => auth()->user()->shop_id ?? 21036, 'user_id' => auth()->id() ?? 3]);
        }
        Location::insert($rows);
        return $this->returnData($rows);
    }

    protected function validateRequest(array $data, null|int $id = null): array
    {
        $errors = [];
        $validation = validator()->make($data, [
            'details' => "required|array|min:1",
            'details.*.time' => "required|date_format:Y-m-d H:i:s",
            'details.*.lon' => "required|string",
            'details.*.lat' => "required|string",
        ]);

        if ($validation->fails()) {
            foreach ($validation->errors()->getMessages() as $key => $error) $errors[$key] = $error[0];
        }
        return ['validated' => $validation->validated(), 'errors' => $errors];
    }
}
