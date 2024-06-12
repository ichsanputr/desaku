<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PotensiDesaController extends Controller
{
    public function getPotensiDesa(Request $req)
    {
        $total = DB::table('potensi_desa')->count();
        $data = null;

        if ($req->query('limit') && $req->query('page')) {
            // pagination data
            $offset = $req->query('page') * 5 - 5;

            $data = DB::table('potensi_desa')
                ->limit($req->query('limit'))
                ->offset($offset);
        } else if ($req->query('limit') && !$req->query('offset')) {
            // latest news
            $data = DB::table('potensi_desa')
                ->limit($req->query('limit'));
        } else {
            $data = DB::table('potensi_desa');
        }

        $query = $data->join('kategori_potensi', 'potensi_desa.category', '=', 'kategori_potensi.uuid');

        if ($req->query('category')) {
            $query = $query->where("kategori_potensi.slug", $req->query('category'));
        }

        $query = $query->select('potensi_desa.*', 'kategori_potensi.name as category_name', 'kategori_potensi.slug as category_slug');

        if ($req->query('limit')) {
            $data = $query->limit($req->query('limit'))->orderBy('created_at', 'desc')->get();
        } else {
            $data = $query->orderBy('created_at', 'desc')->get();
        }

        $category = DB::table('kategori_potensi')
            ->where("slug", $req->query('category'))
            ->first("name");

        return response()->json([
            "category_name" => $category->name ?? null,
            "data" => $data,
            "total" => $total,
        ]);
    }

    public function findPotensiDesa($id)
    {
        $data = DB::table('potensi_desa')->where("uuid", $id)->first();

        return response()->json($data);
    }

    public function findPotensiDesaByCategory($slug)
    {
        $data = DB::table('potensi_desa')
            ->join('kategori_potensi', 'potensi_desa.category', '=', 'kategori_potensi.uuid')
            ->where("potensi_desa.slug", $slug)
            ->first();

        return response()->json($data);
    }

    public function addPotensiDesa(Request $req)
    {
        DB::table('potensi_desa')->insert([
            "uuid" => uuid_create(),
            "title" => $req->input("title"),
            "category" => $req->input("category"),
            "slug" => $req->input("slug"),
            "description" => $req->input("description"),
            "thumbnail" => $req->input("thumbnail"),
            "user_id" => $req->input("user"),
            "content" => $req->input("content"),
            "created_at" => Carbon::now(),
        ]);

        return response()->json(['success' => true]);
    }

    public function updatePotensiDesa(Request $req, $id)
    {
        if (
            !DB::table('potensi_desa')
                ->where("user_id", $req->input('user'))
                ->where("uuid", $id)
                ->exists()

            && !$req->input('is_admin')
        ) {
            abort(403);
        }

        DB::table('potensi_desa')->where("uuid", $id)->update([
            "title" => $req->input("title"),
            "slug" => $req->input("slug"),
            "category" => $req->input("category"),
            "description" => $req->input("description"),
            "content" => $req->input("content"),
            "thumbnail" => $req->input("thumbnail"),
        ]);

        return response()->json(['success' => true]);
    }


    public function removePotensiDesa($id)
    {
        DB::table('potensi_desa')->where("uuid", $id)->delete();

        return response()->json(['success' => true]);
    }

    public function getPotensiCategory(Request $req)
    {
        if ($req->query('allow_empty')) {
            $data = DB::table('potensi_desa')
                ->join('kategori_potensi', 'potensi_desa.category', '=', 'kategori_potensi.uuid')
                ->select('kategori_potensi.*')
                ->distinct()
                ->orderBy('created_at', 'desc')->get();
        } else {
            $data = DB::table('kategori_potensi')->orderBy('created_at', 'desc')->get();
        }


        return response()->json($data);
    }

    public function findPotensiCategory($id)
    {
        $data = DB::table('kategori_potensi')->where("uuid", $id)->first();

        return response()->json($data);
    }

    public function updatePotensiCategory(Request $req, $id)
    {
        if (
            !DB::table('kategori_potensi')
                ->where("user_id", $req->input('user'))
                ->where("uuid", $id)
                ->exists()

            && !$req->input('is_admin')
        ) {
            abort(403);
        }

        $data = DB::table('kategori_potensi')->where("uuid", $id)->update([
            "name" => $req->input("name"),
            "slug" => $req->input("slug")
        ]);

        return response()->json($data);
    }

    public function addPotensiCategory(Request $req)
    {
        DB::table('kategori_potensi')->insert([
            "uuid" => uuid_create(),
            "name" => $req->input("name"),
            "slug" => $req->input("slug"),
            "user_id" => $req->input("user"),
        ]);

        return response()->json(['success' => true]);
    }

    public function removePotensiCategory(Request $req, $id)
    {
        DB::table('kategori_potensi')->where("uuid", $id)->delete();

        return response()->json(['success' => true]);
    }
}
