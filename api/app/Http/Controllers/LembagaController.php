<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class LembagaController extends Controller
{
    public function getLembaga(Request $req)
    {
        if ($req->query('limit')) {
            $data = DB::table('lembaga')->limit($req->query('limit'))->orderBy('created_at', 'desc')->get();
        } else {
            $data = DB::table('lembaga')->orderBy('created_at', 'desc')->get();
        }

        return response()->json($data);
    }

    public function findLembaga($id)
    {
        $data = DB::table('lembaga')->where("uuid", $id)->first();

        return response()->json($data);
    }

    public function findLembagaBySlug($slug)
    {
        $data = DB::table('lembaga')->where("slug", $slug)->first();

        return response()->json($data);
    }

    public function addLembaga(Request $req)
    {
        DB::table('lembaga')->insert([
            "uuid" => uuid_create(),
            "name" => $req->input("name"),
            "surname" => $req->input("surname"),
            "address" => $req->input("address"),
            "slug" => $req->input("slug"),
            "profile" => $req->input("profile"),
            "visi" => $req->input("visi"),
            "tugas" => $req->input("tugas"),
            "image" => $req->input("image"),
            "created_at" => Carbon::now(),
        ]);

        return response()->json(['success' => true]);
    }

    public function updateLembaga(Request $req, $id)
    {
        DB::table('lembaga')->where("uuid", $id)->update([
            "name" => $req->input("name"),
            "address" => $req->input("address"),
            "surname" => $req->input("surname"),
            "slug" => $req->input("slug"),
            "profile" => $req->input("profile"),
            "visi" => $req->input("visi"),
            "tugas" => $req->input("tugas"),
            "image" => $req->input("image"),
        ]);

        return response()->json(['success' => true]);
    }


    public function removeLembaga($id)
    {
        DB::table('lembaga')->where("uuid", $id)->delete();

        return response()->json(['success' => true]);
    }
}
