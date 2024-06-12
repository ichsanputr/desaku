<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AlamatController extends Controller
{
    public function getAlamat()
    {
        $data =  DB::table('alamat')->get();

        return response()->json($data);
    }

    public function updateAlamat(Request $req)
    {
        DB::table('alamat')->delete();
        DB::table('alamat')->insert($req->input('address'));

        return response()->json(['success' => true]);
    }
}
