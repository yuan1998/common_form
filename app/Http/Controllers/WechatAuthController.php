<?php

namespace App\Http\Controllers;

use App\Http\Requests\WechatJsSdkRequest;
use Overtrue\LaravelWeChat\Facade as EasyWeChat;

class WechatAuthController extends Controller
{
    public function jssdkConfigBuilder(WechatJsSdkRequest $request)
    {
        $url = $request->get('url');

        $officialAccount = EasyWeChat::officialAccount();
        $officialAccount->jssdk->setUrl($url);
        $config = $officialAccount->jssdk->buildConfig($request->get('jsApiList'),
            !!$request->get('debug'));

        return response()->json($config);
    }
}
