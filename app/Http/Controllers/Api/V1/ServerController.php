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
    public function index(Request $request) {
        $url = config("pdns.api_url");
        $key = config("pdns.api_key");

        $client = new GuzzleHttp\Client();

        $res = $client->request('GET', $url."/api/v1/servers", [
            'X-API-Key' => $key
        ]);

        var_dump($res);
    }
}