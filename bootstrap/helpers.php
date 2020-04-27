<?php

function test_helper()
{
    return 'OK';
}

function valueOfDefault($arr, $default)
{
    foreach ($arr as $key => $value) {
        if (!$value) {
            $arr[$key] = $default;
        }
    }
    return $arr;
}

function isJsonArray($string)
{
    json_decode($string);
    if (json_last_error() == JSON_ERROR_NONE) {
        return is_array(json_decode($string, true));
    }
    return false;
}


function makeUniqueFileName($prefix = "")
{
    $prefix   = $prefix ? "." . $prefix : "";
    $filename = uniqid('ir', true) . $prefix;

    return $filename;
}
