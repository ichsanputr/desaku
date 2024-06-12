<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use GuzzleHttp\Client;
use Illuminate\Support\Facades\DB;
use \Carbon\Carbon;

class ImageController extends Controller
{
    public function upload(Request $request)
    {
        $fileExt = $request->file('image')->getClientOriginalExtension();

        if ($request->file('image')->getSize() / (1024 * 1024) > 1.1) {
            return response()->json([
                "code" => "FILE_SIZE"
            ], 403);
        }

        if (!in_array($fileExt, ['webp', 'svg', 'jpg', 'jpeg', 'png'])) {
            return response()->json([
                "code" => "FILE_EXT"
            ], 403);
        }

        $client = new Client();
        $url = "https://upload.imagekit.io/api/v2/files/upload";

        if ($request->hasFile('image')) {
            $image = base64_encode(file_get_contents($request->file('image')));

            try {
                $response = $client->post($url, [
                    'multipart' => [
                        [
                            'name' => 'file',
                            'contents' => $image,
                        ],
                        [
                            'name' => 'fileName',
                            'contents' => $request->file('image')->getClientOriginalName(),
                        ],
                        [
                            'name' => 'folder',
                            'contents' => '/desaku',
                        ],
                    ],
                    'auth' => [env("IMAGEKIT_PRIVATE_KEY"), null]
                ]);

                $body = $response->getBody();
                $body = json_decode($body, true);

                DB::table('gambar')->insert([
                    'uuid' => uuid_create(),
                    'url' => $body['url'],
                    'image_id' => $body['fileId'],
                    'created_at' => Carbon::now(),
                ]);

                return response()->json([
                    "msg" => "Success upload file!",
                    "url" => $body['url']
                ]);
            } catch (\Exception $e) {
                return response()->json([
                    'error' => $e->getMessage()
                ], 500);
            }
        } else {
            return "No image uploaded!";
        }
    }

    public function get()
    {
        $data = DB::table('gambar')->orderBy('created_at', 'desc')->get();

        return response()->json($data);
    }

    public function remove($id)
    {
        if (!$id) {
            abort(400);
        }

        $client = new Client();
        $url = "https://api.imagekit.io/v1/files/" . $id;

        try {
            $response = $client->delete($url, [
                'auth' => [env("IMAGEKIT_PRIVATE_KEY"), null]
            ]);

            $body = $response->getBody();
            $body = json_decode($body, true);

            DB::table('gambar')->where("image_id", $id)->delete();

            return response()->json([
                "msg" => "Success delete file!"
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'error' => $e->getMessage()
            ], 500);
        }
    }
}
