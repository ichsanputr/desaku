<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ProfilDesaController extends Controller
{
    public function getVisi()
    {
        $data = DB::table('profil_desa')->where("uuid", "1")->first("visi");

        return response()->json($data);
    }

    public function updateVisi(Request $req)
    {
        DB::table('profil_desa')->where("uuid", 1)->update([
            "visi" => $req->input("content")
        ]);

        return response()->json(['success' => true]);
    }

    public function getSejarah()
    {
        $data = DB::table('profil_desa')->where("uuid", "1")->first("sejarah");

        return response()->json($data);
    }

    public function updateSejarah(Request $req)
    {
        DB::table('profil_desa')->where("uuid", 1)->update([
            "sejarah" => $req->input("content")
        ]);

        return response()->json(['success' => true]);
    }

    public function getTentang()
    {
        $data = DB::table('profil_desa')->where("uuid", "1")->first("tentang");

        return response()->json($data);
    }

    public function updateTentang(Request $req)
    {
        DB::table('profil_desa')->where("uuid", 1)->update([
            "tentang" => $req->input("content")
        ]);

        return response()->json(['success' => true]);
    }
}
