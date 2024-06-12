<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SosialMediaController extends Controller
{
    public function getSocialMedia()
    {
        $data =  DB::table('sosial_media')->get();

        return response()->json($data);
    }

    public function updateSocialMedia(Request $req)
    {
        DB::table('sosial_media')->delete();
        DB::table('sosial_media')->insert($req->input('social_media'));

        return response()->json(['success' => true]);
    }
}
