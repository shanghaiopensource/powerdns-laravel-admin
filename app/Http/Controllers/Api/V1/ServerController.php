<?php

namespace App\Http\Controllers\Api\V1;

use Illuminate\Http\Request;
use App\Models\Authorization;
use App\Transformers\AuthorizationTransformer;

class ServerController extends BaseController
{
    /**
     * 
     * @api {get} /server 获取服务器列表
     * 
     *  */
    public function lists(Request $request) {
        $url = config("pdns.");
    }
}