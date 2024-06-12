<script setup>
useHead({
    title: 'Visi Misi',
})
</script>
<script>
export default {
    data() {
        return {
            data: null,
            renderRichEditor: false,
            loading: false,
            toastSuccess: false
        }
    },
    async mounted() {
        const data = await $fetch(this.$config.public.API_PUBLIC_URL + '/api/visi')
        this.data = data.visi
        this.renderRichEditor = true
    },
    methods: {
        async updateContent() {
            this.loading = true
            await $fetch(this.$config.public.API_PUBLIC_URL + '/api/visi', {
                method: "POST",
                headers: {
                    Authorization: "Bearer " + useToken().token
                },
                body: {
                    content: this.data
                }
            })
            this.loading = false
            this.toastSuccess = true
        },
        contentChange(v){
            this.data = v
        }
    }
}
</script>

<template>
    <v-snackbar v-model="toastSuccess" color="#10B981" :timeout="2500">
        Data berhasil diperbarui!
        <template v-slot:actions>
            <v-btn color="white" variant="text" @click="toastSuccess = false">
                Tutup
            </v-btn>
        </template>
    </v-snackbar>
    <div class="text-2xl font-semibold mb-2">Visi Misi</div>
    <div class="grid animate-fade">
        <div class="col-12">
            <div class="card">
                <h3 class="mb-3 text-xl font-medium">Konten</h3>
                <RichEditor v-if="renderRichEditor" :data="data" @contentChange="contentChange"/>
                <v-btn @click="updateContent" color="#10B981" class="mt-4 text-white px-3 py-2">
                    <span class="capitalize" v-if="!loading">Submit</span>
                    <Loader v-else />
                </v-btn>
            </div>
        </div>
    </div>
</template>
