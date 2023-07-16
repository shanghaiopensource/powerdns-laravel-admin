<?php

namespace App\Http\Controllers\Api\V1;

use Illuminate\Http\Request;
use App\Models\Authorization;
use App\Transformers\AuthorizationTransformer;
use Exonet\Powerdns\Powerdns;
use Exonet\Powerdns\RecordType;

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

        $powerdns = new Powerdns($url, $key);

        // Create a new zone.
        $zone = $powerdns->createZone(
            'example.com',
            ['ns1.example.com.', 'ns2.example.com.']
        );

        var_dump($powerdns,$zone);exit;

        $client = new \GuzzleHttp\Client(['debug'=>true]);

        $res = $client->request('POST', $url."/api/v1/servers", ['header'=>[
            'X-API-Key' => $key,
            'Accept' => 'application/json',
            'Content-Type' => 'application/json',

        ]]);

        var_dump($res);
    }
}