<?php

use App\Http\Controllers\GambarBerandaController;
use App\Http\Controllers\InformasiPublikController;
use App\Http\Controllers\LembagaController;
use App\Http\Controllers\LokasiDesaController;
use App\Http\Controllers\PerangkatDesaController;
use App\Http\Controllers\PotensiDesaController;
use App\Http\Controllers\JabatanController;
use App\Http\Controllers\ProfilDesaController;
use App\Http\Controllers\ImageController;
use App\Http\Controllers\GambarGaleriController;
use App\Http\Controllers\SosialMediaController;
use App\Http\Controllers\StrukturOrganisasiController;
use App\Http\Controllers\VideoGaleriController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\FooterController;
use App\Http\Controllers\HeaderController;
use App\Http\Controllers\AlamatController;
use Illuminate\Support\Facades\Route;

// Authentication
Route::post('/auth/login', [AuthController::class, 'login']);
Route::post('/reset-password', [AuthController::class, 'resetPassword']);
Route::post('/reset-password/verify', [AuthController::class, 'verifyResetPassword']);

// Public
Route::get('/visi', [ProfilDesaController::class, 'getVisi']);
Route::get('/tentang', [ProfilDesaController::class, 'getTentang']);
Route::get('/sejarah', [ProfilDesaController::class, 'getSejarah']);
Route::get('/news', [InformasiPublikController::class, 'getNews']);
Route::get('/news/{id}', [InformasiPublikController::class, 'findNews']);
Route::get('/news/slug/{id}', [InformasiPublikController::class, 'findNewsBySlug']);
Route::get('/announcement', [InformasiPublikController::class, 'getAnnouncement']);
Route::get('/announcement/{id}', [InformasiPublikController::class, 'findAnnouncement']);
Route::get('/announcement/slug/{id}', [InformasiPublikController::class, 'findAnnouncementBySlug']);
Route::get('/activities', [InformasiPublikController::class, 'getActivities']);
Route::get('/activities/{id}', [InformasiPublikController::class, 'findActivities']);
Route::get('/activities/slug/{id}', [InformasiPublikController::class, 'findActivitiesBySlug']);
Route::get('/news-category', [InformasiPublikController::class, 'getNewsCategory']);
Route::get('/news-category/{id}', [InformasiPublikController::class, 'findNewsCategory']);
Route::get('/potensi-category', [PotensiDesaController::class, 'getPotensiCategory']);
Route::get('/potensi-category/{id}', [PotensiDesaController::class, 'findPotensiCategory']);
Route::get('/image-homepage', [GambarBerandaController::class, 'getImageHomepage']);
Route::get('/image-gallery', [GambarGaleriController::class, 'getImageGallery']);
Route::get('/image-gallery/{id}', [GambarGaleriController::class, 'findImageGallery']);
Route::get('/location', [LokasiDesaController::class, 'getLocation']);
Route::get('/video-gallery', [VideoGaleriController::class, 'getVideoGallery']);
Route::get('/footer', [FooterController::class, 'getFooter']);
Route::get('/social-media', [SosialMediaController::class, 'getSocialMedia']);
Route::get('/address', [AlamatController::class, 'getAlamat']);
Route::get('/header', [HeaderController::class, 'getHeader']);
Route::get('/image', [ImageController::class, 'get']);
Route::get('/perangkat-desa', [PerangkatDesaController::class, 'getPerangkatDesa']);
Route::get('/perangkat-desa/{id}', [PerangkatDesaController::class, 'findPerangkatDesa']);
Route::get('/perangkat-desa/slug/{slug}', [PerangkatDesaController::class, 'findPerangkatDesaBySlug']);
Route::get('/potensi-desa', [PotensiDesaController::class, 'getPotensiDesa']);
Route::get('/potensi-desa/{id}', [PotensiDesaController::class, 'findPotensiDesa']);
Route::get('/potensi-desa/slug/{slug}', [PotensiDesaController::class, 'findPotensiDesaByCategory']);
Route::get('/lembaga', [LembagaController::class, 'getLembaga']);
Route::get('/lembaga/{id}', [LembagaController::class, 'findLembaga']);
Route::get('/lembaga/slug/{slug}', [LembagaController::class, 'findLembagaBySlug']);
Route::get('/jabatan', [JabatanController::class, 'getJabatan']);
Route::get('/jabatan/{id}', [JabatanController::class, 'findJabatan']);
Route::get('/struktur-organisasi', [StrukturOrganisasiController::class, 'getStrukturOrganisasi']);
Route::get('/jabatan/perangkat/{id}', [JabatanController::class, 'findJabatanPerangkat']);

