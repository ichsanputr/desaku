<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class LokasiDesaController extends Controller
{
    public function getLocation()
    {
        $data =  DB::table('lokasi_desa')->where("uuid", "1")->first();

        return response()->json($data);
    }

    public function updateLocation(Request $req)
    {
        DB::table('lokasi_desa')->where("uuid", '1')->update([
            "desa" => $req->input("desa"),
            "kecamatan" => $req->input("kecamatan"),
            "kabupaten" => $req->input("kabupaten"),
            "kelurahan" => $req->input("kelurahan"),
            "provinsi" => $req->input("provinsi"),
            "rt" => $req->input("rt"),
            "rw" => $req->input("rw"),
            "maps" => $req->input("maps"),
        ]);

        return response()->json(['success' => true]);
    }
}
