<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class VideoGaleriController extends Controller
{
    public function getVideoGallery(Request $req)
    {
        $total = DB::table('video_galeri')->count();

        if ($req->query('limit') && $req->query('page')) {
            // pagination data
            $offset = $req->query('page') * $req->query('limit') - $req->query('limit');

            $data = DB::table('video_galeri')
                ->limit($req->query('limit'))
                ->offset($offset);
        } else if ($req->query('limit') && !$req->query('offset')) {
            // latest news
            $data = DB::table('video_galeri')
                ->limit($req->query('limit'));
        } else {
            $data = DB::table('video_galeri');
        }

        $data = $data->orderBy('created_at', 'desc')->get();

        return response()->json([
            "data" => $data,
            "total" => $total,
        ]);
    }

    public function addVideoGallery(Request $req)
    {
        DB::table('video_galeri')->insert([
            "uuid" => uuid_create(),
            "description" => $req->input("description"),
            "url" => $req->input("video"),
            "user_id" => $req->input("user"),
            "created_at" => Carbon::now(),
        ]);

        return response()->json(['success' => true]);
    }

    public function removeVideoGallery($id)
    {
        DB::table('video_galeri')->where("uuid", $id)->delete();

        return response()->json(['success' => true]);
    }
}
