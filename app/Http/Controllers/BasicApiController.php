<?php

namespace App\Http\Controllers;

use Illuminate\Http\Resources\Json\JsonResource;

class BasicApiController extends Controller
{
    protected $shop_id;
    protected $store_id;
    protected $sale_point;

    public function __construct()
    {
        $this->shop_id    = shopId();
        $this->sale_point = salePointId();
    }

    /**
     * success response method.
     *
     * @return \Illuminate\Http\Response
     */
    public function sendResponse(string $message = '', array $result = [])
    {
        $response = ['status' => true];

        if($message != '') {
            $response = array_merge($response, ['message' => $message]);
        }

        if(! empty($result)) {
            $response = array_merge($response, $result);
        }

        return response()->json($response, 200);
    }

    /**
     * return error response.
     *
     * @return \Illuminate\Http\Response
     */
    public function sendError(string $message = '', $errorMessages = [], $code = 200)
    {
        $response = ['status' => false];

        if($message != '') {
            $response = array_merge($response, ['message' => $message]);
        }

        if(!empty($errorMessages)) {
            $response['errors'] = $errorMessages;
        }

        return response()->json($response, $code);
    }

    /**
     * returnData
     * To check if data is empty or has count
     * @return mixed
     */
    public function returnData(array|JsonResource $rows = []): mixed
    {
        return count($rows)
            ? $this->sendResponse(result: ['data' => $rows])
            : $this->sendError('No Data Found');
    }
}
