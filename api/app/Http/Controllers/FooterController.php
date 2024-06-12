<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class FooterController extends Controller
{
    public function getFooter()
    {
        $data =  DB::table('footer')->where("uuid", "1")->first();

        return response()->json($data);
    }

    public function updateFooter(Request $req)
    {
        DB::table('footer')->where("uuid", '1')->update([
            "profile" => $req->input("profile"),
            "address" => $req->input("address"),
            "copyright" => $req->input("copyright"),
        ]);

        return response()->json(['success' => true]);
    }
}