// Jwt Authnetication
Route::middleware(['jwt'])->group(function () {
    Route::post('/visi', [ProfilDesaController::class, 'updateVisi']);
    Route::post('/tentang', [ProfilDesaController::class, 'updateTentang']);
    Route::post('/sejarah', [ProfilDesaController::class, 'updateSejarah']);
    Route::post('/news', [InformasiPublikController::class, 'addNews']);
    Route::post('/announcement', [InformasiPublikController::class, 'addAnnouncement']);
    Route::post('/activities', [InformasiPublikController::class, 'addActivities']);
    Route::post('/news-category', [InformasiPublikController::class, 'addNewsCategory']);
    Route::post('/image-homepage', [GambarBerandaController::class, 'addImageHomepage']);
    Route::post('/image-gallery', [GambarGaleriController::class, 'addImageGallery']);
    Route::post('/video-gallery', [VideoGaleriController::class, 'addVideoGallery']);
    Route::post('/perangkat-desa', [PerangkatDesaController::class, 'addPerangkatDesa']);
    Route::post('/potensi-desa', [PotensiDesaController::class, 'addPotensiDesa']);
    Route::post('/potensi-category', [PotensiDesaController::class, 'addPotensiCategory']);
    Route::post('/lembaga', [LembagaController::class, 'addLembaga']);
    Route::post('/jabatan', [JabatanController::class, 'addJabatan']);
    Route::post('/image', [ImageController::class, 'upload']);
    Route::post('/social-media', [SosialMediaController::class, 'updateSocialMedia']);
    Route::post('/address', [AlamatController::class, 'updateAlamat']);

    Route::patch('/announcement/{id}', [InformasiPublikController::class, 'updateAnnouncement']);
    Route::patch('/activities/{id}', [InformasiPublikController::class, 'updateActivities']);
    Route::patch('/news/{id}', [InformasiPublikController::class, 'updateNews']);
    Route::patch('/news-category/{id}', [InformasiPublikController::class, 'updateNewsCategory']);
    Route::patch('/location', [LokasiDesaController::class, 'updateLocation']);
    Route::patch('/footer', [FooterController::class, 'updateFooter']);
    Route::patch('/perangkat-desa/{id}', [PerangkatDesaController::class, 'updatePerangkatDesa']);
    Route::patch('/potensi-desa/{id}', [PotensiDesaController::class, 'updatePotensiDesa']);
    Route::patch('/potensi-category/{id}', [PotensiDesaController::class, 'updatePotensiCategory']);
    Route::patch('/jabatan/order', [JabatanController::class, 'updateOrderJabatan']);
    Route::patch('/jabatan/{id}', [JabatanController::class, 'updateJabatan']);
    Route::patch('/header', [HeaderController::class, 'updateHeader']);
    Route::patch('/lembaga/{id}', [LembagaController::class, 'updateLembaga']);
    Route::patch('/image-gallery/{id}', [GambarGaleriController::class, 'updateImageGallery']);
    Route::patch('/struktur-organisasi', [StrukturOrganisasiController::class, 'updateStrukturOrganisasi']);

    Route::delete('/news/{id}', [InformasiPublikController::class, 'removeNews']);
    Route::delete('/announcement/{id}', [InformasiPublikController::class, 'removeAnnouncement']);
    Route::delete('/activities/{id}', [InformasiPublikController::class, 'removeActivities']);
    Route::delete('/news-category/{id}', [InformasiPublikController::class, 'removeNewsCategory']);
    Route::delete('/image-homepage/{id}', [GambarBerandaController::class, 'removeImageHomepage']);
    Route::delete('/image/{file}', [ImageController::class, 'remove']);
    Route::delete('/perangkat-desa/{id}', [PerangkatDesaController::class, 'removePerangkatDesa']);
    Route::delete('/potensi-desa/{id}', [PotensiDesaController::class, 'removePotensiDesa']);
    Route::delete('/potensi-category/{id}', [PotensiDesaController::class, 'removePotensiCategory']);
    Route::delete('/jabatan/{id}', [JabatanController::class, 'removeJabatan']);
    Route::delete('/image-gallery/{id}', [GambarGaleriController::class, 'removeImageGallery']);
    Route::delete('/video-gallery/{id}', [VideoGaleriController::class, 'removeVideoGallery']);
    Route::delete('/lembaga/{id}', [LembagaController::class, 'removeLembaga']);

    // admin profile
    Route::get('/admin', [AuthController::class, 'findAdmin']);
    Route::get('/admin/{id}', [AuthController::class, 'findAdminById']);
    Route::post('/admin', [AuthController::class, 'addAdmin']);
    Route::patch('/admin/{id}', [AuthController::class, 'updateAdmin']);
    Route::patch('/admin-profile', [AuthController::class, 'updateAdminProfile']);
    Route::get('/admin/list/all', [AuthController::class, 'getAdmin']);
});