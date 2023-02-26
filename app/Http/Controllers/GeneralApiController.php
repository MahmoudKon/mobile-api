<?php

namespace App\Http\Controllers;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class GeneralApiController extends BasicApiController
{
    /*
     * @param \Illuminate\Database\Eloquent\Model $model
     * @param \Illuminate\Http\Resources\Json\JsonResource $resource
     */
    public function __construct(protected string $model, protected string $resource)
    {
        parent::__construct();
    }

    public function query(?int $id = null): \Illuminate\Database\Eloquent\Builder
    {
        return $this->model::query()->when($id, fn($q) => $q->where('id', $id));
    }

    public function index()
    {
        $rows = $this->query()->get();
        return $rows->count()
            ? $this->sendResponse(result: ['data' => $this->resource::collection($rows)])
            : $this->sendError('no data found');
    }

    public function show($id)
    {
        $row = $this->query($id)->first();
        return $row
            ? $this->sendResponse(result: ['data' => new $this->resource($row)])
            : $this->sendError('This data not found');
    }

    public function destroy($id)
    {
        return $this->query($id)->delete() > 0
            ? $this->sendResponse('Row deleted successfully')
            : $this->sendError('This data not found');
    }
}
