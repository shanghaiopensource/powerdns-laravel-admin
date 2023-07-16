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
            'zylinkus.com',
            ['ns1.zylinkus.com.', 'ns2.zylinkus.com.']
        );


        
    }
}