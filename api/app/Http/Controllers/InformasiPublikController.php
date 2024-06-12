<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class InformasiPublikController extends Controller
{
    public function getNews(Request $req)
    {
        $total = DB::table('berita')->count();
        $category = null;

        if ($req->query('limit') && $req->query('page')) {
            // pagination data
            $offset = $req->query('page') * 5 - 5;

            $data = DB::table('berita')
                ->limit($req->query('limit'))
                ->offset($offset);
        } else if ($req->query('limit') && !$req->query('offset')) {
            // latest news
            $data = DB::table('berita')
                ->limit($req->query('limit'));
        } else {
            $data = DB::table('berita');
        }

        $data = $data
            ->join('kategori_berita', 'berita.category_id', '=', 'kategori_berita.uuid')
            ->join('user', 'berita.user_id', '=', 'user.uuid');

        if ($req->query('category')) {
            $category = DB::table('kategori_berita')
                ->where("slug", $req->query('category'))
                ->first("name");
            $category = $category->name;

            $data = $data->where('kategori_berita.slug', $req->query('category'));

            // get total item base on category
            $total = DB::table('berita')
                ->join('kategori_berita', 'berita.category_id', '=', 'kategori_berita.uuid')
                ->join('user', 'berita.user_id', '=', 'user.uuid')
                ->where("kategori_berita.slug", $req->query('category'))
                ->count();
        }

        $data = $data->select('berita.*', 'user.name as created_by', 'kategori_berita.name', 'kategori_berita.slug as category_slug')
            ->orderBy('created_at', 'desc')
            ->orderBy('created_at', 'desc')->get();

        return response()->json([
            "data" => $data,
            "total" => $total,
            "category_name" => $category,
        ]);
    }

    public function findNews($id)
    {
        $data = DB::table('berita')->where("uuid", $id)->first();

        return response()->json($data);
    }

    public function findNewsBySlug($slug)
    {
        $data = DB::table('berita')
            ->join('user', 'berita.user_id', '=', 'user.uuid')
            ->join('kategori_berita', 'berita.category_id', '=', 'kategori_berita.uuid')
            ->select('berita.*', 'user.name as created_by', 'kategori_berita.slug', 'kategori_berita.name as category_name')
            ->where("berita.slug", $slug)
            ->first();

        return response()->json($data);
    }

    public function addNews(Request $req)
    {
        DB::table('berita')->insert([
            "uuid" => uuid_create(),
            "title" => $req->input("title"),
            "slug" => $req->input("slug"),
            "description" => $req->input("description"),
            "category_id" => $req->input("category_id"),
            "content" => $req->input("content"),
            "thumbnail" => $req->input("thumbnail"),
            "user_id" => $req->input("user"),
            "created_at" => Carbon::now(),
            "updated_at" => Carbon::now(),
        ]);

        return response()->json(['success' => true]);
    }

    public function removeNews(Request $req, $id)
    {
        DB::table('berita')->where("uuid", $id)->delete();

        return response()->json(['success' => true]);
    }

    public function updateNews(Request $req, $id)
    {
        if (
            !DB::table('berita')
                ->where("user_id", $req->input('user'))
                ->where("uuid", $id)
                ->exists()

            && !$req->input('is_admin')
        ) {
            abort(403);
        }

        $data = DB::table('berita')->where("uuid", $id)->update([
            "title" => $req->input("title"),
            "slug" => $req->input("slug"),
            "description" => $req->input("description"),
            "category_id" => $req->input("category_id"),
            "content" => $req->input("content"),
            "thumbnail" => $req->input("thumbnail"),
            "updated_at" => Carbon::now()
        ]);

        return response()->json($data);
    }

    public function getAnnouncement(Request $req)
    {
        $total = DB::table('pengumuman')->count();

        if ($req->query('limit') && $req->query('page')) {
            // pagination data
            $offset = $req->query('page') * 5 - 5;

            $data = DB::table('pengumuman')
                ->limit($req->query('limit'))
                ->offset($offset);
        } else if ($req->query('limit') && !$req->query('offset')) {
            // latest news
            $data = DB::table('pengumuman')
                ->limit($req->query('limit'));
        } else {
            $data = DB::table('pengumuman');
        }

        $data = $data->join('user', 'pengumuman.user_id', '=', 'user.uuid')->select("pengumuman.*", "user.email", "user.name");
        $data = $data->orderBy('pengumuman.created_at', 'desc')->get();

        return response()->json([
            "data" => $data,
            "total" => $total,
        ]);
    }

    public function findAnnouncement($id)
    {
        $data = DB::table('pengumuman')->where("uuid", $id)->first();

        return response()->json($data);
    }

    public function findAnnouncementBySlug($slug)
    {
        $data = DB::table('pengumuman')->join('user', 'pengumuman.user_id', '=', 'user.uuid')->where("slug", $slug)->first();

        return response()->json($data);
    }

    public function addAnnouncement(Request $req)
    {
        DB::table('pengumuman')->insert([
            "uuid" => uuid_create(),
            "title" => $req->input("title"),
            "slug" => $req->input("slug"),
            "description" => $req->input("description"),
            "content" => $req->input("content"),
            "user_id" => $req->input("user"),
            "created_at" => Carbon::now(),
            "updated_at" => Carbon::now()
        ]);

        return response()->json(['success' => true]);
    }

    public function updateAnnouncement(Request $req, $id)
    {
        if (
            !DB::table('pengumuman')
                ->where("user_id", $req->input('user'))
                ->where("uuid", $id)
                ->exists()

            && !$req->input('is_admin')
        ) {
            abort(403);
        }

        $data = DB::table('pengumuman')->where("uuid", $id)->update([
            "title" => $req->input("title"),
            "description" => $req->input("description"),
            "content" => $req->input("content"),
            "slug" => $req->input("slug"),
            "updated_at" => Carbon::now()
        ]);

        return response()->json($data);
    }

    public function removeAnnouncement(Request $req, $id)
    {
        DB::table('pengumuman')->where("uuid", $id)->delete();

        return response()->json(['success' => true]);
    }

    public function getNewsCategory(Request $req)
    {
        if ($req->query('allow_empty')) {
            $data = DB::table('berita')
                ->join('kategori_berita', 'berita.category_id', '=', 'kategori_berita.uuid')
                ->select('kategori_berita.*')
                ->distinct()
                ->orderBy('created_at', 'desc')->get();
        } else {
            $data = DB::table('kategori_berita')->orderBy('created_at', 'desc')->get();
        }

        return response()->json($data);
    }

    public function findNewsCategory($id)
    {
        $data = DB::table('kategori_berita')->where("uuid", $id)->first();

        return response()->json($data);
    }

    public function updateNewsCategory(Request $req, $id)
    {
        if (
            !DB::table('kategori_berita')
                ->where("user_id", $req->input('user'))
                ->where("uuid", $id)
                ->exists()

            && !$req->input('is_admin')
        ) {
            abort(403);
        }

        $data = DB::table('kategori_berita')->where("uuid", $id)->update([
            "name" => $req->input("name"),
            "slug" => $req->input("slug")
        ]);

        return response()->json($data);
    }

    public function addNewsCategory(Request $req)
    {
        DB::table('kategori_berita')->insert([
            "uuid" => uuid_create(),
            "name" => $req->input("name"),
            "user_id" => $req->input("user"),
            "slug" => $req->input("slug")
        ]);

        return response()->json(['success' => true]);
    }

    public function removeNewsCategory(Request $req, $id)
    {
        DB::table('kategori_berita')->where("uuid", $id)->delete();

        return response()->json(['success' => true]);
    }

    public function getActivities(Request $req)
    {
        $total = DB::table('kegiatan')->count();

        if ($req->query('limit') && $req->query('page')) {
            // pagination data
            $offset = $req->query('page') * 5 - 5;

            $data = DB::table('kegiatan')
                ->limit($req->query('limit'))
                ->offset($offset);
        } else if ($req->query('limit') && !$req->query('offset')) {
            // latest news
            $data = DB::table('kegiatan')
                ->limit($req->query('limit'));
        } else {
            $data = DB::table('kegiatan');
        }

        $data = $data->join('user', 'kegiatan.user_id', '=', 'user.uuid')->select("kegiatan.*", "user.email", "user.name");
        $data = $data->orderBy('date', 'desc')->get();

        return response()->json([
            "data" => $data,
            "total" => $total,
        ]);
    }

    public function findActivities($id)
    {
        $data = DB::table('kegiatan')->where("uuid", $id)->first();

        return response()->json($data);
    }

    public function findActivitiesBySlug($slug)
    {
        $data = DB::table('kegiatan')
            ->join('user', 'kegiatan.user_id', '=', 'user.uuid')
            ->where("slug", $slug)->first();

        return response()->json($data);
    }

    public function addActivities(Request $req)
    {
        DB::table('kegiatan')->insert([
            "uuid" => uuid_create(),
            "title" => $req->input("title"),
            "slug" => $req->input("slug"),
            "description" => $req->input("description"),
            "content" => $req->input("content"),
            "thumbnail" => $req->input("thumbnail"),
            "user_id" => $req->input("user"),
            "date" => $req->input("date"),
            "location" => $req->input("location"),
            "created_at" => Carbon::now(),
            "updated_at" => Carbon::now()
        ]);

        return response()->json(['success' => true]);
    }

    public function updateActivities(Request $req, $id)
    {
        if (
            !DB::table('kegiatan')
                ->where("user_id", $req->input('user'))
                ->where("uuid", $id)
                ->exists()

            && !$req->input('is_admin')
        ) {
            abort(403);
        }

        $data = DB::table('kegiatan')->where("uuid", $id)->update([
            "title" => $req->input("title"),
            "description" => $req->input("description"),
            "thumbnail" => $req->input("thumbnail"),
            "date" => $req->input("date"),
            "location" => $req->input("location"),
            "content" => $req->input("content"),
            "updated_at" => Carbon::now()
        ]);

        return response()->json($data);
    }

    public function removeActivities(Request $req, $id)
    {
        DB::table('kegiatan')->where("uuid", $id)->delete();

        return response()->json(['success' => true]);
    }
}
