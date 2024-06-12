<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Firebase\JWT\JWT;
use Firebase\JWT\Key;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

class AuthController extends Controller
{
    public function login(Request $req)
    {
        $key = 'desaku89ajs';

        $user = DB::table('user')
            ->where("email", $req->input("email"))
            ->where("password", $req->input("password"))
            ->select('is_admin', "uuid")
            ->first();

        if (!$user->uuid){
            abort(403);
        }

        $payload = [
            "user" => $user->uuid,
            "is_admin" => $user->is_admin ?? null
        ];

        $jwt = JWT::encode($payload, $key, 'HS256');

        if ($user) {
            return response()->json(['token' => $jwt]);
        } else {
            return response()->json(['error' => 'Unauthorized'], 403);
        }
    }

    public function findAdmin(Request $req)
    {
        $user = DB::table('user')
            ->where("uuid", $req->input('user'))
            ->first();

        return response()->json($user);
    }

    public function findAdminById(Request $req, $id)
    {
        $user = DB::table('user')
            ->where("uuid", $id)
            ->first();

        return response()->json($user);
    }

    public function getAdmin(Request $req)
    {
        if ($req->input("is_admin") != 1) {
            abort(401, 'Unauthorized');
        }

        $users = DB::table('user')->whereNot("uuid", $req->input('user'))->orderBy('created_at', 'desc')->get();

        return response()->json($users);
    }

    public function addAdmin(Request $req)
    {
        if (!$req->input("is_admin")) {
            abort(401, 'Unauthorized');
        }

        DB::table('user')->insert([
            "uuid" => uuid_create(),
            "name" => $req->input("name"),
            "email" => $req->input("email"),
            "password" => $req->input("password"),
            "is_admin" => 0,
        ]);

        return "Success create an admin";
    }

    public function updateAdmin(Request $req, $id)
    {
        if (!$req->input("is_admin")) {
            abort(401, 'Unauthorized');
        }

        DB::table('user')->where("uuid", $id)->update([
            "name" => $req->input("name"),
            "email" => $req->input("email"),
            "password" => $req->input("password"),
        ]);

        return "Success update an admin";
    }

    public function updateAdminProfile(Request $req)
    {
        DB::table('user')->where("uuid", $req->input("user"))->update([
            "name" => $req->input("name"),
            "email" => $req->input("email"),
            "password" => $req->input("password"),
        ]);

        return "Success update an admin";
    }

    public function resetPassword(Request $req)
    {
        $token = str_replace('-', '', uuid_create());

        if (!DB::table('user')->where("email", $req->input('email'))->exists()){
            abort(404);
        }

        DB::table('reset_password')->insert([
            "uuid" => uuid_create(),
            "token" => $token,
            "email" => $req->input("email"),
            "created_at" => Carbon::now(),
            "expired_at" => Carbon::now()->addHour(),
        ]);

        $mail = new PHPMailer(true);

        try {
            $mail->isSMTP();
            $mail->Host = 'smtp.gmail.com';
            $mail->SMTPAuth = true;
            $mail->Username = env('MAIL_EMAIL');
            $mail->Password = env('MAIL_PASSWORD');
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
            $mail->Port = 587;

            // Recipients
            $mail->setFrom(env('MAIL_EMAIL'), env('APP_NAME'));
            $mail->addAddress($req->input('email'));

            // Content
            $mail->isHTML(true);
            $mail->Subject = 'Reset Password ' .  env('APP_NAME');
            $mail->Body = 'Hello ' . $req->input('email') . ' ! <br> <br> Silahkan reset password anda melalui link di bawah ini, link dibawah akan kadaluarsa dalam 1 jam. <br> <br>' . env('APP_FE_URL') . '/auth/forgot-password?token=' . $token;

            $mail->send();
            echo 'Message has been sent';
        } catch (Exception $e) {
            echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
        }
    }

    public function verifyResetPassword(Request $req)
    {
        $reset_token = DB::table('reset_password')->where("token", $req->input("token"))->first(["expired_at", "email"]);

        if (Carbon::now()->lt(Carbon::parse($reset_token->expired_at))) {
            DB::table('user')->where("email", $reset_token->email)->update(["password" => $req->input("password")]);
        }

        return "Success reset password";
    }
}
