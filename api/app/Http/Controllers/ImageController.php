<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ImageController extends Controller
{
    public function upload(Request $request)
    {
        $fileExt = $request->file('image')->getClientOriginalExtension();

        if ($request->file('image')->getSize() / (1024 * 1024) > 1.1){
            return response()->json([
                "code" => "FILE_SIZE"
            ], 403);
        }

        if (!in_array($fileExt, ['webp', 'svg','jpg', 'jpeg', 'png'])){
            return response()->json([
                "code" => "FILE_EXT"
            ], 403);
        }

        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = time() . '.' . $image->getClientOriginalExtension();
            $image->storeAs('public', $imageName); 
            return response()->json([
                'data' => env('APP_URL') . "/storage/" . $imageName
            ]);
        } else {
            return "No image uploaded!";
        }
    }

    public function get()
    {
        $data = Storage::files('public');

        $data = array_filter($data, function($file) {
            $extension = pathinfo($file, PATHINFO_EXTENSION);
            return in_array($extension, ['jpg', 'jpeg', 'png', 'gif', 'bmp']);
        });

        $data = array_map(function ($val) {
            return env('APP_URL') . '/' . str_replace("public", "storage", $val) ;
        }, $data);

        return response()->json(array_reverse($data));
    }

    public function remove($file)
    {
        if (Storage::disk('public')->exists($file)) {
            Storage::disk('public')->delete($file);
        }

        return "Image deleted";
    }
}
