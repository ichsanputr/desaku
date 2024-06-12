<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class StrukturOrganisasiController extends Controller
{
    public function getStrukturOrganisasi()
    {
        $data = DB::table('struktur_organisasi')->where("uuid", "1")->first("content");

        return response()->json($data);
    }

    public function updateStrukturOrganisasi(Request $req)
    {
        DB::table('struktur_organisasi')->where("uuid", 1)->update([
            "content" => $req->input("content")
        ]);

        return response()->json(['success' => true]);
    }
}
