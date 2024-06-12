<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PerangkatDesaController extends Controller
{
    public function getPerangkatDesa(Request $req)
    {
        if ($req->query('limit')) {
            $data = DB::table('perangkat_desa')->limit($req->query('limit'))->orderBy('created_at', 'desc')->orderBy('created_at', 'desc')->get();
        } else {
            $data = DB::table('perangkat_desa')->orderBy('created_at', 'desc')->orderBy('created_at', 'desc')->get();
        }

        return response()->json($data);
    }

    public function findPerangkatDesa($id)
    {
        $data = DB::table('perangkat_desa')->where("uuid", $id)->first();

        return response()->json($data);
    }

    public function findPerangkatDesaBySlug($slug)
    {
        $data = DB::table('perangkat_desa')->where("slug", $slug)->first();

        return response()->json($data);
    }

    public function addPerangkatDesa(Request $req)
    {
        DB::table('perangkat_desa')->insert([
            "uuid" => uuid_create(),
            "name" => $req->input("name"),
            "slug" => $req->input("slug"),
            "nip" => $req->input("nip"),
            "visi" => $req->input("visi"),
            "job" => $req->input("job"),
            "job_id" => $req->input("job_id"),
            "image" => $req->input("image"),
            "created_at" => Carbon::now(),
        ]);

        return response()->json(['success' => true]);
    }

    public function updatePerangkatDesa(Request $req, $id)
    {
        DB::table('perangkat_desa')->where("uuid", $id)->update([
            "name" => $req->input("name"),
            "slug" => $req->input("slug"),
            "nip" => $req->input("nip"),
            "visi" => $req->input("visi"),
            "job" => $req->input("job"),
            "job_id" => $req->input("job_id"),
            "image" => $req->input("image"),
        ]);

        return response()->json(['success' => true]);
    }


    public function removePerangkatDesa($id)
    {
        DB::table('perangkat_desa')->where("uuid", $id)->delete();

        return response()->json(['success' => true]);
    }
}
