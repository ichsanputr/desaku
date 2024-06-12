<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class GambarGaleriController extends Controller
{
    public function getImageGallery(Request $req)
    {
        $total = DB::table('gambar_galeri')->count();

        if ($req->query('limit') && $req->query('page')) {
            // pagination data
            $offset = $req->query('page') * $req->query('limit') - $req->query('limit');

            $data = DB::table('gambar_galeri')
                ->limit($req->query('limit'))
                ->offset($offset);
        } else if ($req->query('limit') && !$req->query('offset')) {
            // latest news
            $data = DB::table('gambar_galeri')
                ->limit($req->query('limit'));
        } else {
            $data = DB::table('gambar_galeri');
        }

        $data = $data->orderBy('created_at', 'desc')->get();

        return response()->json([
            "data" => $data,
            "total" => $total,
        ]);
    }

    public function findImageGallery($id)
    {
        $data = DB::table('gambar_galeri')->where("uuid", $id)->first();

        return response()->json($data);
    }

    public function addImageGallery(Request $req)
    {
        DB::table('gambar_galeri')->insert([
            "uuid" => uuid_create(),
            "description" => $req->input("description"),
            "url" => $req->input("image"),
            "user_id" => $req->input("user"),
            "created_at" => Carbon::now(),
        ]);

        return response()->json(['success' => true]);
    }

    public function updateImageGallery(Request $req, $id)
    {
        if (
            !DB::table('gambar_galeri')
            ->where("user_id", $req->input('user'))
            ->where("uuid", $id)
            ->exists()

            && !$req->input('is_admin')
        ){
            abort(403);
        }

        DB::table('gambar_galeri')->where("uuid", $id)->update([
            "description" => $req->input("description"),
            "url" => $req->input("image"),
        ]);

        return response()->json(['success' => true]);
    }

    public function removeImageGallery($id)
    {
        DB::table('gambar_galeri')->where("uuid", $id)->delete();

        return response()->json(['success' => true]);
    }
}
