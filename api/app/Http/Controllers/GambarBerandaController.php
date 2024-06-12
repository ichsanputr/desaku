<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
Use \Carbon\Carbon;

class GambarBerandaController extends Controller
{
    public function getImageHomepage()
    {
        $data =  DB::table('gambar_beranda')->orderBy('created_at', 'desc')->get();

        return response()->json($data);
    }

    public function addImageHomepage(Request $req)
    {
        DB::table('gambar_beranda')->insert([
            "uuid" => uuid_create(),
            "description" => $req->input("description"),
            "url" => $req->input("image"),
            "created_at" => Carbon::now(),
            "updated_at" => Carbon::now(),
        ]);

        return response()->json(['success' => true]);
    }

    public function removeImageHomepage($id)
    {
        DB::table('gambar_beranda')->where("uuid", $id)->delete();

        return response()->json(['success' => true]);
    }
}
