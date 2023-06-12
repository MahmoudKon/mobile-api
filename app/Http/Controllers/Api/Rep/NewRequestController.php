<?php

namespace App\Http\Controllers\Api\Rep;

use App\Http\Controllers\BasicApiController;
use App\Http\Requests\Api\NewRequestRequest;
use App\Http\Services\NewRequestService;
use App\Models\NewRequest;

class NewRequestController extends BasicApiController
{
    public function store(NewRequestRequest $request, NewRequestService $service)
    {
        $response = $service->handler($request->all(), NewRequest::PURCHASES);
        if ($response['status'] == 200) return $this->sendResponse(result: ['data' => $response['data']]);
        return $this->sendError($response['message']);
    }
}
