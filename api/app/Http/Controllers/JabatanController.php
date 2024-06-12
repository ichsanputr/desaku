<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class JabatanController extends Controller
{
    public function getJabatan(Request $req)
    {
        $data = DB::table('jabatan')->orderBy("order")->get();

        return response()->json($data);
    }

    public function findJabatan($id)
    {
        $data = DB::table('jabatan')->where("uuid", $id)->first();

        return response()->json($data);
    }

    public function findJabatanPerangkat($id)
    {
        $data = DB::table('perangkat_desa')->where("job_id", $id)->get();

        return response()->json($data);
    }

    public function addJabatan(Request $req)
    {
        DB::table('jabatan')->insert([
            "uuid" => uuid_create(),
            "name" => $req->input("job"),
            "order" => DB::table('jabatan')->count() + 1
        ]);

        return response()->json(['success' => true]);
    }

    public function updateJabatan(Request $req, $id)
    {
        DB::table('jabatan')->where("uuid", $id)->update([
            "name" => $req->input("job"),
        ]);

        return response()->json(['success' => true]);
    }

    public function updateOrderJabatan(Request $req)
    {
        $data = $req->input("data");

        $i = 1;

        foreach ($data as $value) {
            DB::table('jabatan')->where("uuid", $value['uuid'])->update([
                "order" => $i,
            ]);
            $i++;
        }

        return response()->json(['success' => true]);
    }

    public function removeJabatan($id)
    {
        DB::table('jabatan')->where("uuid", $id)->delete();

        return response()->json(['success' => true]);
    }
}
