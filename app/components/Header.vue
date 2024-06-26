<script setup>
import { onMounted, reactive } from 'vue';
import { onClickOutside } from '@vueuse/core'

const headerActive = ref(false)
const windowWidth = ref(null)
const navMobile = ref(false)
const target = ref(null)
const navSelected = ref(null)

const headerData = reactive({
    no_telp: null,
    email: null,
    logo: null,
    site_name: null,
    description: null,
})

onMounted(async () => {
    window.addEventListener('scroll', function () {
        if (window.scrollY > document.getElementById('header').offsetHeight) {
            headerActive.value = true
        } else {
            headerActive.value = false
        }
    })

    window.addEventListener('resize', function () {
        windowWidth.value = window.innerWidth
    });
})

const data = await $fetch('/api/header')

headerData.no_telp = data.no_telp
headerData.email = data.email
headerData.site_name = data.site_name
headerData.description = data.description
headerData.logo = data.logo

function openNavMobile() {
    navMobile.value = !navMobile.value

    if (navMobile.value) {
        document.documentElement.classList.add('overflow-hidden');
    } else {
        document.documentElement.classList.remove('overflow-hidden');
    }
}

function changePage() {
    navMobile.value = false
    document.documentElement.classList.remove('overflow-hidden');
    setTimeout(() => {
        if (navSelected.value == "/") {
            useRouter().push('/')
            return
        }
        useRouter().push(`/${navSelected.value}`)
    }, 500)
}

onClickOutside(target, event => {
    navMobile.value = false
    document.documentElement.classList.remove('overflow-hidden');
})

