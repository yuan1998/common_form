<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\ImageManagerStatic as Image;

class ImageController extends Controller
{

    public static $allowedMimeTypes = ['image/jpeg', 'image/gif', 'image/png', 'image/bmp', 'image/svg+xml'];
    public static $cacheName = '__cache';
    public static $sizeWidth = [
        'small'   => [
            'width'   => 340,
            'quality' => 50,
        ],
        'medium'  => [
            'width'   => 840,
            'quality' => 50,
        ],
        'large'   => [
            'width'   => 1040,
            'quality' => 50,
        ],
        'default' => [
            'quality' => 50,
        ]
    ];

    public function fileInfo($filePath)
    {
        $filePath = pathinfo($filePath);
        return $filePath;
    }

    /**
     * small : 340
     * medium : 850
     * large : 1000
     * @param $size
     * @return bool
     */
    public function checkSize($size)
    {
        return Arr::exists(static::$sizeWidth, $size);
    }

    public function sizeImage($size, $path)
    {
        $info      = $this->fileInfo($path);
        $cacheName = static::$cacheName;
        $newPath   = "{$info['dirname']}/{$cacheName}/{$info['filename']}_{$size}.{$info['extension']}";
        if (!file_exists($newPath)) {
            $dirname = dirname($newPath);
            if (!is_dir($dirname))
                mkdir($dirname, 0777, true);
            $image   = Image::make($path);
            $config  = static::$sizeWidth[$size];
            $width   = data_get($config, 'width');
            $quality = data_get($config, 'quality', 50);

            $imageWidth = $image->getWidth();
            if ($width && $imageWidth > $width) {
                $height = $image->getHeight() / ($imageWidth / $width);
                $image->resize($width, $height);
            }

            $image->save($newPath, $quality);
        }
        return $newPath;
    }

    public function checkIsImage($path)
    {
        $contentType = mime_content_type($path);
        return in_array($contentType, static::$allowedMimeTypes);
    }

    public function index(Request $request)
    {
        $file = Route::getCurrentRoute()->parameter('any');
        if (!Storage::disk('public')->exists($file))
            abort(404);
        $path = Storage::disk('public')->path($file);

        if ($this->checkIsImage($path)) {
            $size = request()->get('size', '');
            if ($size) {
                if (!$this->checkSize($size))
                    abort(404);
                $path = $this->sizeImage($size, $path);
            }
        }

        return response()->file($path);
    }

    public function uploadImage(Request $request)
    {
        if ($request->hasFile('image')) {
            $file     = $request->file('image');
            $type     = $request->get('type', 'default');
            $filePath = "uploads/{$type}/" . date('Y/m-d');

            $path  = Storage::disk('public')->put($filePath, $file);

            return response()->json([
                'status' => 1,
                'url'    => Storage::disk('public')->url($path),
            ]);
        }

        return response()->json([
            'status' => 0,
            'msg'    => 'Request File Not Exists.'
        ]);
    }


}
