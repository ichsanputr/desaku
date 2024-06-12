<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HeaderController extends Controller
{
    public function getHeader()
    {
        $data =  DB::table('header')->where("uuid", "1")->first();

        return response()->json($data);
    }

    public function updateHeader(Request $req)
    {
        DB::table('header')->where("uuid", '1')->update([
            "no_telp" => $req->input("no_telp"),
            "email" => $req->input("email"),
            "logo" => $req->input("logo"),
            "site_name" => $req->input("site_name"),
            "description" => $req->input("description"),
        ]);

        return response()->json(['success' => true]);
    }
}