definePageMeta({
    layout: false
});
</script>
<script>
export default {
    data: () => ({
        open: ['Users'],
        admins: [
            ['Management'],
            ['Settings'],
        ],
        cruds: [
            ['Create'],
            ['Read'],
            ['Update'],
            ['Delete'],
        ],
        items: [
            { type: 'header', title: 'Beranda', value: "/" },
            { type: 'divider' },
            { type: 'header', title: 'Potensi Desa', value: 'potensi-desa' },
            { type: 'subheader', title: 'Profil Desa' },
            {
                title: 'Tentang Desa',
                value: 'tentang-desa',
            },
            {
                title: 'Visi & Misi',
                value: 'visi-misi',
            },
            {
                title: 'Sejarah Desa',
                value: 'sejarah-desa',
            },
            { type: 'divider' },
            { type: 'subheader', title: 'Pemerintahan' },
            {
                title: 'Struktur Organisasi',
                value: 'struktur-organisasi',
            },
            {
                title: 'Perangkat Desa',
                value: 'perangkat-desa',
            },
            {
                title: 'Lembaga Desa',
                value: 'lembaga-desa',
            },
            { type: 'divider' },
            { type: 'subheader', title: 'Informasi Publik' },
            {
                title: 'Galeri',
                value: 'galeri',
            },
            {
                title: 'Berita',
                value: 'berita',
            },
            {
                title: 'Pengumuman',
                value: 'pengumuman',
            },
            {
                title: 'Kegiatan',
                value: 'kegiatan',
            },
        ],
    }),
}
</script>
<template>
    <Transition>
        <div ref="target" v-if="navMobile" class="bg-white shadow-lg min-h-screen fixed w-3/4 right-0"
            style="z-index: 9999;">
            <div class="block min-h-screen pb-10 px-3 py-4">
                <div class="flex justify-between cursor-pointer border-b border-slate-200 pb-4">
                    <div class="flex-none flex" @click="$router.push('/')">
                        <img width="40" :src="headerData.logo" alt="">
                        <div class="ml-3 block font-semibold">
                            <div>
                                <span>{{ headerData.site_name }}</span>
                            </div>
                            <div class="text-sm">
                                <span>{{ headerData.description }}</span>
                            </div>
                        </div>
                    </div>
                    <div class="flex items-center" @click="openNavMobile">
                        <svg xmlns="http://www.w3.org/2000/svg" width="2em" height="2em" viewBox="0 0 28 28">
                            <path fill="black"
                                d="M20.48 3.512a11.966 11.966 0 0 0-8.486-3.514C5.366-.002-.007 5.371-.007 11.999c0 3.314 1.344 6.315 3.516 8.487A11.966 11.966 0 0 0 11.995 24c6.628 0 12.001-5.373 12.001-12.001c0-3.314-1.344-6.315-3.516-8.487m-1.542 15.427a9.789 9.789 0 0 1-6.943 2.876c-5.423 0-9.819-4.396-9.819-9.819a9.789 9.789 0 0 1 2.876-6.943a9.786 9.786 0 0 1 6.942-2.876c5.422 0 9.818 4.396 9.818 9.818a9.785 9.785 0 0 1-2.876 6.942z" />
                            <path fill="black"
                                d="m13.537 12l3.855-3.855a1.091 1.091 0 0 0-1.542-1.541l.001-.001l-3.855 3.855l-3.855-3.855A1.091 1.091 0 0 0 6.6 8.145l-.001-.001l3.855 3.855l-3.855 3.855a1.091 1.091 0 1 0 1.541 1.542l.001-.001l3.855-3.855l3.855 3.855a1.091 1.091 0 1 0 1.542-1.541l-.001-.001z" />
                        </svg>
                    </div>
                </div>
                <div class="h-screen">
                    <v-list selectable v-model:selected="navSelected" @update:selected="changePage">
                        <v-list-item title="Beranda" value=""></v-list-item>
                        <v-list-item title="Potensi Desa" value="potensi-desa"></v-list-item>

                        <v-list-group>
                            <template v-slot:activator="{ props }">
                                <v-list-item v-bind="props" title="Profil Desa"></v-list-item>
                            </template>

                            <v-list-item title="Tentang Desa" value="tentang-desa"></v-list-item>
                            <v-list-item title="Visi Misi" value="visi-misi"></v-list-item>
                            <v-list-item title="Sejarah Desa" value="sejarah-desa"></v-list-item>
                        </v-list-group>
                        <v-list-group>
                            <template v-slot:activator="{ props }">
                                <v-list-item v-bind="props" title="Pemerintahan"></v-list-item>
                            </template>

                            <v-list-item title="Struktur Organisasi" value="struktur-organisasi"></v-list-item>
                            <v-list-item title="Lembaga Desa" value="lembaga-desa"></v-list-item>
                            <v-list-item title="Perangkat Desa" value="perangkat-desa"></v-list-item>
                        </v-list-group>
                        <v-list-group>
                            <template v-slot:activator="{ props }">
                                <v-list-item v-bind="props" title="Informasi Publik"></v-list-item>
                            </template>

                            <v-list-item title="Berita" value="berita"></v-list-item>
                            <v-list-item title="Pengumuman" value="pengumuman"></v-list-item>
                            <v-list-item title="Kegiatan" value="kegiatan"></v-list-item>
                            <v-list-item title="Galeri Desa" value="galeri"></v-list-item>
                        </v-list-group>
                    </v-list>
                </div>
            </div>
        </div>
    </Transition>
    <div id="header" class="surface-0 flex justify-content-center">
        <div id="home" class="w-100 overflow-hidden justify-between">
            <div class="flex w-full px-[1rem] sm:px-[6rem] md:px-[3rem] lg:px-[10rem] xl:px-[14rem] bg-[#0088CC] py-2">
                <div class="flex items-center mr-3">
                    <svg xmlns="http://www.w3.org/2000/svg" width="1.5em" height="1em" viewBox="0 0 24 24">
                        <path fill="white"
                            d="m16.556 12.906l-.455.453s-1.083 1.076-4.038-1.862s-1.872-4.014-1.872-4.014l.286-.286c.707-.702.774-1.83.157-2.654L9.374 2.86C8.61 1.84 7.135 1.705 6.26 2.575l-1.57 1.56c-.433.432-.723.99-.688 1.61c.09 1.587.808 5 4.812 8.982c4.247 4.222 8.232 4.39 9.861 4.238c.516-.048.964-.31 1.325-.67l1.42-1.412c.96-.953.69-2.588-.538-3.255l-1.91-1.039c-.806-.437-1.787-.309-2.417.317" />
                    </svg>
                    <div class="ml-1 text-sm md:text-base text-white">
                        {{ headerData.no_telp ?? '-' }}
                    </div>
                </div>
                <div class="flex text-sm md:text-base items-center">
                    <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24">
                        <path fill="white"
                            d="m20 8l-8 5l-8-5V6l8 5l8-5m0-2H4c-1.11 0-2 .89-2 2v12a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2" />
                    </svg>
                    <div class="text-white ml-2">
                        {{ headerData.email ?? '-' }}
                    </div>
                </div>
            </div>
            <div :class="{ 'fixed top-0 z-50 animation': headerActive }"
                class="py-4 px-[1rem] sm:px-[6rem] md:px-[3rem] lg:px-[10rem] xl:px-[14rem] w-full flex items-center bg-white/80 backdrop-blur-sm justify-between top-8">
                <div class="flex cursor-pointer" @click="$router.push('/')">
                    <img width="40" :src="headerData.logo" alt="">
                    <div class="ml-3 block font-semibold">
                        <div>
                            <span>{{ headerData.site_name }}</span>
                        </div>
                        <div class="text-sm">
                            <span>{{ headerData.description }}</span>
                        </div>
                    </div>
                </div>

                <div class="items-center justify-between flex px-0 md:px-6 lg:px-0 z-2">
                    <ul class="list-none p-0 m-0 items-center select-none md:flex hidden cursor-pointer">
                        <div @click="$router.push('/')" class="font-semibold text-[#0088CC] mr-5 border-slate-300">
                            Beranda</div>
                        <div @click="$router.push('/potensi-desa')"
                            class="font-semibold text-[#0088CC] mr-5 border-slate-300">
                            Potensi Desa</div>
                        <div class="mr-3">
                            <v-menu open-on-hover>
                                <template v-slot:activator="{ props }">
                                    <div v-bind="props" class="flex font-semibold text-[#0088CC] items-center">
                                        <span>Profil Desa</span>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em"
                                            viewBox="0 0 24 24">
                                            <path fill="#0088CC" fill-rule="evenodd"
                                                d="M7 9a1 1 0 0 0-.707 1.707l5 5a1 1 0 0 0 1.414 0l5-5A1 1 0 0 0 17 9z"
                                                clip-rule="evenodd" />
                                        </svg>
                                    </div>
                                </template>

                                <div
                                    class="block border-t-4 border-[#0088CC] shadow-md rounded-md cursor-pointer mt-4 bg-white px-4 py-5">
                                    <div @click="$router.push('/tentang-desa')"
                                        class="mb-2 border-b border-slate-300 pb-3">
                                        Tentang Desa</div>
                                    <div @click="$router.push('/visi-misi')"
                                        class="mb-2 border-b border-slate-300 pb-3">
                                        Visi & Misi</div>
                                    <div @click="$router.push('/sejarah-desa')">Sejarah Desa</div>
                                </div>
                            </v-menu>
                        </div>
                        <div class="mr-3">
                            <v-menu open-on-hover>
                                <template v-slot:activator="{ props }">
                                    <div v-bind="props" class="flex font-semibold text-[#0088CC] items-center">
                                        <span>Pemerintahan</span>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em"
                                            viewBox="0 0 24 24">
                                            <path fill="#0088CC" fill-rule="evenodd"
                                                d="M7 9a1 1 0 0 0-.707 1.707l5 5a1 1 0 0 0 1.414 0l5-5A1 1 0 0 0 17 9z"
                                                clip-rule="evenodd" />
                                        </svg>
                                    </div>
                                </template>

                                <div
                                    class="block border-t-4 border-[#0088CC] shadow-md rounded-md cursor-pointer mt-4 bg-white px-4 py-5">
                                    <div @click="$router.push('/struktur-organisasi')"
                                        class="mb-2 border-b border-slate-300 pb-3">
                                        Struktur Organisasi</div>
                                    <div @click="$router.push('/lembaga-desa')"
                                        class="mb-2 border-b border-slate-300 pb-3">
                                        Lembaga Desa</div>
                                    <div @click="$router.push('/perangkat-desa')">Perangkat Desa</div>
                                </div>
                            </v-menu>
                        </div>
                        <div class="mr-3">
                            <v-menu open-on-hover>
                                <template v-slot:activator="{ props }">
                                    <div v-bind="props" class="flex font-semibold text-[#0088CC] items-center">
                                        <span>Informasi Publik</span>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em"
                                            viewBox="0 0 24 24">
                                            <path fill="#0088CC" fill-rule="evenodd"
                                                d="M7 9a1 1 0 0 0-.707 1.707l5 5a1 1 0 0 0 1.414 0l5-5A1 1 0 0 0 17 9z"
                                                clip-rule="evenodd" />
                                        </svg>
                                    </div>
                                </template>

                                <div
                                    class="block border-t-4 border-[#0088CC] shadow-md rounded-md cursor-pointer mt-4 bg-white px-4 py-5">
                                    <div @click="$router.push('/galeri')" class="mb-2 border-b border-slate-300 pb-3">
                                        Galeri</div>
                                    <div @click="$router.push('/berita')" class="mb-2 border-b border-slate-300 pb-3">
                                        Berita</div>
                                    <div @click="$router.push('/pengumuman')"
                                        class="mb-2 border-b border-slate-300 pb-3">
                                        Pengumuman</div>
                                    <div @click="$router.push('/kegiatan')">
                                        Kegiatan</div>
                                </div>
                            </v-menu>
                        </div>
                    </ul>
                    <div @click="openNavMobile" class="md:hidden cursor-pointer bg-[#0088CC] pa-2 rounded-lg">
                        <svg xmlns="http://www.w3.org/2000/svg" width="1.5em" height="1.5em" viewBox="0 0 24 24">
                            <path fill="white"
                                d="M22 18.005c0 .55-.446.995-.995.995h-8.01a.995.995 0 0 1 0-1.99h8.01c.55 0 .995.445.995.995M22 12c0 .55-.446.995-.995.995H2.995a.995.995 0 1 1 0-1.99h18.01c.55 0 .995.446.995.995m-.995-5.01a.995.995 0 0 0 0-1.99H8.995a.995.995 0 1 0 0 1.99z" />
                        </svg>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<style>
.v-enter-from {
    height: 100vh;
    width: 0;
}

.v-enter-to {
    width: 75%;
}

.v-leave-from {
    width: 75%;
}

.v-leave-to {
    width: 0;
}

.v-leave-active {
    transition: all 0.5s ease;
}

.v-enter-active {
    transition: all 0.5s ease;
}

.animation {
    animation: fade-out 0.5s ease-out;
}

@keyframes fade-out {
    from {
        opacity: 0;
    }

    to {
        opacity: 1;
    }
}
</style>